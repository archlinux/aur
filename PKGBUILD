# Maintainer: Logan Sevcik <logan+aur@sevcik.email>
# Maintainer: Johannes Arnold <johannes.arnold@stud.uni-hannover.de>
_pkgname=shairport-sync-mpris
pkgname=$_pkgname-git
pkgver=5.0.dev.r31.gd40e499d
pkgrel=1
pkgdesc="AirPlay 2 audio player with multi-room playback (with mpris support)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mikebrady/shairport-sync"
license=('custom')
makedepends=('git' 'autoconf' 'automake' 'libtool' 'xxd' 'libalac' 'mosquitto' 'ffmpeg4.4' 'glib2-devel' 'libpipewire')
depends=('openssl' 'avahi' 'popt' 'libconfig' 'nqptp' 'ffmpeg4.4' 'libsodium' 'libplist' 'mosquitto' 'alac')
optdepends=('pulseaudio: PulseAudio support'
            'pipewire: PipeWire support'
            'libsoxr: libsoxr-based resampling')
provides=('shairport-sync')
conflicts=('shairport-sync')
source=("$_pkgname::git+https://github.com/mikebrady/shairport-sync#branch=development"
        "shairport-sync.sysusers")
sha256sums=('SKIP'
            'bc2d92254910996e837d1c4c7dd81eddfb96a9f5f0cb2faad9fcb0414ea79a1d')

prepare() {
  cd "$srcdir/$_pkgname"

  sed -i 's|\sgetent| # getent|g' Makefile.am
}

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  export PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig/:$PKG_CONFIG_PATH"

  autoreconf -i -f
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-alsa \
    --with-pulseaudio \
    --with-pipewire \
    --with-jack \
    --with-stdout \
    --with-pipe \
    --with-avahi \
    --with-dns_sd \
    --with-pkg-config \
    --with-configfiles \
    --with-mqtt-client \
    --with-ssl=openssl \
    --with-metadata \
    --with-apple-alac \
    --with-soxr \
    --with-systemd-startup \
    --with-dbus-interface \
    --with-airplay-2 \
    --with-mpris-interface
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir"/shairport-sync.sysusers "$pkgdir"/usr/lib/sysusers.d/shairport-sync.conf
  install -D -m644 LICENSES "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
