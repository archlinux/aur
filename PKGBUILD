# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
pkgname=opendht-git
pkgver=20150714
pkgrel=1
pkgdesc="A C++11 implementation of the Kademlia DHT (Distributed Hash Table)"
arch=('i686' 'x86_64')
depends=('gnutls')
makedepends=('git')
url="https://github.com/savoirfairelinux/opendht"
license=('GPL3')
source=("git://github.com/savoirfairelinux/opendht#commit=ac13795db0a606c8d03b609956fd4578411cf7f6")
sha256sums=('SKIP')
provides=('opendht')
conflicts=('opendht')

pkgver() {
  cd "${pkgname%-git}"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd "${pkgname%-git}"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/bin \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/opendht \
    --localstatedir=/var/lib/opendht \
    --with-gnu-ld
  make
}

package() {
  cd "${pkgname%-git}"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

# vim:set ts=2 sw=2 et:
