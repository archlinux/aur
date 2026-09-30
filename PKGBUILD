# Maintainer: duanluan <duanluan@outlook.com>

pkgname=evox
_pkgname=evox
pkgver=1.1.0.beta.21
pkgrel=2
_upstream_ver=1.1.0-beta.21
pkgdesc='EvoMap EvoX self-evolving swarm coding agent (beta channel)'
arch=('x86_64' 'aarch64')
url='https://evomap.ai/zh/evox/beta'
license=('LicenseRef-Proprietary')
depends=('glibc' 'hicolor-icon-theme')
options=('!strip')
source=('evox.desktop' 'evox.svg')
source_x86_64=("${_pkgname}-linux-v${_upstream_ver}-x86_64-unknown-linux-gnu.tar.gz::https://res.evomap.ai/downloads/evox-linux/releases/1.1.0-beta.21/evox-linux-v1.1.0-beta.21-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-linux-v${_upstream_ver}-aarch64-unknown-linux-gnu.tar.gz::https://res.evomap.ai/downloads/evox-linux/releases/1.1.0-beta.21/evox-linux-v1.1.0-beta.21-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('6d17e33a32800caacd531478740d608435a17890696a45415587cde071306197' '66263030a4ff6e1032486bfdd92ff04c9feba0f5b711f618837ef380b9e9236a')
sha256sums_x86_64=('56c8c51d098e0f91bbd05bc36b3d5cb58e334ef98660531d2ec3e997a38ade24')
sha256sums_aarch64=('8ae200eb0621cfedd9dcd2fa471e527b09e2a3a7f93dfd7cb83a5b7f2ad4cd74')

package() {
  local bundle_dir

  case "${CARCH}" in
    x86_64)
      bundle_dir="${srcdir}/${_pkgname}-linux-v${_upstream_ver}-x86_64-unknown-linux-gnu"
      ;;
    aarch64)
      bundle_dir="${srcdir}/${_pkgname}-linux-v${_upstream_ver}-aarch64-unknown-linux-gnu"
      ;;
    *)
      printf 'unsupported architecture: %s\n' "${CARCH}" >&2
      return 1
      ;;
  esac

  # The release archive is an installer transport, not a runnable layout:
  # the binary reads its release-bound entitlement from <agent-dir> and
  # never looks next to itself, so keep the payload under /usr/lib and let
  # the /usr/bin launcher provision ~/.evox/agent per user.
  install -Dm755 "${bundle_dir}/evox" "${pkgdir}/usr/lib/${_pkgname}/evox"
  install -Dm644 "${bundle_dir}/entitlement.json" "${pkgdir}/usr/lib/${_pkgname}/entitlement.json"
  install -dm755 "${pkgdir}/usr/lib/${_pkgname}/extensions"
  install -m644 "${bundle_dir}/extensions/"* "${pkgdir}/usr/lib/${_pkgname}/extensions/"
  printf '%s\n' "${pkgver}" > "${pkgdir}/usr/lib/${_pkgname}/version"

  # upstream ships no Linux desktop entry; launch the TUI in a terminal
  install -Dm644 "${srcdir}/evox.desktop" "${pkgdir}/usr/share/applications/evox.desktop"
  install -Dm644 "${srcdir}/evox.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/evox.svg"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'SCRIPT'
#!/bin/sh
# evox package launcher: provisions the per-user EvoX agent directory
# (~/.evox/agent by default) with the packaged entitlement and signed
# extensions, then execs the pacman-managed binary.
set -eu

lib_dir=/usr/lib/evox
packaged_version="$(cat "${lib_dir}/version" 2>/dev/null || printf 'unknown')"

agent_dir="${EVOX_CODING_AGENT_DIR:-${EVOX_AGENT_DIR:-${HOME}/.evox/agent}}"
case "${agent_dir}" in
  '~') agent_dir="${HOME}" ;;
  '~/'*) agent_dir="${HOME}/${agent_dir#~/}" ;;
esac

stamp_file="${agent_dir}/.evox-stamp"

if [ "$(cat "${stamp_file}" 2>/dev/null)" != "${packaged_version}" ]; then
  mkdir -p "${agent_dir}/extensions"

  # drop extensions copied from an older packaged release
  for f in "${agent_dir}/extensions"/libevox_ext_*.so \
           "${agent_dir}/extensions"/libevox_ext_*.so.sig; do
    if [ -e "${f}" ]; then
      rm -f "${f}"
    fi
  done

  # install this release's signed extensions
  for f in "${lib_dir}/extensions"/libevox_ext_*.so; do
    if [ -e "${f}" ]; then
      name="${f##*/}"
      install -m 0644 "${f}" "${agent_dir}/extensions/${name}"
      if [ -e "${f}.sig" ]; then
        install -m 0644 "${f}.sig" "${agent_dir}/extensions/${name}.sig"
      fi
    fi
  done

  # the entitlement is release-bound; upstream installs it 0600
  install -m 0600 "${lib_dir}/entitlement.json" "${agent_dir}/entitlement.json"
  printf '%s\n' "${packaged_version}" > "${stamp_file}"
fi

exec "${lib_dir}/evox" "$@"
SCRIPT
}
