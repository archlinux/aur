# Maintainer: James Bunton <jamesbunton@delx.net.au>
# Contributor: Taijian <taijian@posteo.de>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: <kleptophobiac@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=mythtv
pkgver=32+fixes.20221129.44f88ed4
pkgrel=1
pkgdesc="A Homebrew PVR project"
arch=('x86_64')
url="https://www.mythtv.org/"
license=('GPL')
depends=(
    'exiv2'
    'fftw'
    'jack'
    'lame'
    'libass'
    'libavc1394'
    'libbluray'
    'libhdhomerun'
    'libiec61883'
    'libpulse'
    'libsamplerate'
    'libva'
    'libvdpau'
    'libvpx'
    'libxinerama'
    'libxml2'
    'libxrandr'
    'libzip'
    'lzo'
    'qt5-script'
    'soundtouch'
    'taglib'
    'x264'
    'x265'
)
makedepends=(
    'git'
    'help2man'
    'libcdio'
    'libcec'
    'libmariadbclient'
    'libxml2'
    'lirc'
    'perl-dbd-mysql'
    'perl-io-socket-inet6'
    'perl-libwww'
    'perl-net-upnp'
    'perl-xml-simple'
    'perl-xml-xpath'
    'python-future'
    'python-lxml'
    'python-mysqlclient'
    'python-requests'
    'python-setuptools'
    'python-simplejson'
    'yasm'
)
optdepends=(
    'glew: for GPU commercial flagging'
    'libcec: for consumer electronics control capabilities'
    'mariadb: Database-Backend for server deployment'
    'mariadb-clients: Database-Frontend for client deployment'
    'perl-dbd-mysql: Perl bindings'
    'perl-io-socket-inet6: Perl bindings'
    'perl-libwww: Perl bindings'
    'perl-net-upnp: Perl bindings'
    'perl-xml-simple: Perl bindings'
    'perl-xml-xpath: Perl bindings'
    'python-future: Python bindings'
    'python-lxml: Python bindings'
    'python-mysqlclient: Python bindings'
    'python-requests: Python bindings'
    'python-requests-cache: Python bindings'
    'python-simplejson: Python bindings'
)
conflicts=('myththemes' 'mythplugins-mythvideo' 'mythtv-git')
replaces=('myththemes' 'mythplugins-mythvideo' 'mythtv-git')
source=(
    "git+https://github.com/MythTV/mythtv#branch=fixes/32"
    'mythbackend.service'
    'mythtv.desktop'
    'mythtv.png'
    '99-mythbackend.rules'
    'sysusers.d'
)
sha256sums=(
    'SKIP'
    '3c356d030c8e5fb8cbe7bc01041848c4e8073b0a696c0f34a3e3cc0fd83ecf0b'
    '3fd2018d0d5aaa7d530835305dac80d4ca7d8fc991cdf9e1cebadebd86e25c03'
    '12cb52bf9b084a4f16419c9370fef0450ce6a11308b0c3f7240f4f83df7e2ab6'
    'ecfd02bbbef5de9773f4de2c52e9b2b382ce8137735f249d7900270d304fd333'
    '470de0a4050c16c7af11a0e5cfe2810b7daae42df4acf5456c7eae274dc7c5ae'
)

pkgver() {
  cd "${srcdir}/mythtv/mythtv"
  echo -n "32+fixes.$(git show -s --format=%cd --date=short | tr -d -).$(git rev-parse --short=8 HEAD)"
}

build() {
  cd "${srcdir}/mythtv/mythtv"

  ARCH="${CARCH/_/-}"
  ./configure --prefix=/usr \
              --cpu="$ARCH" \
              --disable-altivec \
              --enable-audio-jack \
              --disable-distcc \
              --enable-libfftw3 \
              --enable-libmp3lame \
              --enable-libvpx \
              --enable-libx264 \
              --enable-libx265 \
              --enable-vaapi \
              --with-bindings=python \
              --with-bindings=perl \
              --perl-config-opts=INSTALLDIRS=vendor
  make
}

package() {
  cd "${srcdir}/mythtv/mythtv"
  make INSTALL_ROOT="$pkgdir" install

  install -D -m644 "$srcdir/mythbackend.service" "$pkgdir/usr/lib/systemd/system/mythbackend.service"
  install -D -m644 'database/mc.sql' "$pkgdir/usr/share/mythtv/mc.sql"
  install -D -m644 "$srcdir/sysusers.d" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  mkdir -p "$pkgdir/usr/share/mythtv"
  cp -R 'contrib' "$pkgdir/usr/share/mythtv"
  mkdir -p "$pkgdir/var/log/mythtv"

  # Install udev rules https://www.mythtv.org/wiki/Systemd_mythbackend_Configuration#Delay_starting_the_backend_until_tuners_have_initialized
  install -Dm644 "$srcdir/99-mythbackend.rules" "$pkgdir/usr/lib/udev/rules.d/99-mythbackend.rules"

  # Install desktop file
  install -Dm644 "$srcdir/mythtv.png" "$pkgdir/usr/share/pixmaps/mythtv.png"
  install -Dm644 "$srcdir/mythtv.desktop" "$pkgdir/usr/share/applications/mythtv.desktop"
}
