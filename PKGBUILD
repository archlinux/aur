# Maintainer: Chris Watson (watzon)
pkgname=sayso-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Local voice dictation into any app"
arch=('x86_64' 'aarch64')
url="https://justsayso.app"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'fontconfig' 'freetype2' 'wayland' 'vulkan-icd-loader' 'hicolor-icon-theme')
optdepends=('xdg-desktop-portal: global shortcuts and the paste key on Wayland'
            'libglvnd: OpenGL when Vulkan is not available'
            'xdg-utils: open links and folders')
provides=('sayso')
conflicts=('sayso')
options=('!strip' '!debug')
source_x86_64=("https://github.com/watzon/sayso/releases/download/v$pkgver/sayso-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/watzon/sayso/releases/download/v$pkgver/sayso-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('e54694f43973a170b205d381f8b428ef2a2771c91312837291651626e63ccc2c')
sha256sums_aarch64=('da65951649a8c9f7627b6335183bc02e439764621833040d28e203ce3462db68')

package() {
  cd "sayso-$pkgver-linux-$CARCH"
  # The app finds the engine and the cleanup runtime next to itself, so the
  # binaries live in one folder.
  install -Dm755 bin/sayso "$pkgdir/usr/lib/sayso/sayso"
  install -Dm755 bin/sayso-engine "$pkgdir/usr/lib/sayso/sayso-engine"
  # On x86_64 the cleanup runtime has one build for each instruction set.
  install -Dm755 -t "$pkgdir/usr/lib/sayso" bin/sayso-cleanup*
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/sayso/sayso "$pkgdir/usr/bin/sayso"
  install -Dm644 share/applications/dev.sayso.Sayso.desktop "$pkgdir/usr/share/applications/dev.sayso.Sayso.desktop"
  install -Dm644 share/metainfo/dev.sayso.Sayso.metainfo.xml "$pkgdir/usr/share/metainfo/dev.sayso.Sayso.metainfo.xml"
  cp -r share/icons "$pkgdir/usr/share/"
  install -Dm644 lib/udev/rules.d/70-sayso-uinput.rules "$pkgdir/usr/lib/udev/rules.d/70-sayso-uinput.rules"
  # The app finds the AUR package by this folder, and then names an AUR helper
  # as the way to update (crates/sayso-update/src/install/package.rs).
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" share/licenses/sayso/*.txt
}
