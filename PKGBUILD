# Maintainer: Lars Hagström <lars@foldspace.nu>
pkgname=airtame-streamer
pkgver=1.0.3_15
pkgrel=1
pkgdesc="Stream your display to an airtame dongle."
arch=('x86_64')
url="http://www.airtame.com"
license=('Proprietary')
groups=()
provides=("airtame-streamer")
depends=("jsonrpc-c-git" "ffmpeg-compat")
makedepends=("unzip" "yasm")
install=
source=("http://downloads.airtame.com/update/ga/lin_x64/AIRTAME-v${pkgver//_/-}_x64.tar.gz"
        "enet::git+https://github.com/airtame/enet.git#branch=development"
        "zlog::git+https://github.com/airtame/zlog.git"
        "x264::git+git://git.videolan.org/x264.git#branch=stable"
        "streamer.sh"
        "airtame-streamer.service")
md5sums=('5709aee983075461f5dfbbbee8aaf953'
         'SKIP'
         'SKIP'
         'SKIP'
         '785d2c8f992b595a1bff48d6ec82c058'
         '99547aa5d4ff813ed62a5378673a4495')

backup=()

build() {
  cd "$srcdir/enet"
  autoreconf -vfi
  ./configure
  make

  cd "${srcdir}/zlog"
  make CFLAGS=-Wno-error=cpp

  cd "${srcdir}/x264"
  ./configure --enable-shared
  make

}

package() {
  cd "$srcdir"

  #create directories
  install -d ${pkgdir}/opt/airtame
  install -d ${pkgdir}/opt/airtame/bin
  install -d ${pkgdir}/opt/airtame/lib
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/lib/systemd/user

  #copy our own scripts
  cp streamer.sh ${pkgdir}/usr/bin/airtame-streamer

  #install our systemd user service
  cp airtame-streamer.service ${pkgdir}/usr/lib/systemd/user/

  #copy the executable to bin directory
  cp app/streamer/bin/airtame-streamer ${pkgdir}/opt/airtame/bin

  #copy the modules
  cp -r app/streamer/lib/airtame-modules ${pkgdir}/opt/airtame/modules

  #copy the airtame shared libraries only (the other libraries we use from our dependencies)
  cp app/streamer/lib/libairtame-* ${pkgdir}/opt/airtame/lib

  #copy the libraries that airtame have forked or used newer versions of,
  #and that we've built in the build() function
  cp enet/.libs/libenet.so.7.0.0 ${pkgdir}/opt/airtame/lib/libenet.so.7
  cp zlog/src/libzlog.so.1.2 ${pkgdir}/opt/airtame/lib
  cp x264/libx264.so.146 ${pkgdir}/opt/airtame/lib
}
