# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=mpv-build-git
pkgver=0.37.0.51.gc7d8e155d2
pkgrel=1
pkgdesc="Video player based on MPlayer/mplayer2 (uses statically linked ffmpeg). (GIT version)"
arch=('x86_64')
depends=(
  'gcc-libs'
  'glibc'
  'bash'
  'fribidi' 'libfribidi.so'
  'fontconfig' 'libfontconfig.so'
  'freetype2' 'libfreetype.so'
  'gnutls'
  'jack' 'libjack.so'
  'lcms2' 'liblcms2.so'
  'libarchive' 'libarchive.so'
  'libbluray' 'libbluray.so'
  'libdvdread' #libdvdread.so
  'libdvdnav' #'libdvdnav.so'
  'libbs2b' 'libbs2b.so'
  'libcaca'
  'libcdio'
  'libcdio-paranoia'
  'dav1d' 'libdav1d.so'
  'libdovi' 'libdovi.so'
  'libgme'
  'libmysofa'
  'libpulse' 'libpulse.so'
  'shaderc' 'libshaderc_shared.so'
  'libsixel'
  'libsoxr'
  'libssh' 'libssh.so'
  'libva' 'libva.so' 'libva-drm.so' 'libva-wayland.so' 'libva-x11.so'
  'libvdpau'
  'libxinerama'
  'libxkbcommon' 'libxkbcommon.so'
  'libx11'
  'libxcb'
  'libxext'
  'libxpresent'
  'libxrandr'
  'libxss'
  'libxv'
  'zimg' 'libzimg.so'
  'luajit'
  'mujs'
  'openal' 'libopenal.so'
  'rubberband' 'librubberband.so'
  'libpipewire' 'libpipewire-0.3.so'
  'sdl2'
  'sndio' 'libsndio.so'
  'uchardet'
  'v4l-utils'
  'davs2'
  'ffnvcodec-headers'
  'wayland-protocols'
  'alsa-lib' 'libasound.so'
  'libglvnd' 'libEGL.so' 'libGL.so'
  'glslang' #'libSPIRV.so'
  'libdrm'
  'bzip2' 'libbz2.so'
  'harfbuzz' 'libharfbuzz.so'
  'libunwind'
  'xz' 'liblzma.so'
  'libmysofa' 'libmysofa.so'
  'wayland' 'libwayland-client.so' 'libwayland-cursor.so' 'libwayland-egl.so'
  'libjpeg-turbo' 'libjpeg.so'
  'vulkan-icd-loader' 'libvulkan.so'
  'mesa'
  'zlib' 'libz.so'
  'python'
  'hicolor-icon-theme'
  'xxhash' 'libxxhash.so'
)

