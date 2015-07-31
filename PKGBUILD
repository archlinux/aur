# Maintainer: Martin Gallant <arch-linux@goodbit.net>
# Based on /var/abs/community/mythtv/PKGBUILD version 0.27.4

pkgname=mythtv-git
pkgver=v0.28.pre.r2987.g52c8a9d
pkgrel=1
pkgdesc='Free Open Source software digital video recorder (DVR) project'
arch=('i686' 'x86_64')
url='http://www.mythtv.org/'
license=('GPL2')

# These dependencies have not been recently reviewed to cull unnecessary entries
depends=('avahi' 'fftw' 'lame' 'libass' 'libavc1394' 'libcdio' 'libiec61883' 'libgl'
         'libpulse' 'libva' 'libvpx' 'libxinerama' 'lirc-utils' 'mariadb-clients'
         'mysql-python' 'perl-dbd-mysql' 'perl-io-socket-inet6' 'perl-libwww'
         'perl-net-upnp' 'python2-lxml' 'qt5-webkit' 'qt5-script' 'taglib' 'urlgrabber' 'libx264'
	 'exiv2')
makedepends=('glew' 'libcec' 'libxml2' 'openssl' 'mesa' 'mesa-libgl' 'yasm' 'x264' 'gdb')
optdepends=('glew: for GPU commercial flagging'
            'libcec: for consumer electronics control capabilities'
            'libxml2: to read blu-ray metadata'
            'openssl: for AirTunes (RAOP) support'
            'udisks: detect changes to removable media'
            'xmltv: to download tv listings')
conflicts=('mythtv')
replaces=('mythtv')

install='mythtv.install'
source=('git://github.com/MythTV/mythtv.git#branch=master'
	'mythbackend.service')
sha256sums=('SKIP'
            'ecfde779ded8332cc62c86fac6b432b09cbf5d254135798287ada688af9a1302')

pkgver() {
  cd "$srcdir/mythtv"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  # Tweak sources to point to python2 instead of python3 (Arch default)
  # Ref. https://wiki.archlinux.org/index.php/Python

  cd "$srcdir/mythtv/mythtv"
  find bindings/python contrib -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

build() {
  cd "$srcdir/mythtv/mythtv"
  ./configure --prefix=/usr --python=/usr/bin/python2 --disable-distcc
  make
}

package() {
  cd "$srcdir/mythtv/mythtv"
  make INSTALL_ROOT="$pkgdir" install

  install -D -m644 "$srcdir/mythbackend.service" "$pkgdir/usr/lib/systemd/system/mythbackend.service"
  install -D -m644 'database/mc.sql' "$pkgdir/usr/share/mythtv/mc.sql"

  mkdir -p "$pkgdir/usr/share/mythtv"
  cp -R 'contrib' "$pkgdir/usr/share/mythtv"
  # I think the following is obsoleted by systemd/journald replacing syslog/mythlogserver
  mkdir -p "$pkgdir/var/log/mythtv"
}
