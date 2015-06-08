_pkgbasename=apulse
pkgname=lib32-$_pkgbasename-git
pkgver=0.36_aa73e4e
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
  printf "0.%s_%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbasename"

  export CFLAGS=-m32
  export CXXFLAGS=-m32
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$_pkgbasename"
  
  make DESTDIR="$pkgdir/" install
  mv "$pkgdir/usr/lib" "$pkgdir/usr/lib32"
  mv "$pkgdir/usr/bin/apulse" "$pkgdir/usr/bin/apulse32"
  sed -i 's:usr/lib/apulse:usr/lib32/apulse:' "$pkgdir/usr/bin/apulse32"
  install -Dm644 LICENSE.MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  warning " "
  warning " "
  warning "Type apulse32 <program> to start."
  warning " "
  warning " "
}
