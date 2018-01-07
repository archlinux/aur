# $Id: PKGBUILD 277487 2017-12-30 21:51:59Z alucryd $
# Maintainer: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: <kleptophobiac@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=mythtv
pkgver=29.0
pkgrel=5
epoch=1
pkgdesc="A Homebrew PVR project"
arch=('x86_64')
url="http://www.mythtv.org/"
license=('GPL')
depends=('avahi' 'fftw' 'lame' 'libass' 'libavc1394' 'libcdio' 'libiec61883'
         'libgl' 'libpulse' 'libva' 'libvpx' 'libxinerama' 'lirc' 'mariadb-clients'
         'mysql-python' 'perl-dbd-mysql' 'perl-io-socket-inet6' 'perl-libwww'
         'perl-net-upnp' 'python2-lxml' 'qt5-webkit' 'qt5-script' 'taglib' 'urlgrabber'
         'libx264' 'libvdpau' 'exiv2' 'libxrandr' 'jack')
makedepends=('glew' 'libcec' 'libxml2' 'mesa' 'mesa-libgl' 'openssl' 'yasm' 'x264' 'gdb')
optdepends=('glew: for GPU commercial flagging'
            'libcec: for consumer electronics control capabilities'
            'libxml2: to read blu-ray metadata'
            'openssl: for AirTunes (RAOP) support')
conflicts=('myththemes' 'mythplugins-mythvideo')
replaces=('myththemes' 'mythplugins-mythvideo')
install='mythtv.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/MythTV/$pkgname/archive/v$pkgver.tar.gz"
        'mythbackend.service' '99-mythbackend.rules' 'qt510.patch')
sha512sums=('6d79d943b95b1816b4fce52f3de3e01ebcdcc2779f852ec8cf5e3a81f8be4c730a254ff78b52e36ac522ff99b125501f0cba33a2d4c01571552e09fb4dba18c2'
            '41533da5d8ef694d8c12f60d956673d9e49fb6781ae58d6bfd0bf31e4f380fddb508f9cad3b91264a3ad55853c24c6932bdf83bb5b711c34c0836d71b46be02c'
            'fc02c190f01dbfb803b87ea0a6cdf408ce7706dc1ed74fba939931c129fdeb5dab1105caf9f71f029843a4d74db888084f92173c3be240d8492454633311f7c8'
            '5070b4e8ad5ebd4208a3e8393ebabb55118615c2966cb1ba585e94084c4ad643dc5644bfca9267eb81e6c27be16b088e541aa8118a43cbebaf9d28c52e15a35c')

prepare() {
  cd $pkgname-$pkgver/$pkgname

  patch -Np2 -i ../../qt510.patch

  find 'bindings/python' 'contrib' 'programs/scripts' -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

build() {
  cd $pkgname-$pkgver/$pkgname

  ARCH="${CARCH/_/-}"
  ./configure --prefix=/usr \
              --cpu="$ARCH" \
              --disable-altivec \
              --disable-audio-jack \
              --disable-ccache \
              --disable-distcc \
              --enable-libfftw3 \
              --enable-libmp3lame \
              --enable-libvpx \
              --enable-libx264 \
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
