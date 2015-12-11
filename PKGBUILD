# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw at gmail.com>
# Contributor: boypt <pentie at gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=zeromq-git
pkgver=20151211
pkgrel=1
pkgdesc="ZeroMQ core engine in C++"
arch=('i686' 'x86_64')
makedepends=('autoconf'
             'automake'
             'gcc'
             'gcc-libs'
             'git'
             'libpgm'
             'libsodium'
             'libtool'
             'make'
             'pkg-config'
             'util-linux')
url="https://github.com/zeromq/libzmq"
license=('LGPL3')
options=('staticlibs')
source=(${pkgname%-git}::git+https://github.com/zeromq/libzmq
        https://raw.githubusercontent.com/zeromq/cppzmq/master/zmq.hpp)
sha256sums=('SKIP'
            'SKIP')
provides=('zeromq')
conflicts=('zeromq')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
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

  msg2 'Installing license...'
  install -Dm 644 "COPYING"{,.LESSER} -t "$pkgdir/usr/share/licenses/zeromq"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Installing zmq.hpp...'
  install -Dm 644 "$srcdir/zmq.hpp" -t "$pkgdir/usr/include"

  msg2 'Renaming binaries...'
  for _bin in $(find "$pkgdir/usr/bin" -type f -printf '%f\n'); do
    mv "$pkgdir/usr/bin/$_bin" "$pkgdir/usr/bin/zmq_$_bin"
  done

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
