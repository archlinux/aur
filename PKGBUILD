# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Gergely Tamas <dice@mfa.kfki.hu>

pkgname=gq
pkgver=1.3.4
pkgrel=8
pkgdesc="interactive graphical LDAP browser"
url="https://sourceforge.net/projects/gqclient/"
license=("GPL")
depends=('libxml2' 'openssl-1.0' 'gtk2' 'libgnome-keyring' 'libglade' 'libldap>=2.4.18' 'libgpg-error' 'libgcrypt')
makedepends=('intltool' 'pkgconfig' 'gnome-doc-utils')
arch=('x86_64')
source=(https://downloads.sourceforge.net/sourceforge/gqclient/$pkgname-$pkgver.tar.gz
	gq-1.3.4-kerberos.patch
	gq-1.3.4-configure.patch
	gq-1.3.4-dso.patch
	gq-1.3.4-glibfix.patch
	gq-1.3.4-errorchain.patch
	gq-1.3.4-strcmp-null-safe.patch
	gq-1.3.4-sanity-check.patch)
sha256sums=('2ac77f3233ddaef718f89c9371ab5165af29cf9738ed46b6bea64b37e45d4b60'
            'bc985d3a59ff08747a58c53112cc2903b0cba438ee3b328b9bbf4976226c5402'
            'a3ba1a50c19469834170632d6f5289cada81f04b7921fb16c37327a5f946f770'
            '7b7a39eafaff8b4ffe34b263330a6eb0b20827c51deaff83e80dbce6460b6e50'
            'ce2b395da210fd5f68d2afb80de2d15f77d4161fbb9911fe876d891cf21cf057'
            '983d2ca845306d76b2fe4167eb1f479f3ee2ad81f3318602be9e99ab117689e6'
            '396098fe4b4550c3260c97fe4de209088860e1fe3acf6aaa9574b67a4d9b85b8'
            '1c65f6ecb1fedb1a06f3c52f48d0dc8456c386e86ef5a629fc4ddfc1259ec613')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -Np1 -i ../gq-1.3.4-kerberos.patch
  patch -Np0 -i ../gq-1.3.4-configure.patch
  patch -Np1 -i ../gq-1.3.4-dso.patch
  patch -Np1 -i ../gq-1.3.4-glibfix.patch
  patch -Np1 -i ../gq-1.3.4-errorchain.patch
  patch -Np1 -i ../gq-1.3.4-strcmp-null-safe.patch
  patch -Np1 -i ../gq-1.3.4-sanity-check.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig \
  CFLAGS+=" -I/usr/include/openssl-1.0" \
  LDFLAGS+="-I/usr/lib/openssl-1.0" \
  ./configure --prefix=/usr --disable-debugging --disable-update-mimedb
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
