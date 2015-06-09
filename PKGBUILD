# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=pcp-git
pkgver=20141221
pkgrel=1
pkgdesc="Pretty Curved Privacy"
arch=('i686' 'x86_64')
depends=('libsodium')
makedepends=('autoconf' 'automake' 'gcc' 'git' 'libtool' 'make' 'pkg-config')
url="https://github.com/TLINDEN/pcp"
license=('GPL3')
source=(git+https://github.com/TLINDEN/pcp)
sha256sums=('SKIP')
provides=('pcp')
conflicts=('pcp')

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
    --libexecdir=/usr/lib/pcp \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/pcp \
    --localstatedir=/var/lib/pcp \
    --with-gnu-ld \
    --with-libsodium \
    --enable-cbc
  make
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  for _license in AUTHORS COPYING LICENSE; do
    install -Dm 644 $_license "$pkgdir/usr/share/licenses/pcp/$_license"
  done

  msg 'Installing documentation...'
  for _doc in ChangeLog NEWS README.pod README.txt TODO VERSION; do
    install -Dm 644 $_doc "$pkgdir/usr/share/doc/pcp/$_doc"
  done

  msg 'Installing...'
  sed -i "s@^DOXDIR.*@DOXDIR = ${pkgdir}/usr/share/doc/libpcp-\$(VERSION)@" man/Makefile*
  make DESTDIR="$pkgdir" install

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
