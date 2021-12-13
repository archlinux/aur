# Maintainer: Dmytro Meleshko <dmytro dot meleshko at gmail dot com>
_pkgname=docs-gl
pkgname="${_pkgname}-git"
pkgver=r337.7842647
pkgrel=1
pkgdesc="An improved version of the official OpenGL documentation"
arch=(any)
url="https://docs.gl/"
license=('custom')
depends=()
makedepends=('git' 'python')
options=(!strip)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}::git+https://github.com/BSVino/docs.gl.git"
        "${pkgname}-jquery-bonsai::git+https://github.com/BSVino/jquery-bonsai.git"
        "${pkgname}-jquery-cookie::git+https://github.com/carhartl/jquery-cookie.git"
        "${pkgname}-htmlmin::git+https://github.com/mankyd/htmlmin.git"
        "${pkgname}.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '9fb6a78bc04c481417d9ad93d1841c1522b1e67d89fa58a4b76f4d14ef6236f1')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  git submodule init
  git config submodule.'html/copy/jquery-bonsai'.url "${srcdir}/${pkgname}-jquery-bonsai"
  git config submodule.'html/copy/jquery-cookie'.url "${srcdir}/${pkgname}-jquery-cookie"
  git config submodule.'htmlmin'.url "${srcdir}/${pkgname}-htmlmin"
  git submodule update

  git apply "${srcdir}/${pkgname}.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
  python compile.py --local-assets
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc"
  cp -r "htdocs" "${pkgdir}/usr/share/doc/${_pkgname}"
}
