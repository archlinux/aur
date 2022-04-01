# Maintainer: Alad Wenter <alad@archlinux.org>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=sylpheed
pkgver=3.7.0
pkgrel=6
pkgdesc="Lightweight and user-friendly e-mail client"
arch=('x86_64')
url="https://sylpheed.sraoss.jp/en/"
license=('GPL')
depends=('compface' 'gpgme' 'gtkspell' 'libnsl')
makedepends=('openssl')
source=("https://sylpheed.sraoss.jp/$pkgname/v${pkgver%.*}/$pkgname-$pkgver.tar.bz2"
        "Support-SNI-some-servers-imap.gmail.patch::https://sylpheed.sraoss.jp/redmine/attachments/download/145/v2-0001-libsylph-ssl.c-Support-SNI-some-servers-imap.gmai.patch")
sha256sums=('eb23e6bda2c02095dfb0130668cf7c75d1f256904e3a7337815b4da5cb72eb04'
            '2c622fa0d110d5745925d3a265d7dd953679d335f85a3ed3d1dcc699d9575d89')

prepare() {
  cd "$pkgname-$pkgver"
  # patch for enchant >= 2.1.3
  # https://www.archlinux.org/todo/enchant-221-rebuild/
  sed -i 's,enchant/,enchant-2/,g' src/compose.c
  sed -i 's/ enchant/ enchant-2/g' configure

  # https://sylpheed.sraoss.jp/redmine/issues/306
  patch -p1 < "$srcdir"/Support-SNI-some-servers-imap.gmail.patch
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --enable-maintainer-mode \
              --enable-ldap
  make

  # Build Attachment-Tool Plug-in
  cd plugin/attachment_tool && make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" LDFLAGS+="/usr/lib/enchant-2" install

  # Install Attachment-Tool Plug-in
  cd plugin/attachment_tool
  make DESTDIR="$pkgdir/" install-plugin
}
