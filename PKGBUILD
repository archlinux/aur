# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=btop-git
pkgver=1.3.0.r896.3567254
pkgrel=1
pkgdesc="A monitor of resources"
arch=(x86_64)
url="https://github.com/aristocratos/btop"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('gcc' 'make' 'git')
optdepends=(
  'nvidia-utils: NVIDIA GPU support'
  'rocm-smi-lib: AMD GPU support'
)
source=("${pkgname}::git+https://github.com/aristocratos/btop.git")
sha512sums=('SKIP')
provides=('btop')
conflicts=('btop')

pkgver() {
  cd "${srcdir}/${pkgname}"
  _pkgver="$(cat CHANGELOG.md | grep '^##' | sed 's/## v//g' | head -1)"

  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"

  make GPU_SUPPORT=true RSMI_STATIC=false
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" make PREFIX=/usr install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
