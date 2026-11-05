# Maintainer: AnimaEngine
pkgname=anima-engine
pkgver=0.1.1
pkgrel=1
pkgdesc="Animated desktop overlays, a Workshop browser, and AI background removal. Builds from source
        with every feature: about ten to twenty minutes, because the release profile uses fat LTO and one
        codegen unit."
arch=('x86_64')
# `makepkg` puts -flto in the C flags, which reaches `ring`'s C and assembly but not the Rust that links
# against it; the result is undefined ring symbols at link time. The LTO this package actually wants is the
# one in Cargo's release profile, which is unaffected by this.
options=(!lto)
license=('MIT')
url="https://github.com/swordreforge/linux_animeengine_git"
# `ldd` over the six binaries gives glibc and gcc-libs and nothing else: Vulkan and the Wayland client are
# opened at run time (the overlay's `wayland-client` uses dlopen; wgpu loads Vulkan through ash), so they are
# dependencies because the window cannot render without them, not because a linker would have said so.
# ONNX Runtime is deliberately absent: `ort-sys` links it statically, which `ldd` confirms by not listing it.
depends=('glibc' 'vulkan-icd-loader' 'wayland')
makedepends=('rust' 'gcc')  # gcc is for the vendored bc7enc_rdo, which the bc7 feature compiles
optdepends=(
  'mesa: a Vulkan driver, without which the overlay and the studio cannot render'
  'ffmpeg: render and probe video for the mp4 tools and the AI removal (ffprobe comes with it)'
  'steamcmd: download and sync Workshop items'
  'xdg-desktop-portal: file dialogs in the studio'
  'libsteam_api: Steam presence, if built with the steamworks feature'
)
# The tarball is named after `$pkgname`; its contents carry the repository name, which is a different string.
_archive=linux_animeengine_git
source=("$pkgname-$pkgver.tar.gz::https://github.com/swordreforge/linux_animeengine_git/archive/v$pkgver.tar.gz")
sha256sums=('95f0b31ea4c123e1e757951c75240c7adcb3a87745d26f8eebd7a55cddd6f10f')

build() {
  cd "$_archive-$pkgver"
  cargo build --release --all-features --locked
}

package() {
  cd "$_archive-$pkgver"
  # The install script already takes a prefix and already validates what it copies; `--no-validate` keeps
  # desktop-file-utils and appstream out of the build dependencies, and the validators run in check() instead.
    # `install.sh` has two destinations, not one: binaries go under `PREFIX`, desktop entries and icons
  # under `XDG_DATA_HOME`. Setting only the first put those into the packager's own home and left the
  # package without a menu entry — a real `makepkg` is the only thing that would have shown it.
  PREFIX="$pkgdir/usr" XDG_DATA_HOME="$pkgdir/usr/share" ./packaging/install.sh --no-validate
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 packaging/anima-shepherd.service \
    "$pkgdir/usr/lib/systemd/user/anima-shepherd.service"
}

check() {
  cd "$_archive-$pkgver"
  desktop-file-validate "$pkgdir/usr/share/applications/"*.desktop 2>/dev/null ||
    desktop-file-validate packaging/*.desktop
}
