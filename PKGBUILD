# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=my_basic
pkgname=$_pkgname-git
pkgver=r1079.gc760bef
pkgrel=1
pkgdesc="BASIC interpreter"
arch=('i686' 'x86_64')
url="https://paladin-t.github.io/my_basic"
license=('MIT')
source=("$pkgname::git+https://github.com/paladin-t/$_pkgname"
        "$_pkgname-makefile.patch")
sha256sums=('SKIP'
            'd181f05c86488bb6a77e82b7c18768b9215c3e022d735283a90c85d43438c916')

pkgver() {
  cd "${pkgname}"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"
  
  # Patch CFLAGS
  patch -p1 -i "${srcdir}/${_pkgname}-makefile.patch"
}

build() {
  cd "${pkgname}"
  make CFLAGS="${CFLAGS}"
}

package() {
  cd "${pkgname}"

  install -Dm755 output/my_basic "${pkgdir}/usr/bin/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}/sample/yard"

  install -m644 README.md HISTORY *.{pdf,html} \
    "${pkgdir}/usr/share/doc/${_pkgname}"
  install -m644 sample/{README*,*.bas} \
    "${pkgdir}/usr/share/doc/${_pkgname}/sample"
  install -m644 sample/yard/{README*,*.bas} \
    "${pkgdir}/usr/share/doc/${_pkgname}/sample/yard"
}
