# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: <kleptophobiac@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=mythtv
pkgver=29.1
pkgrel=4
epoch=1
pkgdesc="A Homebrew PVR project"
arch=('x86_64')
url="https://www.mythtv.org/"
license=('GPL')
depends=('libass' 'qt5-script' 'libavc1394' 'fftw' 'exiv2' 'taglib' 'libva' 'libiec61883' 'perl-net-upnp' 'urlgrabber'
		 'qt5-webkit' 'x265' 'libx264' 'jack' 'libvpx' 'libvdpau' 'lame' 'libxinerama' 'libpulse' 'libxrandr')
makedepends=('git' 'help2man' 'yasm' 'libmariadbclient' 'libxml2' 'libcec' 'x264' 'libcdio' 'lirc' 'perl-io-socket-inet6' 'perl-libwww' 'mysql-python'
             'perl-dbd-mysql' 'python2-lxml')
optdepends=('glew: for GPU commercial flagging'
            'libcec: for consumer electronics control capabilities'
            'libxml2: to read blu-ray metadata'
            'mariadb: Database-Backend for server deployment'
            'mariadb-clients: Database-Frontend for client deployment'
            'python2-future: for metadata-lookup / cover art'
            'python2-requests: for metadata-lookup / cover art'
            'python2-requests-cache: for metadata-lookup / cover art')
conflicts=('myththemes' 'mythplugins-mythvideo')
replaces=('myththemes' 'mythplugins-mythvideo')
install='mythtv.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/MythTV/$pkgname/archive/v$pkgver.tar.gz"
        'mythbackend.service'
		'99-mythbackend.rules'
		'mythtv.install')
sha512sums=('66fda29bd645b4c9a90600414193f46b99b9b8d60d033828f0eeb44e1c3820a7781d93c7010fc1e0affa83be93896231ba91409ccb7dba38190a5809752beedd'
            '41533da5d8ef694d8c12f60d956673d9e49fb6781ae58d6bfd0bf31e4f380fddb508f9cad3b91264a3ad55853c24c6932bdf83bb5b711c34c0836d71b46be02c'
            'fc02c190f01dbfb803b87ea0a6cdf408ce7706dc1ed74fba939931c129fdeb5dab1105caf9f71f029843a4d74db888084f92173c3be240d8492454633311f7c8'
			'db78be27826be44e97d8680aa860f2e85c94e017aa649d183ee5d71310c95e31669330d3b4496c52143892f238300e57ae88ab0a737ca135ab6f2ce361814e36')

prepare() {
  cd $pkgname-$pkgver/$pkgname

  find 'bindings/python' 'contrib' 'programs/scripts' -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

build() {
  cd $pkgname-$pkgver/$pkgname

  ARCH="${CARCH/_/-}"
  ./configure --prefix=/usr \
              --cpu="$ARCH" \
              --disable-altivec \
              --enable-audio-jack \
              --disable-ccache \
              --disable-distcc \
              --enable-libfftw3 \
              --enable-libmp3lame \
              --enable-libvpx \
              --enable-libx264 \
			  --enable-libx265 \
              --enable-vaapi \
              --python=python2 \
              --perl-config-opts=INSTALLDIRS=vendor
  make
}

package() {
  cd $pkgname-$pkgver/$pkgname
  make INSTALL_ROOT="$pkgdir" install

  install -D -m644 "$srcdir/mythbackend.service" "$pkgdir/usr/lib/systemd/system/mythbackend.service"
  install -D -m644 'database/mc.sql' "$pkgdir/usr/share/mythtv/mc.sql"

  mkdir -p "$pkgdir/usr/share/mythtv"
  cp -R 'contrib' "$pkgdir/usr/share/mythtv"
  mkdir -p "$pkgdir/var/log/mythtv"

# Install udev rules https://www.mythtv.org/wiki/Systemd_mythbackend_Configuration#Delay_starting_the_backend_until_tuners_have_initialized
  install -Dm644 "$srcdir"/99-mythbackend.rules "$pkgdir"/usr/lib/udev/rules.d/99-mythbackend.rules
}
