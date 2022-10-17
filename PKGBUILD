# Maintainer: Joaquín Aramendía <samsagax at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Samuel "scrufulufugus" Monson <smonson@irbash.net>
# Contributor: PedroHLC <root@pedrohlc.com>

_pkgname=gamescope
pkgname=gamescope-plus
pkgver=3.11.47
pkgrel=2
pkgdesc='SteamOS session compositing window manager with added patches'
arch=(x86_64)
url=https://github.com/Plagman/gamescope
license=(BSD)
conflicts=(gamescope)
provides=(gamescope)
depends=(
  gcc-libs
  glibc
  libcap.so
  libdrm
  libliftoff.so
  libpipewire-0.3.so
  libvulkan.so
  libwlroots.so
  libx11
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxkbcommon.so
  libxrender
  libxres
  libxtst
  libxxf86vm
  sdl2
  vulkan-icd-loader
  wayland
  wayland-protocols
  wlroots
  xorg-server-xwayland
)
makedepends=(
  git
  glslang
  meson
  ninja
  vulkan-headers
)
_tag=b87660561fd3b48e55a26febac4aa5cd6b459172
source=("git+https://github.com/Plagman/gamescope.git#tag=${_tag}"
        "0001-Add-force-orientation-option.patch"
        "0002-drm-add-support-for-the-panel-orientation-property.patch"
        "0003-drm-de-duplicate-connector-type-logic.patch"
        "0004-drm-fix-an-issue-where-g_nOutputWidth-and-g_nOutputH.patch"
        "0005-Add-note-that-force-orientation-is-for-internal-disp.patch"
        "0006-Check-for-current-and-pending-mode_id-before-abort.patch")

b2sums=('SKIP'
        'a9df35e654243800edc73a40d63a2331c5df01df89ccbdccd5fee9ab035c1502cc564ce6e9c95711974d75c46d8b44cd7565fd4e8dae55cfc2dcb479fb8fb621'
        'f5b58715eb27b9009fc9692b90ae592e829649830c563dc7d9bf8597e22682694578ccaafba72b10a1420510bc791cf88d4438d1e6f642bd3052b8fd6473daa6'
        'c20a9f48065e60fe85ec81b06e31174dd77541fa14235f7f1b0f1e288493d7c5130ca35648413b1b7c9edafde408828c963a6ef56f8408ebcc0ee87d8ac6cce0'
        '8067bf9bb87b0583dd549dfc32d611aa1e9779eaae6923772e976b948466bede2240345126c0dc56806eac8cdfc18c65b661f99defa6d2b6a88124b9ce3620e2'
        '0a74da00387a555981f7184f40ee05ae713d456022808564d99cef0263968e458d37c70b052a95791aead05587fc3ed59df4edd4a6a32a40f74f9b1a6d991b3e'
        '50282530f918023f3148d07eb8ba58678c1a4d3d09269db3b9100d49595cd5ea154ae092a6c1c30f1f560fbd7ce2b863c9a5019187256ab5ef35673cd9304075')

prepare() {
  cd "$srcdir/$_pkgname"

  for src in "${source[@]}"; do
      src="${src%%::*}"
      src="${src##*/}"
      [[ $src = *.patch ]] || continue
      echo "Applying patch $src..."
      git apply "../$src"
  done

  meson subprojects download
}

#pkgver() {
#  cd gamescope
#  git describe --tags | sed 's/-//'
#}

build() {
  export LDFLAGS="$LDFLAGS -lrt"
  arch-meson gamescope build \
    -Dforce_fallback_for=stb \
    -Dpipewire=enabled
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 gamescope/LICENSE -t "${pkgdir}"/usr/share/licenses/gamescope/
}

# vim: ts=2 sw=2 et:
