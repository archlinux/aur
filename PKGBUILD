# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=mpv-build-git
pkgver=20160109.bd5a02d
pkgrel=1
pkgdesc="Video player based on MPlayer/mplayer2 (uses statically linked ffmpeg). (GIT version)"
arch=('i686' 'x86_64' )
depends=('desktop-file-utils'
         'smbclient'
         'libguess'
         'enca'
         'libxv'
         'libfdk-aac'
         'libcdio-paranoia'
         'openal'
         'lua52'
         'libssh'
         'libcaca'
         'rsound'
         'libxss'
         'libdvdnav'
         'jack2'
         'libbluray'
         'libpulse'
         'libx264'
         'libbs2b'
         'libgme'
         'mesa'
         'libxinerama'
         'libxrandr'
         'libxkbcommon'
         'hicolor-icon-theme'
         'sdl'
         'sdl2'
         'lcms2'
         'lame'
         'libva'
         'rubberband'
         'uchardet'
         'libarchive'
         'libsoxr'
         'v4l-utils'
         'libvdpau'
         # 'vapoursynth'
         )
license=('GPL2' 'GPL3')
url='http://mpv.io'
makedepends=('git'
             'python-docutils'
             'yasm'
             'ladspa'
             'fontconfig'
             'fribidi'
             )
optdepends=('youtube-dl: Another way to view youtuve videos with mpv'
            'zsh-completions: Additional completion definitions for Zsh users')
provides=('mpv')
conflicts=('mpv')
options=('!emptydirs')
install=mpv-build-git.install
source=('git+https://github.com/mpv-player/mpv-build.git'
        'git+https://github.com/mpv-player/mpv.git'
        'ffmpeg::git+https://github.com/FFmpeg/FFmpeg.git'
        'git+https://github.com/libass/libass.git'
        #'git+http://anongit.freedesktop.org/git/fribidi/fribidi.git'
        )
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          #'SKIP'
          )
backup=('etc/mpv/encoding-profiles.conf')

pkgver() {
  cd mpv
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
  cd mpv-build
  ln -s ../mpv
  ln -s ../ffmpeg
  ln -s ../libass
  #ln -s ../fribidi

  # Set ffmpeg/libass/fribidi/mpv flags
  echo "--disable-programs \
        --enable-libx264 \
        --enable-libmp3lame \
        --enable-libfdk-aac \
        --enable-libssh \
        --enable-nonfree \
        --enable-ladspa \
        --enable-libbs2b \
        --enable-libgme \
        --enable-libsoxr" > ffmpeg_options
  echo "--prefix=/usr \
        --confdir=/etc/mpv \
        --enable-openal \
        --enable-sdl2 \
        --enable-libmpv-shared \
        --enable-zsh-comp \
        --enable-libarchive \
        --lua=52arch \
        --enable-gpl3" > mpv_options

  cd mpv

  # Download Waf script
  ./bootstrap.py
}

build() {
  cd mpv-build
  ./build
}

package() {
  cd mpv-build
  DESTDIR="${pkgdir}" ./install

  install -Dm755 mpv/TOOLS/mpv_identify.sh "${pkgdir}/usr/bin/mpv-identify"
  install -Dm755 mpv/TOOLS/umpv "${pkgdir}/usr/bin/umpv"

  install -Dm644 mpv/DOCS/encoding.rst "${pkgdir}/usr/share/doc/mpv/encoding.rst"
  install -Dm644 mpv/DOCS/edl-mpv.rst "${pkgdir}/usr/share/doc/mpv/edl-mpv.rst"
  install -Dm644 mpv/DOCS/client-api-changes.rst "${pkgdir}/usr/share/doc/mpv/client-api-changes.rst"
  install -Dm644 mpv/DOCS/contribute.md "${pkgdir}/usr/share/doc/mpv/contribute.md"

  sed 's|/usr/local/etc/mpv.conf|/etc/mpv.conf|g' -i "${pkgdir}/usr/share/doc/mpv/example.conf"

  (cd mpv/TOOLS/lua; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/mpv/scripts/${i}"; done)

  (cd mpv/DOCS/client_api_examples; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/mpv/client_api_examples/${i}"; done)
}
