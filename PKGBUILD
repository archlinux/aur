# Maintainer: user (domovoy fleet)
#
# t3-code-docker — headless T3 Code server in a Docker container, one
# container per opencode target. Enables running multiple T3 instances
# (each targeting a different opencode server) on one machine without
# fighting T3 Code's Electron single-instance / hardcoded userData path
# behavior.
#
# Build-time env vars:
#   T3_INSTANCE_NAME  — package name (default: t3-code-docker).
#                       Set to e.g. t3-code-domovoy, t3-code-user for
#                       side-by-side installs.
#   T3_PORT           — HTTP/WebSocket port this instance binds
#                       (default: 3773 = T3's native default).
#
# Example custom-name build:
#   T3_INSTANCE_NAME=t3-code-domovoy T3_PORT=3775 makepkg -s
#

_default_name=t3-code-docker
_default_port=3773

pkgname="${T3_INSTANCE_NAME:-$_default_name}"
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
  '4d6122afe24fb5b3bca36154036ca6b230abfd409b6b7dcfea461d33e9627803'
)

_image_tag="t3-code:${pkgver}"

build() {
  cd "$srcdir"

  # docker build needs the vendored t3 tgz alongside the Dockerfile.
  cp "t3-${pkgver}.tgz" ./t3.tgz

  # Build the image. Same tag regardless of pkgname so multiple installs
  # share one image on disk (docker load is idempotent on identical layers).
  docker build --network=host -t "${_image_tag}" .

  # Export the image so the package can carry it. zstd -19 gives good
  # compression without exotic tooling.
  docker save "${_image_tag}" | zstd -19 -T0 > image.tar.zst

  # Substitute PKGNAME / PORT / IMAGE into the templates.
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

  # Dockerfile for reference / user rebuild if desired
  install -Dm644 Dockerfile \
    "${pkgdir}/usr/share/${pkgname}/Dockerfile"

  # systemd --user unit — name matches pkgname so multiple installs coexist
  install -Dm644 t3-code.service \
    "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

  # Helper CLI
  install -Dm755 t3-code-ctl \
    "${pkgdir}/usr/bin/${pkgname}-ctl"

  # Install script (docker load + post-install notes)
  # Not installed to $pkgdir; consumed by pacman via install=t3-code.install
  # in PKGBUILD source.
}
