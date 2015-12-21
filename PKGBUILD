# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Brian Knox <taotetek at gmail.com>

pkgname=czmq-git
pkgver=20151221
pkgrel=1
pkgdesc="High-level C binding for ZeroMQ"
arch=('i686' 'x86_64')
makedepends=('autoconf'
             'automake'
             'gcc'
             'gcc-libs'
             'git'
             'libsodium'
             'libtool'
             'make'
             'pkg-config'
             'zeromq')
url="https://github.com/zeromq/czmq"
license=('MPL')
source=(git+https://github.com/zeromq/czmq)
sha256sums=('SKIP')
provides=('czmq')
conflicts=('czmq')

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
    --libexecdir=/usr/lib/czmq \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/czmq \
    --localstatedir=/var/lib/czmq \
    --with-gnu-ld
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/czmq"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Renaming binaries...'
  for _bin in $(find "$pkgdir/usr/bin" -type f -printf '%f\n'); do
    mv "$pkgdir/usr/bin/$_bin" "$pkgdir/usr/bin/czmq_$_bin"
  done

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
