# Maintainer: domovoy fleet <https://github.com/alexindigo/domovoy-bootstrap>
#
# t3-code-docker — headless T3 Code server in a Docker container.
# One container per target user's opencode (or other AI provider) instance.
#
# AUR slug: t3-code-docker-bin
# Installed pkgname: t3-code-docker (default) or t3-code-<user> (fleet)
#
# Container stores byte-identical settings.json across all instances.
# Per-instance differentiation happens via runtime env vars (socat proxy
# target) and docker port publishing.
#
# Build-time env vars:
#   T3_INSTANCE_USER   — linux user this instance serves; drives pkgname
#                         (default: none → pkgname=t3-code-docker).
#                         Example: domovoy → pkgname=t3-code-domovoy
#   T3_PORT            — host-side port for T3's web UI ingress
#                         (default: 3773).
#   T3_OPENCODE_URL    — operator-visible opencode HTTP URL, e.g.
#                         http://localhost:8096/ or http://<lan>:8096/.
#                         If set: opencode enabled in seed + socat spawned.
#                         If unset: opencode disabled in seed.
#   T3_CODEX_URL       — future (T3 currently CLI-only for codex).
#   T3_CLAUDE_URL      — future.
#   T3_GROK_URL        — future.
#
# Default AUR build (no env vars):
#   T3_INSTANCE_USER unset → pkgname=t3-code-docker, port 3773,
#   T3_OPENCODE_URL defaults to http://localhost:4096/.
#
# Fleet operator build (per-user instance):
#   T3_INSTANCE_USER=domovoy T3_PORT=3775 T3_OPENCODE_URL=http://localhost:4096/ makepkg -s
#   T3_INSTANCE_USER=user    T3_PORT=3776 T3_OPENCODE_URL=http://localhost:8096/ makepkg -s
#

_default_port=3773

pkgname="t3-code-${T3_INSTANCE_USER:-docker}"
provides=("${pkgname}")
_t3port="${T3_PORT:-$_default_port}"
pkgver=0.0.31
pkgrel=1
pkgdesc="T3 Code headless server in Docker (instance ${pkgname} on port ${_t3port})"
arch=('x86_64')
url='https://t3.codes'
license=('MIT')
depends=('docker' 'systemd')
makedepends=('docker' 'zstd')
install='t3-code.install'

source=(
  'Dockerfile'
  'entrypoint.sh'
  'settings-seed.json.in'
  't3-code.service.in'
  't3-code-ctl.in'
  't3-code.install'
  "https://registry.npmjs.org/t3/-/t3-${pkgver}.tgz"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  '4d6122afe24fb5b3bca36154036ca6b230abfd409b6b7dcfea461d33e9627803'
)

_image_tag="t3-code:${pkgver}"

# -----------------------------------------------------------
# Helpers for provider URL parsing
# -----------------------------------------------------------

# Extract the port from a URL like http://HOST:PORT/ or http://HOST:PORT
_url_port() { echo "${1}" | sed -E 's|^https?://[^/]+:([0-9]+)/?.*|\1|'; }

# Collect all set provider URLs and build the socat env file.
# providers.env contains one T3_<PROVIDER>_URL=... line per configured
# provider. Portable across providers — just add more calls below.
_generate_provider_env() {
  local out="$1"; shift
  mkdir -p "$(dirname "${out}")"
  > "${out}"
  for _provider in OPENCODE; do
    _var="T3_${_provider}_URL"
    _val="${!_var:-}"
    [ -n "${_val}" ] || continue
    echo "T3_${_provider}_URL=${_val}" >> "${out}"
  done
}

# Generate settings-seed.json from the template. If T3_OPENCODE_URL was
# set at build time, the opencode provider is enabled with the fixed
# container-internal serverUrl http://127.0.0.1:4096/. Otherwise opencode
# is disabled and the serverUrl line is removed.
_generate_settings_seed() {
  local template="$1" out="$2"
  if [ -n "${T3_OPENCODE_URL:-}" ]; then
    sed -e 's/@OPENCODE_ENABLED@/true/' \
        -e 's|@OPENCODE_URL@|        "serverUrl": "http://127.0.0.1:4096/",|' \
        "${template}" > "${out}"
  else
    sed -e 's/@OPENCODE_ENABLED@/false/' \
        -e '/@OPENCODE_URL@/d' \
        "${template}" > "${out}"
  fi
}

# -----------------------------------------------------------
# Standard makepkg functions
# -----------------------------------------------------------

build() {
  cd "$srcdir"

  # Generate providers.env for the .install hook
  _generate_provider_env "${srcdir}/providers.env"

  # Generate the settings seed
  cp -L settings-seed.json.in settings-seed.json.in.deref
  _generate_settings_seed settings-seed.json.in.deref "${srcdir}/settings-seed.json"

  # Dereference symlinks for docker build context
  cp -L Dockerfile Dockerfile.real && mv Dockerfile.real Dockerfile
  cp -L entrypoint.sh entrypoint.sh.real && mv entrypoint.sh.real entrypoint.sh
  cp -L "t3-${pkgver}.tgz" ./t3.tgz

  # Build docker image
  docker build --network=host -f Dockerfile -t "${_image_tag}" .

  # Export the image
  docker save "${_image_tag}" | zstd -19 -T0 > image.tar.zst

  # Substitute PKGNAME / PORT / IMAGE into the templates
  sed \
    -e "s|@PKGNAME@|${pkgname}|g" \
    -e "s|@T3_PORT@|${_t3port}|g" \
    -e "s|@IMAGE_TAG@|${_image_tag}|g" \
    -e "s|@PKGVER@|${pkgver}|g" \
    t3-code.service.in > t3-code.service

  sed \
    -e "s|@PKGNAME@|${pkgname}|g" \
    -e "s|@T3_PORT@|${_t3port}|g" \
    -e "s|@IMAGE_TAG@|${_image_tag}|g" \
    t3-code-ctl.in > t3-code-ctl
  chmod +x t3-code-ctl
}

package() {
  cd "$srcdir"

  # Docker image tarball (loaded on install by t3-code.install)
  install -Dm644 image.tar.zst \
    "${pkgdir}/usr/share/${pkgname}/image.tar.zst"

  # Dockerfile for reference
  install -Dm644 Dockerfile \
    "${pkgdir}/usr/share/${pkgname}/Dockerfile"

  # Settings seed (copied to ~/.t3/userdata/ on first start by the
  # systemd unit's ExecStartPre)
  install -Dm644 settings-seed.json \
    "${pkgdir}/usr/share/${pkgname}/settings-seed.json"

  # Provider env file (consumed by .install for UFW + systemd unit for
  # docker Environment=)
  install -Dm644 providers.env \
    "${pkgdir}/etc/${pkgname}/providers.env"

  # systemd --user unit
  install -Dm644 t3-code.service \
    "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

  # Helper CLI
  install -Dm755 t3-code-ctl \
    "${pkgdir}/usr/bin/${pkgname}-ctl"
}
