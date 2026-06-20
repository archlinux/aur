# Maintainer: craftycorvid <me@ivanff.com>
#
# AUR VCS package: builds Choir from the latest commit on the public repo's main branch.
pkgname=choir-overlay-git
pkgver=r65.g25f404f
pkgrel=1
pkgdesc="Wayland Discord voice overlay for Vulkan games (not affiliated with Discord Inc.)"
arch=('x86_64')
url="https://github.com/craftycorvid/choir-overlay"
license=('MIT')
depends=('qt6-base' 'vulkan-icd-loader')
makedepends=('git' 'meson' 'vulkan-headers')
provides=('choir-overlay')
conflicts=('choir-overlay')
# Dear ImGui + nlohmann/json are pulled via meson wraps. Fetch those wrap downloads here
# (checksummed) and pre-seed meson's packagecache in prepare() so build() resolves them
# offline — no network needed during the build itself.
source=(
  "$pkgname::git+https://github.com/craftycorvid/choir-overlay.git"
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
  'SKIP'
  '0eb50fe9aeba1a51f96b5843c7f630a32ed2e9362d693c61b87e4fa870cf826d'
  '636e9099a55869f25a95739b345e844c6b42166a0a0d22837ffbedd8e7af0bce'
  'b8cb0ef2dd7f57f18933997c9934bb1fa962594f701cd5a8d3c2c80541559372'
)

pkgver() {
  cd "$srcdir/$pkgname"
  # No release tags yet: r<commit-count>.g<short-hash>.
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # meson looks here (by the wrap's source_filename/patch_filename) before downloading.
  mkdir -p "$srcdir/$pkgname/subprojects/packagecache"
  cp -t "$srcdir/$pkgname/subprojects/packagecache/" \
    "$srcdir/imgui-1.92.5.tar.gz" \
    "$srcdir/imgui_1.92.5-1_patch.zip" \
    "$srcdir/nlohmann_json-3.12.0.zip"
}

build() {
  meson setup "$srcdir/build" "$srcdir/$pkgname" \
    --prefix=/usr --buildtype=release -Dbuild_tests=false
  meson compile -C "$srcdir/build"
}

package() {
  DESTDIR="$pkgdir" meson install -C "$srcdir/build"
  # imgui is linked statically into libchoir_overlay.so; the wrap also installs its
  # build-time libimgui.a — drop it (useless at runtime, namcap flags stray static libs).
  rm -f "$pkgdir/usr/lib/libimgui.a"
}
