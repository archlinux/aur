# Maintainer: Christoph J. Thompson <thompsonc at protonmail dot ch>

_pkgname=my_basic
pkgname=$_pkgname-git
pkgver=r1035.g685d352
pkgrel=1
pkgdesc="BASIC interpreter"
arch=('i686' 'x86_64')
url="https://paladin-t.github.io/my_basic"
license=('MIT')
source=("$pkgname::git+https://github.com/paladin-t/$_pkgname"
        "$_pkgname-makefile.patch")
sha256sums=('SKIP'
            '3ef06138e5403c16260897dcb7522cb3caea4ca182d65e0a1acf50693a6a8cf5')

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

  install -Dm755 output/my_basic_bin "${pkgdir}/usr/bin/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}/sample/yard"

  install -m644 HISTORY *.{pdf,html} \
    "${pkgdir}/usr/share/doc/${_pkgname}"
  install -m644 sample/{README*,*.bas} \
    "${pkgdir}/usr/share/doc/${_pkgname}/sample"
  install -m644 sample/yard/{README*,*.bas} \
    "${pkgdir}/usr/share/doc/${_pkgname}/sample/yard"
}
