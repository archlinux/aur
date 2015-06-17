# Maintainer: Tucos <baspape@gmail.com>
# Contributor: Hubert Grzeskowiak <arch at nemesis13 dot de>

pkgname=panda3d-runtime-git
pkgver=git
pkgrel=1
pkgdesc='3D engine with Python bindings. Runtime and web plugin.'
url="http://www.panda3d.org"
arch=('i686' 'x86_64')
depends=('openssl' 'shared-mime-info' 'desktop-file-utils')
makedepends=('python2' 'libpng' 'libjpeg')
source=('panda3d::git+https://github.com/panda3d/panda3d.git')
license=('BSD')
md5sums=('SKIP')

#prepare() {
#cd $srcdir/$pkgname-$pkgver
#patch -p1 -i $srcdir/patch.patch 
#}

build() {
  cd $srcdir/panda3d
  python2 makepanda/makepanda.py --everything --runtime --distributor cmu --host https://runtime.panda3d.org/
}

package() {
  cd $srcdir/panda3d
  python2 makepanda/installpanda.py --destdir=$pkgdir --runtime --outputdir=built_cmu_rt --prefix=/usr
  install -D -m755 $srcdir/panda3d/doc/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

post_install() {
  ldconfig
  update-mime-database usr/share/mime
  update-desktop-database -q
}

post_upgrade() {
  update-mime-database usr/share/mime
  update-desktop-database -q
}

post_remove() {
  update-mime-database usr/share/mime
  update-desktop-database -q
}

pkgver() {
  cd "$pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

