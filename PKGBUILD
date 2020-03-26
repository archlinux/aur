# Maintainer: TingPing tingping@tingping.se

pkgname=transmission-remote-gtk-git
pkgver=1.4.1.r3.gb206550
pkgrel=1
pkgdesc='A remote interface to the Transmission BitTorrent client'
arch=('i686' 'x86_64' 'armv6h')
url='https://github.com/transmission-remote-gtk/transmission-remote-gtk'
license=('GPL')
options=('!libtool')
depends=('gtk3' 'libnotify' 'curl' 'libproxy' 'geoip'
         'desktop-file-utils')
makedepends=('intltool' 'git' 'appstream-glib' 'autoconf-archive')
provides=('transmission-remote-gtk')
conflicts=('transmission-remote-gtk')
source=('git+https://github.com/transmission-remote-gtk/transmission-remote-gtk.git'
	    'gettext_020.patch')
sha512sums=('SKIP'
            '2f56ad149ddf0152c5b6153675a285671b724d101ad065cd311a31d07274197e92903165efbf62dbde8aff573e1478da1ecf219ed3e4e5ebb65cfaef673b708e')
_gitname='transmission-remote-gtk'

pkgver() {
  cd "$_gitname"

  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"
  patch --forward --strip=1 --input="gettext_020.patch"
}

build() {
  cd "$_gitname"

  env POD2MAN=/usr/bin/core_perl/pod2man \
    ./autogen.sh --prefix=/usr --disable-debug --disable-desktop-database-update
  make -s
}

package() {
  cd "$_gitname"

  make DESTDIR="$pkgdir" install
}
