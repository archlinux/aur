# Maintainer: craftycorvid <me@ivanff.com>
#
# AUR release package: builds Choir from a tagged GitHub release tarball.
# (For the latest commit on main instead, see the choir-overlay-git package.)
pkgname=choir-overlay
pkgver=1.1.0
pkgrel=1
pkgdesc="Discord voice overlay for Vulkan + OpenGL games (not affiliated with Discord Inc.)"
arch=('x86_64')
url="https://github.com/craftycorvid/choir-overlay"
license=('MIT')
depends=('qt6-base' 'qt6-svg' 'vulkan-icd-loader' 'libglvnd')
makedepends=('meson' 'vulkan-headers')
conflicts=('choir-overlay-git')
# Only the .wrap files are committed upstream, so the release tarball carries no Dear ImGui
# or nlohmann/json sources. Fetch those wrap downloads here (checksummed by makepkg) and
# pre-seed meson's packagecache in prepare(), so build() resolves them with no network.
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "imgui-1.92.5.tar.gz::https://github.com/ocornut/imgui/archive/refs/tags/v1.92.5.tar.gz"
  "imgui_1.92.5-1_patch.zip::https://wrapdb.mesonbuild.com/v2/imgui_1.92.5-1/get_patch"
  "nlohmann_json-3.12.0.zip::https://github.com/nlohmann/json/releases/download/v3.12.0/include.zip"
)
noextract=(
  'imgui-1.92.5.tar.gz'
  'imgui_1.92.5-1_patch.zip'
  'nlohmann_json-3.12.0.zip'
)
sha256sums=(
  'a6803fc0a0bb1eb0ba42eef9b347f02286ced5a501c2eb302e84fbeed89ae73b'
  '0eb50fe9aeba1a51f96b5843c7f630a32ed2e9362d693c61b87e4fa870cf826d'
  '636e9099a55869f25a95739b345e844c6b42166a0a0d22837ffbedd8e7af0bce'
  'b8cb0ef2dd7f57f18933997c9934bb1fa962594f701cd5a8d3c2c80541559372'
)

prepare() {
  # meson looks here (by the wrap's source_filename/patch_filename) before downloading.
  mkdir -p "$srcdir/choir-overlay-$pkgver/subprojects/packagecache"
  cp -t "$srcdir/choir-overlay-$pkgver/subprojects/packagecache/" \
    "$srcdir/imgui-1.92.5.tar.gz" \
    "$srcdir/imgui_1.92.5-1_patch.zip" \
    "$srcdir/nlohmann_json-3.12.0.zip"
}

build() {
  meson setup "$srcdir/build" "$srcdir/choir-overlay-$pkgver" \
    --prefix=/usr --buildtype=release -Dbuild_tests=false
  meson compile -C "$srcdir/build"
}

package() {
  DESTDIR="$pkgdir" meson install -C "$srcdir/build"
  # imgui is linked statically into libchoir_overlay.so; the wrap also installs its
  # build-time libimgui.a — drop it (useless at runtime, namcap flags stray static libs).
  rm -f "$pkgdir/usr/lib/libimgui.a"
}
