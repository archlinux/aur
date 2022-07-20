# Maintainer: fuan_k <rrkay@posteo.net>
# Contributor: libernux <dutchman55@gmx.com>
# Contributor: Jonny Gerold <jonny@fsk141.com>
# Contributor: Tetsumaki <http://goo.gl/YMBdA>

pkgname=flamerobin-git
pkgver=0.9.3.12.r2.g5b8232f5
pkgrel=2
pkgdesc='A tool to handle Firebird database management'
arch=('i686' 'x86_64')
url="http://www.flamerobin.org/"
license=('MIT')
depends=('wxgtk3' 'libfbclient' 'boost')
makedepends=('git' 'cmake')
provides=('flamerobin')
conflicts=('flamerobin')
source=("$pkgname"::'git+https://github.com/mariuz/flamerobin.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  
  # Dirty hack to work around the fact that the build scripts invoke
  # wx-config which may not exist anymore since wxgtk3
  OLDPATH="$PATH"
  export PATH="$(pwd):$PATH"
  ln -s /usr/bin/wx-config-gtk3 ./wx-config
  
  ./configure --prefix=/usr --with-wx-config=wx-config
  cmake -B build -S "./" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='/usr' -Wno-dev
  cmake --build build
  
  rm ./wx-config
  export PATH="$OLDPATH"
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" cmake --install build
}
