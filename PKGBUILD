# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgname=biboumi
pkgname="$_pkgname-git"
pkgver=9.0.r27.g2bd91dc
pkgrel=2
pkgdesc="XMPP gateway to IRC"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://biboumi.louiz.org/"
license=('ZLIB')
depends=('expat' 'libidn' 'udns' 'botan2' 'sqlite' 'postgresql-libs')
makedepends=('git' 'cmake' 'ninja' 'python-sphinx' 'python-sphinx_rtd_theme')
backup=("etc/$_pkgname/$_pkgname.cfg")
install="$_pkgname.install"
source=("$_pkgname::git+https://codeberg.org/poezio/biboumi"
        'biboumi.install'
        'sysuser.conf')
md5sums=('SKIP'
         '4d83eb74d68a2328b19c1e8df5cdb5d7'
         '07c92af3248861ce94d361e98cfb7f5c')

provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  mkdir -p build
}

build() {
  cd $_pkgname/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSERVICE_USER=biboumi \
    -DSERVICE_GROUP=jabber \
    -Wno-dev \
    -G Ninja
  ninja
  ninja doc
}

package() {
  cd $_pkgname/build
  DESTDIR="$pkgdir/" ninja install

  install -dm755 "$pkgdir"/usr/share/doc/$_pkgname/
  cp -r html "$pkgdir"/usr/share/doc/$_pkgname/

  cd ..
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm644 doc/*.rst "$pkgdir"/usr/share/doc/$_pkgname/
  install -Dm644 conf/biboumi.cfg "$pkgdir"/etc/$_pkgname/$_pkgname.cfg

  cd ..
  install -Dm644 sysuser.conf "$pkgdir"/usr/lib/sysusers.d/$_pkgname.conf
}
