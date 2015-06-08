# Maintainer: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: tobias <tobias@archlinux.net>
# Contributor: Robert Emil Berge <robert@rebi.no>

pkgname=jack-git
pkgver=0.124.1.35.g6685cc7
pkgrel=1

pkgdesc="A low-latency audio server"
url="http://jackaudio.org"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')

depends=('db' 'libsamplerate' 'zita-alsa-pcmi' 'zita-resampler')
makedepends=('git' 'doxygen' 'libffado' 'celt')
optdepends=('libffado: FireWire support' 'celt: NetJACK driver')

provides=("jack=$pkgver")
conflicts=('jack' 'jack2' 'jack-dbus' 'jack2-dbus')

source=("$pkgname::git://github.com/jackaudio/jack1.git"
        'tools-git::git://github.com/jackaudio/tools.git'
        'example-clients-git::git://github.com/jackaudio/example-clients.git'
	    '99-audio.conf'
        '40-hpet-permissions.rules')

md5sums=('SKIP' 'SKIP' 'SKIP'
         'ae65b7c9ebe0fff6c918ba9d97ae342d'
         '471aad533ff56c5d3cbbf65ce32cadef')

pkgver() {
  cd "$pkgname"
  git describe --tags --always | sed 's|-|.|g'
}

prepare()
{
  cd "$pkgname"
  git submodule init
  git config submodule.tools/master.url "$srcdir"/tools
  git config submodule.example-clients/master.url "$srcdir"/example-clients
  git submodule update jack tools example-clients
}

build() {
  cd "$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install

  # configure realtime access/scheduling
  # see https://bugs.archlinux.org/task/26343
  install -Dm644 "$srcdir"/99-audio.conf "$pkgdir"/etc/security/limits.d/99-audio.conf
  install -Dm644 "$srcdir"/40-hpet-permissions.rules "$pkgdir"/usr/lib/udev/rules.d/40-hpet-permissions.rules
}
