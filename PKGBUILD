# Maintainer: rezky_nightky <rezky2399@proton.me>
pkgname=nestkit-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Small Linux terminal toolkit for tracing paths, ports, env, recent files, and services"
arch=('x86_64' 'aarch64')
url="https://github.com/oxyzenQ/nestkit"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('nestkit')
conflicts=('nestkit')
options=('!strip')
source=()
sha512sums=()

prepare() {
  local tag="v${pkgver}"
  local asset

  case "${CARCH}" in
    x86_64)
      asset="nestkit-bin-${tag}-linux-x86_64.tar.gz"
      ;;
    aarch64)
      asset="nestkit-bin-${tag}-linux-aarch64.tar.gz"
      ;;
    *)
      echo "unsupported architecture: ${CARCH}" >&2
      return 1
      ;;
  esac

  local base_url="https://github.com/oxyzenQ/nestkit/releases/download/${tag}"
  curl -fL -o "${asset}" "${base_url}/${asset}"
  curl -fL -o "${asset}.sha512" "${base_url}/${asset}.sha512"
  sha512sum --check "${asset}.sha512"
  mkdir -p "${srcdir}/archive"
  tar -xzf "${asset}" -C "${srcdir}/archive"
}

package() {
  install -Dm755 "${srcdir}/archive/nestkit" "${pkgdir}/usr/bin/nestkit"
  install -Dm644 "${srcdir}/archive/LICENSE" "${pkgdir}/usr/share/licenses/nestkit-bin/LICENSE"
  install -Dm644 "${srcdir}/archive/README.md" "${pkgdir}/usr/share/doc/nestkit-bin/README.md"
}
