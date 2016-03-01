# Maintainer: Martin Gallant <arch-linux@goodbit.net>
# Based on /var/abs/community/mythtv/PKGBUILD version 0.27.4

pkgname=mythtv-git
pkgver=v0.28.pre.r3648.g7cd8149
pkgrel=1
pkgdesc='Free Open Source software digital video recorder (DVR) project'
url='http://www.mythtv.org/'
license=('GPL2')

# I am leaving in i686 for convenience, but have no way to properly test it
arch=('i686' 'x86_64')

# These dependencies have not been recently reviewed to cull unnecessary entries
depends=('avahi' 'fftw' 'lame' 'libass' 'libavc1394' 'libcdio' 'libiec61883' 'libgl'
         'libpulse' 'libva' 'libvpx' 'libxinerama' 'lirc-utils' 'mariadb-clients'
         'mysql-python' 'perl-dbd-mysql' 'perl-io-socket-inet6' 'perl-libwww'
         'perl-net-upnp' 'python2-lxml' 'qt5-webkit' 'qt5-script' 'taglib' 'urlgrabber' 'libx264'
	 'exiv2' 'sdl' 'xvidcore')
makedepends=('glew' 'libcec' 'libxml2' 'openssl' 'mesa' 'mesa-libgl' 'yasm' 'x264' 'gdb')
optdepends=('glew: for GPU commercial flagging'
            'libcec: for consumer electronics control capabilities'
            'libxml2: to read blu-ray metadata'
            'openssl: for AirTunes (RAOP) support'
            'udisks: detect changes to removable media'
            'xmltv: to download tv listings')
conflicts=('mythtv')
replaces=('mythtv')

# Install file creates mythtv user - I don't think it needs to be in all these groups
install='mythtv.install'
source=('git://github.com/MythTV/mythtv.git#branch=fixes/0.28'
	'mythbackend.service')
sha256sums=('SKIP'
            '0b26da03c76192579debc185802f2850335dc45e518c923c3c70935d3c5715e3')

pkgver() {
  cd "$srcdir/mythtv/mythtv"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  # Tweak sources to point to python2 instead of python3 (Arch default)
  # Ref. https://wiki.archlinux.org/index.php/Python

  cd "$srcdir/mythtv/mythtv"
  find bindings/python programs/scripts contrib -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

build() {
  cd "$srcdir/mythtv/mythtv"
  ./configure --compile-type=debug --prefix=/usr --disable-distcc \
              --enable-libmp3lame --enable-libx264 --enable-libxvid --enable-sdl \
              --python=python2 --perl-config-opts=INSTALLDIRS=vendor
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
