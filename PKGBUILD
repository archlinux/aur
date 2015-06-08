# Maintainer: Gustavo Alvarez <s1lpkn07@gmail.com>

pkgname=mplayer2-build-git
pkgver=2.0.728.g2c378c7
pkgrel=6
pkgdesc="A movie player for linux (uses statically linked libav). (GIT version)"
arch=('i686' 'x86_64')
depends=('a52dec' 'desktop-file-utils' 'directfb' 'enca' 'faad2' 'fribidi' 'jack' 'lcms2' 'libbluray' 'libbs2b' 'libcaca' 'libcdio-paranoia' 'libdca' 'libgl' 'libmng'
         'libdv' 'libdvdnav' 'libdvdcss' 'libmad' 'libpulse' 'libquvi' 'libtheora' 'libvdpau' 'libxv' 'libxinerama' 'libxss' 'libxxf86vm' 'lirc-utils' 'mpg123'
         'nut-multimedia-git' 'portaudio' 'rsound' 'smbclient' 'speex' 'ttf-font' 'xvidcore')
license=('GPL')
url="http://www.mplayer2.org/"
makedepends=('git' 'live-media' 'mesa' 'python' 'python-docutils' 'vstream-client' 'yasm')
backup=('etc/mplayer/codecs.conf'
        'etc/mplayer/input.conf')
provides=('mplayer' 'mplayer2')
conflicts=('mplayer' 'mplayer2')
replaces=('mplayer' 'mplayer2')
options=('!emptydirs')
source=('http://ftp.mplayer2.org/pub/release/mplayer2-2.0.tar.xz'
        'git://git.mplayer2.org/mplayer2-build.git'
        'git://git.mplayer2.org/mplayer2.git'
        'libav::git://repo.or.cz/FFMpeg-mirror/mplayer-patches.git'
        'git+https://github.com/libass/libass.git'
        'http://devel.mplayer2.org/raw-attachment/ticket/265/0004-use-pkg-config-for-dvdnav.patch'
        'http://devel.mplayer2.org/raw-attachment/ticket/265/0005-switch_title-switch-to-next-title-if-no-parameter-pa.patch'
        'stream_dvdnav.diff'
        'giflib-5.0.patch'
        'giflib-5.1.patch'
        'libquvi-0.9.patch'
        'include-samba-4.0.patch')
noextract=('mplayer2-2.0.tar.xz')
sha1sums=('0df8d4e5484128b7b28029273b7704ab5d5419bc'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'a073d296dbebfd9caead117eb0edefe317a97fd8'
          '901d3a80e6c69f1f804c102d1c5b7b294e8d30c9'
          '0d06ab2bdde0fdabe750ae528b0351149e9640e5'
          'f8b33a47c4aae10fdd6de246667dd0f7900a3142'
          '85d54b02f6f59fa9bd785d403c852031dcb517af'
          '06919a6dc0ae8db9e8ab50b55bb83a26445de51d'
          '8c2fc1526a413cd821b46fd48ea08364abbf5c4c')

install=mplayer2-build-git.install
_gitname="mplayer2-build"

pkgver() {
  cd "${srcdir}/mplayer2"
  echo "$(git describe --always | tr - . | tr -d v)"
}

prepare() {
  cd "${_gitname}"
  git submodule init
  git config submodule.mplayer.url "${srcdir}/mplayer2"
  git config submodule.libass.url "${srcdir}/libass"
  git config submodule.libav.url "${srcdir}/libav"
  ./init


  # Install language sources to "i18n"
  bsdtar -xf "${srcdir}/mplayer2-2.0.tar.xz" mplayer2-2.0/po
  rm -fr mplayer/po
  mv mplayer2-2.0/po mplayer/po
  rm -fr mplayer2-2.0

  cd mplayer

  # Patch to use pkg-config method to get libdvdread/libdvdnav libs/headers info instead dvdnav-config/dvdread-config
  patch -p1 -i ../../0004-use-pkg-config-for-dvdnav.patch
  patch -p1 -i ../../0005-switch_title-switch-to-next-title-if-no-parameter-pa.patch

  # Fix build with libdvdnav-git
  if [ "$(pkg-config --modversion dvdnav)" != "4.2.1" ]; then
    msg2 "libdvdnav-git is installed: patching sources"
    patch -p1 -i ../../stream_dvdnav.diff
  fi

  # Fix build with giflib 5.1.x
  patch -p1 -i ../../giflib-5.0.patch
  patch -p1 -i ../../giflib-5.1.patch

  # use libquvi 0.9x series
  patch -p1 -i ../../libquvi-0.9.patch

  # Fix samba includes
  patch -p1 -i ../../include-samba-4.0.patch


  # Make Mplayer2 build flags
  echo '--confdir=/etc/mplayer
--enable-translation
--language=all
--prefix=/usr
--enable-joystick
--enable-gif' > ../mplayer_options
}

build() {
  make -C mplayer2-build
}

package() {
  cd mplayer2-build
  make DESTDIR="${pkgdir}" install
  install -Dm644 mplayer/etc/{codecs,input,example}.conf "${pkgdir}/etc/mplayer/"
  install -Dm644 mplayer/etc/mplayer.desktop "${pkgdir}/usr/share/applications/mplayer.desktop"
  install -Dm644 mplayer/etc/mplayer.xpm "${pkgdir}/usr/share/pixmaps/mplayer.xpm"
  sed -e 's|gmplayer|mplayer|' -e 's|GTK;||' -i "${pkgdir}/usr/share/applications/mplayer.desktop"
  echo 'NoDisplay=true' >> "${pkgdir}/usr/share/applications/mplayer.desktop"
}
