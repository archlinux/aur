# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Brian Knox <taotetek at gmail.com>

pkgname=czmq-git
pkgver=20150707
pkgrel=1
pkgdesc="High-level C binding for ZeroMQ"
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libsodium' 'zeromq')
makedepends=('autoconf' 'automake' 'gcc' 'git' 'libtool' 'make' 'pkg-config')
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

  msg 'Building...'
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

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/czmq/LICENSE"

  msg 'Installing...'
  make DESTDIR="$pkgdir" install

  msg 'Renaming binaries...'
  for _bin in `find "$pkgdir/usr/bin" -type f -printf '%f\n'`; do
    mv "$pkgdir/usr/bin/$_bin" "$pkgdir/usr/bin/czmq_$_bin"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