license=('GPL2' 'GPL3' 'LGPL3' 'LGPL2.1' 'BSD')
url='http://mpv.io'
makedepends=(
  'git'
  'meson'
  'python-docutils'
  'nasm'
  'ladspa'
  'vulkan-headers'
  'ffnvcodec-headers-git'
  'python-mako'
  'python-jinja'
  'python-markupsafe'
  'nuklear'
  'glad'
  'jbigkit'
)
optdepends=(
  'nvidia-utils: for hardware accelerated video decoding with CUDA'
  'youtube-dl: Another way to view youtuve videos with mpv'
  'yt-dlp: Another way to view youtuve videos with mpv'
  'zsh-completions: Additional completion definitions for Zsh users'
  'bash-completion: Additional completion definitions for Bash users'
)
provides=(
  'mpv'
  'libmpv.so'
)
conflicts=('mpv')
options=('!emptydirs' 'debug')
source=(
  'git+https://github.com/mpv-player/mpv-build.git'
  'git+https://github.com/mpv-player/mpv.git'
  'git+https://github.com/ffmpeg/ffmpeg.git'
  'git+https://github.com/libass/libass.git'
  'git+https://github.com/haasn/libplacebo.git'
  'git+https://github.com/fastfloat/fast_float.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)
backup=('etc/mpv/encoding-profiles.conf')

if [ -f /usr/lib/libvapoursynth.so ]; then
  depends+=('vapoursynth')
fi
if [ -f /usr/lib/libavisynth.so.*.*.* ]; then
  depends+=('avisynthplus')
fi

pkgver() {
  cd mpv
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd mpv-build
  # use arch-meson
  sed -e 's|meson setup|arch-meson|g' \
      -e 's|-Dbuildtype=release|--auto-features disabled|g' \
      -e '/LDFLAGS=/s/^/#/' \
      -i scripts/{mpv,libplacebo}-config

  git clone "${srcdir}/mpv"
  git clone "${srcdir}/ffmpeg"
  git clone "${srcdir}/libass"
  git clone "${srcdir}/libplacebo"

  # Set libplacebo/ffmpeg/libass/mpv flags

  _libplacebo_options=(
    '-Dvulkan=enabled'
    '-Dglslang=enabled'
    '-Dshaderc=enabled'
    '-Dlcms=enabled'
    '-Dd3d11=disabled'
    )

  _ffmpeg_options=(
    '--disable-programs'
    '--enable-libbs2b'
    '--enable-libdav1d'
    '--enable-libgme'
    '--enable-libmysofa'
    '--enable-libsoxr'
    '--enable-libssh'
    '--enable-libjack'
    '--enable-libpulse'
    '--enable-libdavs2'
    '--enable-nonfree'
    '--enable-cuda'
    '--enable-vulkan'
    '--enable-libshaderc'
    '--disable-cuda-llvm'
    )

  _mpv_options=(
    '-Ddefault_library=shared'
    '-Dlibmpv=true'
    '-Dbuild-date=false'

    '-Dcdda=enabled'
    '-Dcplugins=enabled'
    '-Ddvbin=enabled'
    '-Ddvdnav=enabled'
    '-Diconv=enabled'
    '-Djavascript=enabled'
    '-Dlcms2=enabled'
    '-Dlibarchive=enabled'
    '-Dlibavdevice=enabled'
    '-Dlibbluray=enabled'
    '-Dlua=luajit'
    '-Drubberband=enabled'
    '-Dsdl2=enabled'
    '-Dsdl2-gamepad=enabled'
    '-Duchardet=enabled'
    '-Dzimg=enabled'
    '-Dzlib=enabled'

    '-Dalsa=enabled'
    '-Djack=enabled'
    '-Dopenal=enabled'
    '-Dpipewire=enabled'
    '-Dpulse=enabled'
    '-Dsdl2-audio=enabled'
    '-Dsndio=enabled'

    '-Dcaca=enabled'
    '-Ddrm=enabled'
    '-Degl=enabled'
    '-Degl-drm=enabled'
    '-Degl-wayland=enabled'
    '-Degl-x11=enabled'
    '-Dgbm=enabled'
    '-Dgl=enabled'
    '-Dgl-x11=enabled'
    '-Djpeg=enabled'
    '-Dsdl2-video=enabled'
    '-Dsixel=enabled'
    '-Dplain-gl=enabled'
    '-Dvdpau=enabled'
    '-Dvdpau-gl-x11=enabled'
    '-Dvaapi=enabled'
    '-Dvaapi-x11=enabled'
    '-Dvaapi-wayland=enabled'
    '-Dvaapi-drm=enabled'
    '-Dvulkan=enabled'
    '-Dwayland=enabled'
    '-Ddmabuf-wayland=enabled'
    '-Dvulkan-interop=enabled'
    '-Dx11=enabled'
    '-Dxv=enabled'
    '-Dcuda-hwaccel=enabled'
    '-Dcuda-interop=enabled'

    '-Dhtml-build=enabled'

    # Fix Build
    '-Dc_link_args=-lstdc++'
    )

if [ -f /usr/lib/libavisynth.so.*.*.* ]; then
   _ffmpeg_options+=('--enable-avisynth')
fi
if [ -f /usr/lib/libvapoursynth.so ]; then
  _ffmpeg_options+=('--enable-vapoursynth')
  _mpv_options+=('-Dvapoursynth=enabled')
fi

  (IFS=$'\n'; echo "${_libplacebo_options[*]}" > libplacebo_options )
  (IFS=$'\n'; echo "${_ffmpeg_options[*]}" > ffmpeg_options )
  (IFS=$'\n'; echo "${_mpv_options[*]}" > mpv_options )

  cd libplacebo
  git config submodule.3rdparty/fast_float.url "${srcdir}/fast_float"
  git -c protocol.file.allow=always submodule update --init \
     3rdparty/fast_float
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
  install -Dm644 mpv/LICENSE.LGPL "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.LGPL"
}
