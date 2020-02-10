# Maintainer: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: tobias <tobias@archlinux.net>
# Contributor: Robert Emil Berge <robert@rebi.no>

pkgname=jack-dbus
pkgver=0.125.0
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

source=("$pkgname::git://github.com/jackaudio/jack1"
        'tools-git::git://github.com/jackaudio/tools.git'
        'example-clients-git::git://github.com/jackaudio/example-clients.git'
        '99-audio.conf'
        '40-hpet-permissions.rules')

sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'c21f593d46ff12d1b8d3ce7ca4593c230a673e67ed4e486944f52fd51bdf902873d3fb253220c8ec9c6c5d5b9f002ecf3dd72318222cd748b1925bfcbf1df5d7'
            '1f876aa61de4bc4e54d46dde7f8c8c2aa575fc382c09f3dc6819c328224b1998c7171cfd3039d35ca214e40909ad71f8d56a9b3b5652046beb5ca97e44a780b1')

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
