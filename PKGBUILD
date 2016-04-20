# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=compiz-monowall-plugin-git
pkgver=0.4.37666c2
pkgrel=2
pkgdesc="Compiz 0.8.x plugin to switch workspaces independently on each connected monitor"
url="https://github.com/blackhole89/compiz-monowall"
license=("GPL2")
arch=('i686' 'x86_64')
makedepends=('git')
depends=('compiz-core<0.9.0' 'compiz-bcop')

source=(
  "${pkgname}::git+${url}.git#branch=master"
  'cairo_include_path.patch'
)

md5sums=(
  'SKIP'
  '4f1781df9c9ad8b0ffa46e99c1ca3dc7'
)

pkgver () {
  cd "${srcdir}/${pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

build() {
  cd "${srcdir}"
  patch -p0 < cairo_include_path.patch

  cd "${srcdir}/${pkgname}"
  make
}

package() {
    cd "${srcdir}/${pkgname}/build"

    mkdir -p "${pkgdir}/usr/lib/compiz"
    mkdir -p "${pkgdir}/usr/share/compiz"

    install -m 644 monowall.xml "${pkgdir}/usr/share/compiz"
    install -m 755 .libs/libmonowall.so "${pkgdir}/usr/lib/compiz"
}
