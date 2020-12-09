_pkgbasename=apulse
pkgname=lib32-$_pkgbasename-git
pkgver=0.1.13
pkgrel=1
pkgdesc="PulseAudio emulation for ALSA, x86_64 multilib version"
arch=('x86_64')
url="https://github.com/i-rinat/apulse"
license=('MIT')
depends=('lib32-glib2' 'lib32-alsa-lib')
makedepends=('cmake' 'git' 'gcc-multilib')
source=("git://github.com/i-rinat/apulse.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbasename"
  git describe --tags | sed -e 's:^v::' -e 's:\([^-]*-g\):r\1:;s:-:_:g' 
}

build() {
  cd "$srcdir/$_pkgbasename"

  export CFLAGS=-m32
  export CXXFLAGS=-m32
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$_pkgbasename"
  
  make DESTDIR="$pkgdir/" install
  mv "$pkgdir/usr/lib" "$pkgdir/usr/lib32"
  mv "$pkgdir/usr/bin/apulse" "$pkgdir/usr/bin/apulse32"
  mv "$pkgdir/usr/share/man/man1/apulse.1" "$pkgdir/usr/share/man/man1/apulse32.1"
  sed -i 's:usr/lib/apulse:usr/lib32/apulse:' "$pkgdir/usr/bin/apulse32"
  install -Dm644 LICENSE.MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  warning " "
  warning " "
  warning "Type apulse32 <program> to start."
  warning " "
  warning " "
}
