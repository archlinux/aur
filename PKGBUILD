# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=mpv-build-git
pkgver=20150904.215afe7
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
         'mesa'
         'libxinerama'
         'libxrandr'
         'libxkbcommon'
         'hicolor-icon-theme'
         'sdl'
         'sdl2'
         'lcms2'
         'lame'
         'lcms2'
         'libva'
         'rubberband'
         'uchardet'
         'libarchive'
         # 'vapoursynth'
         )
license=('GPL2')
url="http://mpv.io/"
makedepends=('git'
             'python-docutils'
             'yasm'
             'ladspa'
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
        'git+http://anongit.freedesktop.org/git/fribidi/fribidi.git')
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')
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
  ln -s ../fribidi

  # Set ffmpeg/libass/fribidi/mpv flags
  echo "--disable-programs --enable-libx264 --enable-libmp3lame --enable-libfdk-aac --enable-libssh --enable-nonfree --enable-ladspa --enable-libbs2b" > ffmpeg_options
  echo "--prefix=/usr --confdir=/etc/mpv --enable-openal --enable-sdl2 --enable-libmpv-shared --enable-zsh-comp --lua=52arch --enable-egl-x11 --enable-libarchive" > mpv_options

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

  sed 's|/usr/local/etc/mpv.conf|/usr/local/etc/mpv.conf or /etc/mpv.conf|g' -i "${pkgdir}/usr/share/doc/mpv/example.conf"

  pushd mpv/TOOLS/lua &> /dev/null
  for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/mpv/scripts/${i}"; done
  popd &> /dev/null

  pushd mpv/DOCS/client_api_examples &> /dev/null
  for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/mpv/client_api_examples/${i}"; done
  popd &> /dev/null
}
