# Maintainer: Myt1 <MYT @ QQ com>
# Maintainer: Levente Polyak <anthraxx@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=mplayer-gui-svn
pkgver=38666
pkgrel=1
pkgdesc='Media player for Linux'
url='http://www.mplayerhq.hu/'
arch=('x86_64')
license=('GPL')
makedepends=('xorgproto' 'libxxf86vm' 'libmad' 'libxinerama' 'libmng' 'libxss'
             'smbclient' 'aalib' 'jack' 'libcaca' 'faac' 'faad2' 'libmng' 'lirc' 'libxv'
             'libxvmc' 'enca' 'libdca' 'a52dec' 'libvpx' 'unzip' 'mesa'
             'yasm' 'git' 'mpg123' 'ladspa' 'libcdio' 'zlib'
             'libcdio-paranoia' 'subversion' 'x264' 'rtmpdump'
             'libdvdcss' 'libdvdread' 'libdvdnav' 'ffmpeg' 'giflib'
             'libbs2b' 'fribidi' 'opus' 'libvorbis' 'gsm'
             'libpulse' 'alsa-lib' 'glibc' 'libass' 'libjpeg'
             'libpng' 'libogg' 'libtheora' 'libbluray'
             'xvidcore' 'ncurses'
             'fontconfig' 'freetype2' 'libx11' 'libxext' 'libvdpau' 'libgl'
             'lame' 'desktop-file-utils' 'ttf-font' 'openal' 'speex'
             'libmpeg2' 'nasm')
options=('!emptydirs' '!lto')
conflicts=('mplayer' 'mencoder')
provides=('mplayer' 'mencoder')
install=mplayer-gui.install
source=(${pkgname}-${pkgver}::"svn://svn.mplayerhq.hu/mplayer/trunk#revision=${pkgver}"
        "include-samba-4.0.patch"
        "revert-icl-fixes.patch"
        "ffmpeg-7.patch"
        "default.tar.bz2::http://www.mplayerhq.hu/MPlayer/skins/Clearlooks-multilingual-2.0.9.tar.bz2"
        "font.tar.bz2::http://www.mplayerhq.hu/MPlayer/releases/fonts/font-arial-cp1250.tar.bz2")
sha512sums=('SKIP'
            '9debb8c58b996f6c716c22c86c720bf9dc49b4ee9b76c57519f791667ae1de2cc6f5add878fbf4ac02c6b6fd1865e1bcfa6105e75de4bf7ec596c338ed0cae99'
            '0cae0b26d3d97fd4c962962c43a481de20335369cbca406cadfc9bda1a0608b32f5374e76c477cb9a85bda83a568a1ed17126df224ae61579d0a402c1824aea8'
            '93185451be01fd872c5304f2b4ac2832a91b89397f7d920759ef4681dd43977d50c0207851721d7e8ec00ff3fbef93133aa54e8f6cf3d83190f8ab331e106a16'
            'f245810d219e9164e3903d1270e03685500ec1abfece0443ac034b61e05e0ac943e1adda923e311a388c56e5fe11c026495b2749f27825a6caff80cc5418e25c'
            '4f77ff5ceb8ec6e5d9f8f34d8950a6a6276d1fd5a947772fcbdb6554988b1ea665c12b82f45164f91fb7bd08000cb4afc26fa35beb4c760464160e22b9b8c340')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 < "../include-samba-4.0.patch"
  patch -p0 -i "../revert-icl-fixes.patch"
  ./version.sh

# Fix build with ffmpeg 7, https://lists.mplayerhq.hu/pipermail/mplayer-dev-eng/2024-April/074138.html
  patch -p0 -i ../ffmpeg-7.patch
}

build() {
  cd ${pkgname}-${pkgver}
  export CFLAGS="${CFLAGS/-march=x86-64/} -Wno-incompatible-pointer-types -Wno-implicit-function-declaration -Wno-int-conversion"
  export CFLAGS="${CFLAGS/-mtune=generic/}"
  export LDFLAGS="${LDFLAGS/-Wl,-O1/}"
  export LDFLAGS="${LDFLAGS/-Wl,--sort-common/}"
  ./configure --prefix=/usr \
    --enable-runtime-cpudetection \
    --enable-gui \
    --disable-arts \
    --disable-liblzo \
    --disable-libdv \
    --disable-musepack \
    --disable-esd \
    --disable-mga \
    --disable-ass-internal \
    --disable-cdparanoia \
    --disable-ffmpeg_a \
    --enable-radio \
    --enable-radio-capture \
    --enable-smb \
    --enable-freetype \
    --enable-menu \
    --language=all \
    --confdir=/etc/mplayer \
    --extra-cflags="${CFLAGS} ${CPPFLAGS}" \
    --extra-ldflags="${LDFLAGS}"
  make -j12
}

package() {
  pkgdesc='Media player for Linux'
  backup=('etc/mplayer/codecs.conf'
          'etc/mplayer/input.conf')
  depends=('desktop-file-utils' 'ttf-font' 'enca' 'libxss' 'a52dec' 'libvpx'
           'lirc' 'x264' 'libmng' 'libdca' 'aalib' 'libxinerama' 'smbclient'
           'jack' 'libmad' 'libcaca' 'libxxf86vm' 'faac' 'faad2'
           'libxv' 'libxvmc' 'mpg123' 'libx11' 'libcdio' 'libcdio-paranoia'
           'rtmpdump' 'libdvdread' 'libdvdnav' 'ffmpeg' 'libbs2b' 'alsa-lib'
           'giflib' 'libgif.so' 'glibc' 'libass' 'libass.so' 'zlib' 'libjpeg'
           'libpng' 'libpulse' 'libogg' 'fribidi' 'libtheora' 'libvorbis'
           'libvorbis.so' 'libbluray' 'libbluray.so' 'xvidcore'
           'libxvidcore.so' 'ncurses' 'libncursesw.so' 'fontconfig' 'freetype2'
           'libxext' 'libvdpau' 'libgl' 'openal' 'speex' 'libmpeg2')

  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/mplayerinstall -m755 -d "${pkgdir}/usr/share/
  install -Dm 644 etc/{codecs.conf,input.conf,example.conf} "${pkgdir}/etc/mplayer"
  install -Dm 644 etc/mplayer.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm 644 etc/mplayer256x256.png "${pkgdir}/usr/share/pixmaps/mplayer.png"  
  install -m755 -d "${pkgdir}/usr/share/mplayer/skins"
  mv $srcdir/Clearlooks-multilingual $pkgdir/usr/share/mplayer/skins/default
  mv $srcdir/font-arial-cp1250 $pkgdir/usr/share/mplayer/font
}

# vim: ts=2 sw=2 et:
