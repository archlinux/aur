# Maintainer: MapleProjects <eportillo898v2@gmail.com>
# Contributor: aubree.wtf <https://aubree.wtf/>
pkgname=macoblox-git
_name=MacOBlox
pkgver=r176.25595a4
pkgrel=1
pkgdesc="Run the macOS Roblox client on Linux through Darling"
arch=('x86_64')
url="https://github.com/aubree-lat/MacOBlox"
license=('MIT')
# clang and lld build the shim on first launch, against Darling's own sysroot.
depends=('darling' 'clang' 'lld' 'unzip' 'pipewire-audio' 'python' 'python-gobject' 'gtk4' 'libadwaita' 'webkitgtk-6.0')
makedepends=('git')
provides=('macoblox')
conflicts=('macoblox')
source=("git+$url.git"
        "shift_lock_reticle.patch")
sha256sums=('SKIP'
            'ab7472b393df8f5d99656d41c17a209e1dd0d737c31b0ba3f840902e5bf3cf30')

prepare() {
  cd "$_name"
  patch -Np1 -i "$srcdir/shift_lock_reticle.patch"
}

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_name"
  local share="$pkgdir/usr/share/macoblox"
  install -d "$share"
  cp -r --no-preserve=ownership launcher branding frameworks build_debug_shim.sh ./*.c ./*.m "$share/"
  rm -f "$share/launcher/install.sh"
  python -m compileall -q -d /usr/share/macoblox/launcher "$share/launcher"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/share/macoblox/launcher/macoblox-launcher "$pkgdir/usr/bin/macoblox"

  for size in 16 22 24 32 48 64 128 256 512; do
    install -Dm644 "branding/icons/macoblox-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/macoblox.png"
  done
  install -Dm644 packaging/wtf.aubree.MacOBlox.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/wtf.aubree.MacOBlox.URI.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/macoblox-roblox-window.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/wtf.aubree.MacOBlox.Studio.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/wtf.aubree.MacOBlox.xml -t "$pkgdir/usr/share/mime/packages"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
