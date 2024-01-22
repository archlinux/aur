# Maintainer: johnnybash <georg at grgw dot de> PGP D126E2910543DE2D
# Contributor: Alex Talker <alextalker at openmailbox dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Alexander Suhoverhov <cy at ngs dot ru>
# Contributor: Jookia <166291@gmail.com>
pkgname=xonotic-autobuild
pkgver=20240103
pkgrel=1
pkgdesc="A free, fast-paced cross-platform first person shooter"
arch=('x86_64' 'aarch64')
url="http://xonotic.org"
license=('GPL-3.0-only')
depends=('alsa-lib' 'curl' 'libmodplug' 'libvorbis' 'libxpm'
         'sdl2' 'gtk-update-icon-cache' 'desktop-file-utils')
makedepends=('mesa' 'rsync')
options=('!debug' '!strip')
conflicts=('xonotic' 'xonotic-data' 'xonotic-git')

source=("rsync://beta.xonotic.org/autobuild-Xonotic/misc/tools/rsync-updater/update-to-autobuild.sh")
sha512sums=('0424d277aa60015716706ab6f601afc30a84a8ed6db9b0382edb6f1d88b72afcbc680d402849d0d644197e96862e3305721dbe89afdb70e634421b74eede09cc')
b2sums=('b93d73ce57b5ca77b7c6511f70f3701742eb2cdedc2d61940e94b211518fb94dc3165bacbe5eb94f183ab82570fb98f369b8a00018fed927abf001d4ca147cfb')

pkgver() {
  printf $(date +%Y%m%d)
}

prepare() {
  mkdir -p Xonotic/misc/tools/rsync-updater/
  cp update-to-autobuild.sh Xonotic/misc/tools/rsync-updater/
  cd Xonotic/misc/tools/rsync-updater/
  touch Xonotic
  sh ./update-to-autobuild.sh -y
}

build() {
  # compile engine
  make -C Xonotic/source/darkplaces \
    CPUOPTIMIZATIONS="${CFLAGS}" \
    DP_FS_BASEDIR=/usr/share/xonotic/ \
    DP_LINK_TO_LIBJPEG=1 \
    sdl-release

  make -C Xonotic/source/darkplaces \
    CPUOPTIMIZATIONS="${CFLAGS}" \
    DP_FS_BASEDIR=/usr/share/xonotic/ \
    DP_LINK_TO_LIBJPEG=1 \
    sv-release

  cd Xonotic/source/d0_blind_id
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd Xonotic
  # data
  install -d "$pkgdir"/usr/share/xonotic/
  mv data "$pkgdir"/usr/share/xonotic/

  # server stuff
  cp -r server "$pkgdir"/usr/share/xonotic/

  # binaries
  install -Dm755 source/darkplaces/darkplaces-dedicated "$pkgdir"/usr/bin/xonotic-dedicated
  install -Dm755 source/darkplaces/darkplaces-sdl "$pkgdir"/usr/bin/xonotic-sdl

  # convenience files
  install -d "$pkgdir"/usr/share/applications
  install -Dm644 misc/logos/xonotic.desktop -t $pkgdir/usr/share/applications

  for size in 16 22 24 32 48 64 128 256 512; do
    install -Dm644 misc/logos/icons_png/xonotic_${size}.png \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/xonotic.png"
  done

  # key
  install -Dm644 key_0.d0pk "$pkgdir"/usr/share/xonotic/key_0.d0pk

  # crypto stuff
  cd source/d0_blind_id
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2 et:
