# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw at gmail.com>
# Contributor: boypt <pentie at gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=zeromq-git
pkgver=20150708
pkgrel=1
pkgdesc="ZeroMQ core engine in C++"
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libpgm' 'libsodium' 'util-linux')
makedepends=('autoconf' 'automake' 'gcc' 'git' 'libtool' 'make' 'pkg-config')
url="https://github.com/zeromq/libzmq"
license=('LGPL3')
source=(${pkgname%-git}::git+https://github.com/zeromq/libzmq
        https://raw.githubusercontent.com/zeromq/cppzmq/master/zmq.hpp)
sha256sums=('SKIP'
            'SKIP')
provides=('zeromq')
conflicts=('zeromq')
options=('staticlibs')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/zeromq \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/zeromq \
    --localstatedir=/var/lib/zeromq \
    --with-gnu-ld \
    --with-pgm \
    --with-libsodium
  make
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 COPYING        "$pkgdir/usr/share/licenses/zeromq/COPYING"
  install -Dm 644 COPYING.LESSER "$pkgdir/usr/share/licenses/zeromq/COPYING.LESSER"

  msg 'Installing...'
  make DESTDIR="$pkgdir" install

  msg 'Installing zmq.hpp...'
  install -Dm 644 "$srcdir/zmq.hpp" "$pkgdir/usr/include/zmq.hpp"

  msg 'Renaming binary...'
  for _bin in `find "$pkgdir/usr/bin" -type f -printf '%f\n'`; do
    mv "$pkgdir/usr/bin/$_bin" "$pkgdir/usr/bin/zmq_$_bin"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
