pkgname=shim-git
pkgver=0.1.0.r23.ge506733
pkgrel=1
epoch=1
pkgdesc='wedge this HTTP proxy between your browser and Tor'
arch=('i686' 'x86_64')
url='https://github.com/nmathewson/shim/'
license=('unknown')
depends=('libevent')
optdepends=('tor')
makedepends=('git')
backup=('etc/conf.d/shim')
source=('git://github.com/nmathewson/shim.git'
        'shim.conf'
        'shim.service')
sha256sums=('SKIP'
            'd4a0af79f6e1494bf8630c09654d15b9791ef10d7337141a969962ecf5041e67'
            '054d6c62ec97debe7cb282601a4db47f18e0fffb2dc63a14c5b80bdb130b350c')

_gitname='shim'

pkgver() {
  cd "$srcdir/$_gitname"
  printf "%s.r%s.g%s" "$(grep AC_INIT configure.in | sed -E 's/.*\[([0-9.]+)\].*/\1/g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/etc/conf.d"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  install -m 644 "$srcdir/shim.conf" "$pkgdir/etc/conf.d/shim"
  install -m 644 "$srcdir/shim.service" "$pkgdir/usr/lib/systemd/system/"
}

# vim:set ts=2 sw=2 et:
