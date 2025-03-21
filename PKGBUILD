# Maintainer: johnnybash <georg at grgw dot de>
# Contributor: Alex Talker <alextalker at openmailbox dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Alexander Suhoverhov <cy at ngs dot ru>
# Contributor: Jookia <166291@gmail.com>
pkgname=xonotic-autobuild
pkgver=20250321
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
sha512sums=('173d904a44f65cbcfe834dada14a91067b3c273dca43b1c8c494ff8f242ff023cdb743a85e17a83d0f7370212ea3ecb9caac29aa893c5663adf8b7431212377c'
            'bfb6daec9571ee0974085c8b05662aeb284e5fb28fa0a5862c8b822994f445c09d798a30d9e72822e65fc54368407b61c7b6222defaf8d343cd8be2a45df6070')
b2sums=('10ad48746e2881f6a1f61fa6d639463c5f50b3a473dcf8e6b51ce2303085ca5c29c4fbc474b945b0baba41e4b10220302ee4091bd4b7095b2f20b2566f128ddf'
        '410315bac2a8028c7d9f07621355365c28b7084d00051257654dde6954d8f18f31321156f11aecb5fbc632298a5904828c960d0a31a5a579ff8de96eacbee7ba')

pkgver() {
  printf $(date +%Y%m%d -r Xonotic/xonotic-linux64-sdl)
}

prepare() {
  mkdir -p Xonotic/misc/tools/rsync-updater/
  cp update-to-autobuild.sh Xonotic/misc/tools/rsync-updater/
  cp mirrors.txt Xonotic/misc/tools/rsync-updater/
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
