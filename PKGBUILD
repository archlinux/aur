# Maintainer:  Andrew Rabert <ar@nullsum.net>

# Note: The configure script will automatically enable most optional features it
# finds support for on your system. The dependencies of the built package will
# be updated based on dynamic libraries, but if you want to avoid linking
# against something you have installed, you'll have to disable it in the
# configure below.

pkgname=jellyfin-desktop-cef-libmpv-git
_gitname=mpv
epoch=1
pkgver=0.r54491.3e99d37
pkgrel=1
pkgdesc='libmpv for jellyfin-desktop-cef'
arch=('x86_64')
license=('GPL-2.0-or-later')
url='https://mpv.io'
depends=('ffmpeg' 'libplacebo' 'libass' 'libxkbcommon' 'libxpresent' 'libxss' 'wayland')
makedepends=('git'
             'meson'
             'python-docutils' # for rst2man, to generate manpage
             'pacman-contrib' # for pactree, used in find-deps.py
             'vulkan-headers'
             'wayland-protocols')
provides=('jellyfin-desktop-cef-libmpv')
options=('!emptydirs')
source=('git+https://github.com/andrewrabert/mpv#branch=libmpv-vulkan-gpu-next'
        'find-deps.py')
sha256sums=('SKIP'
            '1ba780ede4a28b68ae5b7ab839958ff91ed01d3c6c1d24cce8a5dd24492f8d2b')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_gitname"

  # Removing build dir, if present, ensures features omitted from the configure
  # command get their default values, and cleans up after waf if it was
  # previously used (which can cause the build to fail otherwise).
  # Downside is wasted recompilation.
  rm -rf build

  meson setup build \
        --prefix=/usr \
        --sysconfdir=/etc \
        --buildtype=plain \
        --wrap-mode=nodownload \
        -Dlibmpv=true \
        -Dcdda=disabled \
        -Ddvdnav=disabled \
        -Djavascript=disabled \
        -Dlua=disabled \
        -Dopenal=disabled \
        -Drubberband=disabled \
        -Duchardet=disabled \
        -Dvapoursynth=disabled \
        -Dx11=enabled \
        -Dwayland=enabled \
        "${_opt_extra_flags[@]}"

  meson compile -C build
}

package() {
  cd "$srcdir/$_gitname"

  # Install libmpv to /opt/jellyfin-desktop-cef/libmpv/
  install -Dm755 build/libmpv.so.2 "$pkgdir/opt/jellyfin-desktop-cef/libmpv/lib/libmpv.so.2"
  ln -s libmpv.so.2 "$pkgdir/opt/jellyfin-desktop-cef/libmpv/lib/libmpv.so"

  # Install headers
  install -Dm644 "$srcdir/$_gitname/include/mpv/client.h" "$pkgdir/opt/jellyfin-desktop-cef/libmpv/include/mpv/client.h"
  install -Dm644 "$srcdir/$_gitname/include/mpv/render.h" "$pkgdir/opt/jellyfin-desktop-cef/libmpv/include/mpv/render.h"
  install -Dm644 "$srcdir/$_gitname/include/mpv/render_gl.h" "$pkgdir/opt/jellyfin-desktop-cef/libmpv/include/mpv/render_gl.h"
  install -Dm644 "$srcdir/$_gitname/include/mpv/render_vk.h" "$pkgdir/opt/jellyfin-desktop-cef/libmpv/include/mpv/render_vk.h"
  install -Dm644 "$srcdir/$_gitname/include/mpv/stream_cb.h" "$pkgdir/opt/jellyfin-desktop-cef/libmpv/include/mpv/stream_cb.h"

  # Update dependencies automatically based on dynamic libraries
  _detected_depends=($(python3 "$srcdir"/find-deps.py "$pkgdir"/opt/jellyfin-desktop-cef/libmpv/lib/libmpv.so.2))
  echo 'Auto-detected dependencies:'
  echo "${_detected_depends[@]}" | fold -s -w 79 | sed 's/^/ /'
  depends=("${_detected_depends[@]}")
}
