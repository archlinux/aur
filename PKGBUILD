# Maintainer: Joaquín Aramendía <samsagax at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

_pkgname=gamescope
pkgname=lib32-gamescope-plus
pkgver=3.11.52.beta2.38.g51357e1
pkgrel=1
pkgdesc='SteamOS session compositing window manager with added patches (32-bit)'
arch=(x86_64)
url=https://github.com/Samsagax/gamescope
license=(BSD)
conflicts=(lib32-gamescope)
provides=(lib32-gamescope)
depends=(
  lib32-wayland
  lib32-libx11
  lib32-libxcb
  lib32-vulkan-icd-loader
)
makedepends=(
  git
  meson
  ninja
  patch
  cmake
  vulkan-headers
)
_tag=51357e139facb99a2d0d3acd6272edc46f53c411
source=("git+https://github.com/Samsagax/gamescope.git#commit=${_tag}"
        "git+https://gitlab.freedesktop.org/wlroots/wlroots.git"
        "git+https://gitlab.freedesktop.org/emersion/libliftoff.git"
        "git+https://gitlab.freedesktop.org/emersion/libdisplay-info.git"
        "git+https://github.com/Joshua-Ashton/vkroots.git"
        "git+https://github.com/nothings/stb.git"
        )

b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        )

prepare() {
  cd "$srcdir/$_pkgname"

  for src in "${source[@]}"; do
      src="${src%%::*}"
      src="${src##*/}"
      [[ $src = *.patch ]] || continue
      echo "Applying patch $src..."
      git apply "../$src"
  done

  git submodule init
  git config submodule.subprojects/wlroots.url "$srcdir/wlroots"
  git config submodule.subprojects/libliftoff.url "$srcdir/libliftoff"
  git config submodule.subprojects/libdisplay-info.url "$srcdir/libdisplay-info"
  git config submodule.subprojects/vkroots.url "$srcdir/vkroots"
  git -c protocol.file.allow=always submodule update

  # make stb.wrap use our local clone
  sed -i "s|https://github.com/nothings/stb.git|$srcdir/stb|" "subprojects/stb.wrap"

  meson subprojects download
}

pkgver() {
  cd gamescope
  git describe --tags | sed 's/\-/\./g'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"
  export LDFLAGS="$LDFLAGS -lrt"
  arch-meson gamescope build \
    --libdir=/usr/lib32 \
    --buildtype release \
    --prefix /usr \
    -Denable_gamescope=false \
    -Denable_openvr_support=false \
    -Dforce_fallback_for=stb,libliftoff,wlroots \
    -Dpipewire=disabled \
    -Dwlroots:backends=drm,libinput,x11 \
    -Dwlroots:renderers=gles2,vulkan
  ninja -C build
}

package() {
  meson install -C build --skip-subprojects --destdir="${pkgdir}"
  install -Dm 644 gamescope/LICENSE -t "${pkgdir}"/usr/share/licenses/lib32-gamescope-plus/

  rm -rf "$pkgdir"/usr/include
	rm -rf "$pkgdir"/usr/lib/libwlroots*
	rm -rf "$pkgdir"/usr/lib32/libwlroots*
	rm -rf "$pkgdir"/usr/lib/pkgconfig
	rm -rf "$pkgdir"/usr/lib32/pkgconfig
}

# vim: ts=2 sw=2 et:
