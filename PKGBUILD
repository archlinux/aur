# Maintainer: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: tobias <tobias@archlinux.net>
# Contributor: Robert Emil Berge <robert@rebi.no>

pkgname=jack-dbus
pkgver=0.124.1
pkgrel=4

pkgdesc="The Jack1 audio server with dbus patch"
url="http://jackaudio.org/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')

depends=('db' 'libsamplerate' 'zita-alsa-pcmi' 'zita-resampler' 'python2-dbus')
makedepends=('git' 'doxygen' 'libffado' 'celt')
optdepends=('libffado: FireWire support' 'celt: NetJACK driver')

provides=("jack=$pkgver" 'jackdbus')
conflicts=('jack' 'jack2' 'jack2-dbus')

source=("$pkgname::git://github.com/LADI/jack1"
        'tools-git::git://github.com/jackaudio/tools.git'
        'example-clients-git::git://github.com/jackaudio/example-clients.git'
        '99-audio.conf'
        '40-hpet-permissions.rules')

md5sums=('SKIP' 'SKIP' 'SKIP'
         'ae65b7c9ebe0fff6c918ba9d97ae342d'
         '471aad533ff56c5d3cbbf65ce32cadef')

prepare() {
  cd "$pkgname"
  git checkout "$pkgver"-dbus
  git submodule init
  git config submodule.tools/master.url "$srcdir"/tools
  git config submodule.example-clients/master.url "$srcdir"/example-clients
  git submodule update jack tools example-clients
  sed -i '1 s/python$/&2/' tools/jack_control
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
