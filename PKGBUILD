# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=mpv-build-git
pkgver=0.35.0.4.g62af31cbca
pkgrel=1
pkgdesc="Video player based on MPlayer/mplayer2 (uses statically linked ffmpeg). (GIT version)"
arch=('x86_64')
depends=(
         'libfribidi.so'
         'gnutls'
         'libjack.so'
         'liblcms2.so'
         'libarchive.so'
         'libbluray.so'
         'libbs2b.so'
         'libcaca'
         'libcdio-paranoia'
         'libdav1d.so'
         'libdvdnav.so'
         'libgme'
         'libmysofa'
         'libpulse.so'
         'libshaderc_shared.so'
         'libsixel'
         'libsoxr'
         'libssh.so'
         'libva.so'
         'libvdpau'
         'libxinerama'
         'libxkbcommon'
         'libxss'
         'libxv'
         'libzimg.so'
         'luajit'
         'mujs'
         'libopenal.so'
         'libxpresent'
         'librubberband.so'
         'libpipewire-0.3.so'
         'sdl2'
         'libsndio.so'
         'uchardet'
         'v4l-utils'
         'spirv-cross'
         'davs2'
         'glslang'
         )
license=('GPL2' 'GPL3' 'LGPL3' 'LGPL2.1' 'BSD')
url='http://mpv.io'
makedepends=(
             'git'
             'meson'
             'python-docutils'
             'nasm'
             'ladspa'
             'libdvdnav'
             'fontconfig'
             'vulkan-headers'
             'wayland-protocols'
             'ffnvcodec-headers'
             'rubberband'
             'zimg'
             'sndio'
             'python-mako'
             'python-jinja'
             'python-markupsafe'
             'nuklear'
             'glad'

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
options=('!emptydirs' 'debug')
source=('git+https://github.com/mpv-player/mpv-build.git'
        'git+https://github.com/mpv-player/mpv.git'
        'git+https://github.com/ffmpeg/ffmpeg.git'
        'git+https://github.com/libass/libass.git'
        'git+https://github.com/haasn/libplacebo.git'
        )
sha256sums=('SKIP'
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
      -e 's|-Dbuildtype=release|--auto-features disabled -Ddefault_library=shared|g' \
      -i scripts/{mpv,libplacebo}-config

  git clone "${srcdir}/mpv"
  git clone "${srcdir}/ffmpeg"
  git clone "${srcdir}/libass"
  git clone "${srcdir}/libplacebo"

  # Set ffmpeg/libass/libplacebo/mpv flags
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
    '--disable-cuda-llvm'
    )

  _mpv_options=(
    '-Dlibmpv=true'
    '-Dbuild-date=false'

    '-Dcdda=enabled'
    '-Dcplugins=enabled'
    '-Ddvbin=enabled'
    '-Ddvdnav=enabled'
    '-Diconv=enabled'
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
    '-Dlibplacebo=enabled'
    '-Dsdl2-video=enabled'
    '-Dshaderc=enabled'
    '-Dsixel=enabled'
    '-Dspirv-cross=enabled'
    '-Dplain-gl=enabled'
    '-Dvdpau=enabled'
    '-Dvdpau-gl-x11=enabled'
    '-Dvaapi=enabled'
    '-Dvaapi-x11=enabled'
    '-Dvaapi-wayland=enabled'
    '-Dvaapi-drm=enabled'
    '-Dvaapi-x-egl=enabled'
    '-Dvulkan=enabled'
    '-Dwayland=enabled'
    '-Dx11=enabled'
    '-Dxv=enabled'
    '-Dcuda-hwaccel=enabled'
    '-Dcuda-interop=enabled'

    '-Dhtml-build=enabled'
    )

  _libplacebo_options=(
    '-Dvulkan=enabled'
    '-Dlcms=enabled'
    '-Dd3d11=disabled'
    )

if [ -f /usr/lib/libavisynth.so.*.*.* ]; then
   _ffmpeg_options+=('--enable-avisynth')
fi
if [ -f /usr/lib/libvapoursynth.so ]; then
  _ffmpeg_options+=('--enable-vapoursynth')
  _mpv_options+=('-Dvapoursynth=enabled')
fi

  (IFS=$'\n'; echo "${_ffmpeg_options[*]}" > ffmpeg_options )
  (IFS=$'\n'; echo "${_mpv_options[*]}" > mpv_options )
  (IFS=$'\n'; echo "${_libplacebo_options[*]}" > libplacebo_options )

}

build() {
  cd mpv-build
  LDFLAGS+=',-Bsymbolic' #NOTE if not, fail link libmpv.so.x.x
  BUILDSYSTEM=meson ./build
}

package() {
  cd mpv-build
  BUILDSYSTEM=meson DESTDIR="${pkgdir}" ./install

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
