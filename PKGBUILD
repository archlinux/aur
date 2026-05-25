# Maintainer: rezky_nightky <rezky2399@proton.me>
#
# Mutation policy:
# - AUR sync may update pkgver and reset pkgrel.
# - Keep release asset naming aligned with .github/workflows/release.yml.

pkgname=pidnest-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Clean Linux process tree viewer by user or UID"
arch=('x86_64' 'aarch64')
url="https://github.com/oxyzenQ/pidnest"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('pidnest')
conflicts=('pidnest')
options=('!strip')
source=()
sha512sums=()

prepare() {
  local tag="v${pkgver}"
  local asset

  case "${CARCH}" in
    x86_64)
      asset="pidnest-bin-${tag}-linux-x86_64.tar.gz"
      ;;
    aarch64)
      asset="pidnest-bin-${tag}-linux-aarch64.tar.gz"
      ;;
    *)
      printf 'unsupported architecture: %s\n' "${CARCH}" >&2
      return 1
      ;;
  esac

  local base_url="${url}/releases/download/${tag}"
  curl -fL "${base_url}/${asset}" -o "${srcdir}/${asset}"
  curl -fL "${base_url}/${asset}.sha512" -o "${srcdir}/${asset}.sha512"

  (cd "${srcdir}" && sha512sum --check "${asset}.sha512")
  mkdir -p "${srcdir}/pidnest-${CARCH}"
  tar -xzf "${srcdir}/${asset}" -C "${srcdir}/pidnest-${CARCH}"
}

package() {
  local root="${srcdir}/pidnest-${CARCH}"

  install -Dm755 "${root}/pidnest" "${pkgdir}/usr/bin/pidnest"
  install -Dm644 "${root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${root}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
