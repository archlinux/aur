# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=mpv-build-git
pkgver=v0.33.0.37.gbff5416dae
pkgrel=1
pkgdesc="Video player based on MPlayer/mplayer2 (uses statically linked ffmpeg). (GIT version)"
arch=('x86_64')
depends=(
         'fribidi'
         'gnutls'
         'jack'
         'lcms2'
         'libarchive'
         'libbluray.so'
         'libbs2b'
         'libcaca'
         'libcdio-paranoia'
         'libdav1d.so'
         'libdvdnav'
         'libgme'
         'libmysofa'
         'libplacebo.so'
         'libpulse'
         'libshaderc_shared.so'
         'libsoxr'
         'libssh'
         'libva.so'
         'libvdpau'
         'libxinerama'
         'libxkbcommon'
         'libxrandr'
         'libxss'
         'libxv'
         'luajit'
         'mujs'
         'openal'
         'rubberband'
         'sdl2'
         'sndio'
         'uchardet'
         'v4l-utils'
         'vulkan-icd-loader'
         'zimg'
         )
license=('GPL2' 'GPL3' 'LGPL3' 'LGPL2.1' 'BSD')
url='http://mpv.io'
makedepends=(
             'git'
             'python-docutils'
             'nasm'
             'ladspa'
             'fontconfig'
             'vulkan-headers'
             'wayland-protocols'
             'ffnvcodec-headers'
             'clang'
             )
optdepends=(
            'nvidia-utils: for hardware accelerated video decoding with CUDA'
            'youtube-dl: Another way to view youtuve videos with mpv'
            'zsh-completions: Additional completion definitions for Zsh users'
            'bash-completion: Additional completion definitions for Bash users'
            )
provides=('mpv'
          'libmpv.so'
          )
conflicts=('mpv'
           'libmpv.so'
           )
options=('!emptydirs')
source=('git+https://github.com/mpv-player/mpv-build.git'
        'git+https://github.com/mpv-player/mpv.git'
        'git+https://github.com/ffmpeg/ffmpeg.git'
        'git+https://github.com/libass/libass.git'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            )
backup=('etc/mpv/encoding-profiles.conf')

if [ -f /usr/lib/libvapoursynth.so ]; then
  depends+=('vapoursynth')
fi
if [ -f /usr/lib/libavisynth.so.*.*.* ]; then
  depends+=('avisynthplus-git')
fi

pkgver() {
  cd mpv
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd mpv-build
  git clone "${srcdir}/mpv"
  git clone "${srcdir}/ffmpeg"
  git clone "${srcdir}/libass"

  # Set ffmpeg/libass/mpv flags
  _ffmpeg_options=(
    '--disable-programs'
    '--enable-ladspa'
    '--enable-libbs2b'
    '--enable-libdav1d'
    '--enable-libgme'
    '--enable-libmysofa'
    '--enable-libsoxr'
    '--enable-libssh'
    '--enable-libjack'
    '--enable-libpulse'
    '--enable-nonfree'
    '--enable-cuda'
    )
if [ -f /usr/lib/libavisynth.so.*.*.* ]; then
  _ffmpeg_options+=('--enable-avisynth')
fi
if [ -f /usr/lib/libvapoursynth.so ]; then
  _ffmpeg_options+=('--enable-vapoursynth')
fi
  _mpv_options=(
    '--prefix=/usr'
    '--confdir=/etc/mpv'
    '--htmldir=/usr/share/doc/mpv/html'
    '--disable-build-date'
    '--lua=luajit'
    '--enable-cdda'
    '--enable-dvbin'
    '--enable-dvdnav'
    '--enable-html-build'
    '--enable-libarchive'
    '--enable-libmpv-shared'
    '--enable-openal'
    '--enable-sdl2'
    '--enable-shaderc'
    '--enable-vulkan'
    )

  echo ${_ffmpeg_options[@]} > ffmpeg_options
  echo ${_mpv_options[@]} > mpv_options

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
  install -Dm755 mpv/TOOLS/idet.sh "${pkgdir}/usr/bin/mpv-idet"
  install -Dm755 mpv/TOOLS/umpv "${pkgdir}/usr/bin/umpv"

  install -Dm644 mpv/DOCS/encoding.rst "${pkgdir}/usr/share/doc/mpv/encoding.rst"
  install -Dm644 mpv/DOCS/edl-mpv.rst "${pkgdir}/usr/share/doc/mpv/edl-mpv.rst"
  install -Dm644 mpv/DOCS/client-api-changes.rst "${pkgdir}/usr/share/doc/mpv/client-api-changes.rst"
  install -Dm644 mpv/DOCS/contribute.md "${pkgdir}/usr/share/doc/mpv/contribute.md"

  sed 's|/usr/local/etc/mpv.conf|/etc/mpv.conf|g' -i "${pkgdir}/usr/share/doc/mpv/mpv.conf"

  (cd mpv/TOOLS/lua; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/mpv/scripts/${i}"; done)

  install -Dm644 mpv/LICENSE.GPL "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.GPL"
  install -Dm644 mpv/LICENSE.GPL "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.LGPL"
}
