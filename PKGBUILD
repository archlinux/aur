# Contributor: Igor Novikov <sk1 dot project dot org at gmail dot com>
# Maintainer: Joermungand <joermungand at gmail dot com>

pkgname=sk1-git
pkgver=r3694.a598e935
pkgrel=1
pkgdesc="An open source vector graphics editor for prepress"
url="https://sk1project.net/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('lcms2' 'cairo' 'libmagick6' 'pango' 'wxpython' 'python2-cairo' 
	 'python2-pillow' 'python2-reportlab' 'python2-pycups')
makedepends=('git' 'python2')
provides=('sk1')
conflicts=('sk1')
source=("${pkgname%-*}"::'git://github.com/sk1project/sk1-wx.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-*}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-*}"
  cp src/sk1/appconst.py .
  sed -i 's/from sk1 import appconst/import appconst/' setup-sk1.py
  export PKG_CONFIG_PATH="/usr/lib/imagemagick6/pkgconfig"
  LANG=en_US.UTF-8 python2 setup-sk1.py build
}

package() {
  cd "${srcdir}/${pkgname%-*}"
  LANG=en_US.UTF-8 python2 setup-sk1.py install --root="$pkgdir"
}
