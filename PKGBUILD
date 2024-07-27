# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="snake-asm"
pkgname="${_pkgname}-git"
pkgver=0.4.1.r1.gb695abd
pkgrel=1
pkgdesc="Terminal-based snake game written in x86_64 assembly"
arch=('x86_64')
url="https://github.com/NikitaIvanovV/${_pkgname}"
license=('MIT')
makedepends=('git' 'make' 'nasm')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git"
        "fix_ldflags.patch")
sha256sums=('SKIP'
            'b4f36aad672175334b00dc80b9d1b3d532bd1577e6cf2ab8e8193142ec833310')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -p1 -i "${srcdir}/fix_ldflags.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  # unset LDFLAGS
  make 
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
