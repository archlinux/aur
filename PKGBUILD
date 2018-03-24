# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=mpv-build-git
pkgver=v0.28.0.403.g59a04562b1
pkgrel=1
pkgdesc="Video player based on MPlayer/mplayer2 (uses statically linked ffmpeg). (GIT version)"
arch=('x86_64')
depends=(
         'crossc'
         'desktop-file-utils'
         'fribidi'
         'hicolor-icon-theme'
         'jack2'
         'lcms2'
         'libarchive'
         'libbluray.so'
         'libbs2b'
         'libcaca'
         'libcdio-paranoia'
         'libdvdnav'
         'libgme'
         'libmysofa'
         'libpulse'
         'libsoxr'
         'libssh'
         'libva'
         'libvdpau'
         'libxinerama'
         'libxkbcommon'
         'libxrandr'
         'libxss'
         'libxv'
         'luajit'
         'mujs'
         'openal'
         'rsound'
         'rubberband'
         'sdl2'
         'shaderc-git'
         'smbclient'
         'uchardet'
         'v4l-utils'
         'vulkan-icd-loader'
         'xdg-utils'
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
             )
optdepends=(
            'mpv-bash-completion-git: Additional completion definitions for Bash users'
            'nvidia-utils: for hardware accelerated video decoding with CUDA'
            'youtube-dl: Another way to view youtuve videos with mpv'
            'zsh-completions: Additional completion definitions for Zsh users'
            )
provides=('mpv')
conflicts=('mpv')
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

_enable_cuda=0
if [ -d /opt/cuda ]; then
  makedepends+=('cuda')
  _enable_cuda=1
fi

if [ -f /usr/lib/libvapoursynth.so ]; then
  depends+=('vapoursynth')
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
    '--enable-libgme'
    '--enable-libmysofa'
    '--enable-libsoxr'
    '--enable-libssh'
    '--enable-nonfree'
    )
  _mpv_options=(
    '--prefix=/usr'
    '--confdir=/etc/mpv'
    '--htmldir=/usr/share/doc/mpv/html'
    '--disable-test'
    '--disable-build-date'
    '--disable-vapoursynth-lazy'
    '--lua=luajit'
    '--enable-cdda'
    '--enable-dvbin'
    '--enable-dvdnav'
    '--enable-dvdread'
    '--enable-html-build'
    '--enable-libarchive'
    '--enable-libmpv-shared'
    '--enable-libsmbclient'
    '--enable-openal'
    '--enable-sdl2'
    '--enable-tv'
    '--enable-zsh-comp'
    )

if [ ${_enable_cuda} = "1" ]; then
  _ffmpeg_options+=('--extra-cflags="-I/opt/cuda/include"')
fi

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
}
