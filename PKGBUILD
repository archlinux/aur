# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=mpv-build-git
pkgver=v0.27.0.308.g3413fe4dfd
pkgrel=1
pkgdesc="Video player based on MPlayer/mplayer2 (uses statically linked ffmpeg). (GIT version)"
arch=('i686' 'x86_64' )
depends=('desktop-file-utils'
         'hicolor-icon-theme'
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
         'libbluray.so'
         'libpulse'
         'libbs2b'
         'libgme'
         'libxinerama'
         'libxrandr'
         'libxkbcommon'
         'sdl2'
         'lcms2'
         'libva'
         'fribidi'
         'rubberband'
         'uchardet'
         'libarchive'
         'libsoxr'
         'v4l-utils'
         'libvdpau'
         'libmysofa'
         'mujs'
         'vulkan-icd-loader'
         'shaderc-git'
         'xdg-utils'
         )
license=('GPL2' 'GPL3' 'LGPL3' 'LGPL2.1' 'BSD')
url='http://mpv.io'
makedepends=('git'
             'python-docutils'
             'nasm'
             'ladspa'
             'fontconfig'
             'vulkan-headers'
             'wayland-protocols'
             )
optdepends=('youtube-dl: Another way to view youtuve videos with mpv'
            'zsh-completions: Additional completion definitions for Zsh users'
            'mpv-bash-completion-git: Additional completion definitions for Bash users'
            'nvidia-utils: for hardware accelerated video decoding with CUDA'
            )
provides=('mpv')
conflicts=('mpv')
options=('!emptydirs')
source=('git+https://github.com/mpv-player/mpv-build.git'
        'git+https://github.com/mpv-player/mpv.git'
        'git+https://github.com/mpv-player/ffmpeg-mpv.git'
        'git+https://github.com/libass/libass.git'
        'https://patch-diff.githubusercontent.com/raw/mpv-player/mpv/pull/4933.patch'
        )
sha256sums=('SKIP'
            'SKIP'
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
  git clone "${srcdir}/ffmpeg-mpv" ffmpeg
  git clone "${srcdir}/libass"

  # Set ffmpeg/libass/mpv flags
  _ffmpeg_options=(
    '--disable-programs'
    '--enable-nonfree'
    '--enable-libssh'
    '--enable-ladspa'
    '--enable-libbs2b'
    '--enable-libgme'
    '--enable-libmysofa'
    '--enable-libsoxr'
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
    '--enable-dvdnav'
    '--enable-dvdread'
    '--enable-libmpv-shared'
    '--enable-openal'
    '--enable-sdl2'
    '--enable-zsh-comp'
    '--enable-libarchive'
    '--enable-html-build'
    '--enable-tv'
    '--enable-dvbin'
    )

if [ ${_enable_cuda} = "1" ]; then
  _ffmpeg_options+=('--extra-cflags="-I/opt/cuda/include"')
fi

  echo ${_ffmpeg_options[@]} > ffmpeg_options
  echo ${_mpv_options[@]} > mpv_options

  cd mpv

  patch -p1 -i "${srcdir}/4933.patch"

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
