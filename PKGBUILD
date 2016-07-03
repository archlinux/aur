# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=mpv-build-git
pkgver=20160626.c509420
pkgrel=1
pkgdesc="Video player based on MPlayer/mplayer2 (uses statically linked ffmpeg). (GIT version)"
arch=('i686' 'x86_64' )
depends=('desktop-file-utils'
         'smbclient'
         'libguess'
         'enca'
         'libxv'
         'libcdio-paranoia'
         'openal'
         'luajit'
         'libssh'
         'libcaca'
         'rsound'
         'libxss'
         'libdvdnav'
         'jack2'
         'libbluray'
         'libpulse'
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
            'zsh-completions: Additional completion definitions for Zsh users'
            'mpv-bash-completion-git: Additional completion definitions for Bash users'
            )
provides=('mpv')
conflicts=('mpv')
options=('!emptydirs')
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
        --enable-libssh \
        --enable-nonfree \
        --enable-ladspa \
        --enable-libbs2b \
        --enable-libgme \
        --enable-libsoxr" > ffmpeg_options
  echo "--prefix=/usr \
        --confdir=/etc/mpv \
        --disable-test \
        --disable-build-date
        --enable-libmpv-shared \
        --enable-openal \
        --enable-sdl2 \
        --enable-zsh-comp \
        --enable-libarchive \
        --lua=luajit \
        --enable-libavdevice \
        --disable-vapoursynth-lazy" > mpv_options

  cd mpv
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

  sed 's|/usr/local/etc/mpv.conf|/etc/mpv.conf|g' -i "${pkgdir}/usr/share/doc/mpv/mpv.conf"

  (cd mpv/TOOLS/lua; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/mpv/scripts/${i}"; done)
}
