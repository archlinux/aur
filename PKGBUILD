# Maintainer: ahjolinna <ahjolinna@yahoo.com>
pkgname=mpv-ahjolinna-git
pkgver=20160929.b692037
pkgrel=2
pkgdesc="MPV with my ahjolinna config's (uses ffmpeg-full). (GIT version)"
arch=('x86_64')
depends=('desktop-file-utils'
         'smbclient'
         'libguess'
         'enca'
         'libxv'
         'libcdio-paranoia'
         'openal'
         'luajit'
         'lua'
         'libssh'
         'libcaca'
         'rsound'
         'libxss'
         'libdvdnav'
         'jack2'
         'libbluray'
         'libpulse'
         'x264'
         'x265'
         'libbs2b'
         'libgme'
         'mesa'
         'libxinerama'
         'libxrandr'
         'libxkbcommon'
         'hicolor-icon-theme'
         'sdl2'
         'lcms2'
         'lame'
         'ffmpeg'
         'libva'
         'rubberband'
         'uchardet'
         'libarchive'
         'libsoxr'
         'v4l-utils'
         'vapoursynth'
            )
license=('GPL3;BSD;LGPL')
url="http://mpv.io"
screenshot='http://i.imgur.com/eFjf71A.png'
makedepends=('git'
             'waf'
             'python-docutils'
             'yasm'
             'ladspa'
             'fontconfig'
             'fribidi'
             'acpitool'
             'inxi'
             )
optdepends=('youtube-dl: Another way to view youtuve videos with mpv'
            'zsh-completions: Additional completion definitions for Zsh users'
            'livestreamer: to watch live video streams (twitch.tv)'
            'vapoursynth-plugin-mvtools: Realtime motion interpolating playback in mpv'
            'acpitool: for battery detection'
            'inxi: HIDPI-detection')

provides=('mpv' 'mpv-git')
conflicts=('mpv' 'mpv-git')
options=('!emptydirs')
install=mpv-git.install

source=('git+https://github.com/mpv-player/mpv.git'
        'ftp://ftp.ritual.org/common/ColorManagement/BT.709_Profiles.zip'
        'https://github.com/ahjolinna/mpv-conf/raw/master/PKGBUILD/mpv.tar.gz'
        'mpv-uq.desktop'
        'mpv-hq.desktop'
        'mpv-mq.desktop'
        'mpv-MVtools.desktop'
        'mpv-lq.desktop'
         )

sha256sums=('SKIP'
            'd53aa2c59350a8e364b1a18a5509ba995826f7d37e34ad029251bee082f3c360'
            'fb0fea391407e3a91a158816a716a9ca2bbcc9d5070756a70ba07b31c6a76362'
            'f76c836c56ce84659a4e4256cc0afb515f87aa77e33dfa164e25f79ee5e2bdd5'
            'ddd18dbccdaa4513586cb97299e88564e3289940f25d7ebe762c4482fbad3809'
            '8cf41f23572417836084209fce343f779e72dea9688dc84e23e8eb913d002d5f'
            '9a7f7d78a71c5492709abfb8f4ad598fa02867e71b5645bb639850163264762b'
            'e02f7b07653ea4ce9745b9f699954f5a4eafd416ada5a5d032c7dd7294921f90')


backup=('etc/mpv/encoding-profiles.conf')

pkgver() {
  cd $srcdir/mpv
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

build() {
  cd $srcdir/mpv
  
  waf configure --prefix=/usr \
  --confdir=/etc/mpv \
  --disable-test \
  --disable-build-date \
  --enable-libmpv-shared \
  --enable-openal \
  --disable-sdl1 \
  --enable-sdl2 \
  --enable-libmpv-shared \
  --enable-zsh-comp \
  --enable-pulse \
  --enable-egl-x11 \
  --enable-wayland \
  --enable-vdpau \
  --enable-vaapi \
  --enable-libsmbclient \
  --enable-dvdread \
  --enable-libarchive \
  --lua=luajit \
  --enable-libavdevice \
  --enable-vapoursynth \
  --enable-vdpau-hwaccel \
  --enable-vaapi-hwaccel 
  
 
  sed -i 's/vendor-completions/site-functions/' wscript_build.py

  # waf looking for python2...
  sed -i 's/$? != 0/$? >> 8 != 0/' TOOLS/zsh.pl

  waf build
}

package() {
  cd $srcdir/mpv
  DESTDIR="${pkgdir}" waf install

  install -Dm755 $srcdir/mpv/TOOLS/mpv_identify.sh "${pkgdir}/usr/bin/mpv-identify"
  install -Dm755 $srcdir/mpv/TOOLS/umpv "${pkgdir}/usr/bin/umpv"

  install -Dm644 $srcdir/mpv/DOCS/encoding.rst "${pkgdir}/usr/share/doc/mpv/encoding.rst"
  install -Dm644 $srcdir/mpv/DOCS/edl-mpv.rst "${pkgdir}/usr/share/doc/mpv/edl-mpv.rst"
  install -Dm644 $srcdir/mpv/DOCS/client-api-changes.rst "${pkgdir}/usr/share/doc/mpv/client-api-changes.rst"
  install -Dm644 $srcdir/mpv/DOCS/contribute.md "${pkgdir}/usr/share/doc/mpv/contribute.md"
  
    # install the .desktop files
  install -Dm644 "${srcdir}/mpv-lq.desktop" "${pkgdir}/usr/share/applications/mpv-lq.desktop"
  install -Dm644 "${srcdir}/mpv-mq.desktop" "${pkgdir}/usr/share/applications/mpv-mq.desktop"
  install -Dm644 "${srcdir}/mpv-hq.desktop" "${pkgdir}/usr/share/applications/mpv-hq.desktop"
  install -Dm644 "${srcdir}/mpv-uq.desktop" "${pkgdir}/usr/share/applications/mpv-uq.desktop"
  install -Dm644 "${srcdir}/mpv-MVtools.desktop" "${pkgdir}/usr/share/applications/mpv-MVtools.desktop"
  
  # install BT.709 ICC profiles (https://github.com/mpv-player/mpv/issues/534#issuecomment-35823203)
   install -Dm755 "${srcdir}/BT.709_Profiles/BT.709.gamma.1.95.icc" "${pkgdir}/usr/share/color/icc/BT.709_Profiles/BT.709.gamma.1.95.icc"
   install -Dm755 "${srcdir}/BT.709_Profiles/BT.709.gamma.1.95.icc" "${pkgdir}/usr/share/color/icc/BT.709_Profiles/BT.709.icc"
   install -Dm755 "${srcdir}/BT.709_Profiles/BT.709.gamma.1.95.icc" "${pkgdir}/usr/share/color/icc/BT.709_Profiles/BT.709.linear.icc"
  
    #install configure files
  cp -R ${srcdir}/mpv/etc*/* ${pkgdir}/etc/mpv
    install -d "${pkgdir}/etc/mpv/"
  

 # sed 's|/usr/local/etc/mpv.conf|/etc/mpv.conf|g' -i "${pkgdir}/usr/share/doc/mpv/mpv.conf"

  (cd $srcdir/mpv/TOOLS/lua; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/mpv/scripts/${i}"; done)
}
