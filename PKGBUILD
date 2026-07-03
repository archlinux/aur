# Maintainer: johnnybash <georg at grgw dot de>
# Contributor: Alex Talker <alextalker at openmailbox dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Alexander Suhoverhov <cy at ngs dot ru>
# Contributor: Jookia <166291@gmail.com>
pkgname=xonotic-autobuild
pkgver=20250630
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

source=("rsync://beta.xonotic.org/autobuild-Xonotic/misc/tools/rsync-updater/update-to-autobuild.sh"
        "rsync://rsync.xonotic.org/autobuild/Xonotic/misc/tools/rsync-updater/mirrors.txt")
sha512sums=('42bda38036679851bafa2f24e0ef5f95a898aa2fb941dffc17f7eafc5bae21871ea3f57b5960229439353999bd8deba33a7c4c87299b6a5ee23ae8b4da65b615'
            '57e3eb4aa983e0d51b3012a651b772e04a1238e9fdeee37f11016809270cd05a1189f3c4c64621671011897a6c9e31dfc1b391452dddf30f1073cbfe56a85ef9')
b2sums=('0aa51a05dd38ce264c425ddfcec3ea46c0ed0899255376afb782a5fb9192ae9ea8fccef811d6aec303921a57b3049b6ec68c6ac1e5960244a10cb655377f14c3'
        '04f02f4b399a36cad1be1ca6b33ac212d8ad0db72e0756f52f6424473bd1968ebaeb805541633c7ea722deead9f1220272f5809065af1d24f58f46621701e183')

pkgver() {
  printf $(date +%Y%m%d -r Xonotic/xonotic-linux64-sdl)
}

prepare() {
  mkdir -p Xonotic/misc/tools/rsync-updater/
  cp update-to-autobuild.sh Xonotic/misc/tools/rsync-updater/
  cp mirrors.txt Xonotic/misc/tools/rsync-updater/
  cd Xonotic/misc/tools/rsync-updater/
  touch Xonotic
  sh ./update-to-autobuild.sh --yes
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
