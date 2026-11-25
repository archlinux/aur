# Maintainer: Chris Watson (watzon)
pkgname=sayso-bin
pkgver=0.17.2
pkgrel=1
pkgdesc="Local voice dictation into any app"
arch=('x86_64' 'aarch64')
url="https://justsayso.app"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'libffi' 'alsa-lib' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'fontconfig' 'freetype2' 'wayland' 'vulkan-icd-loader' 'hicolor-icon-theme')
optdepends=('xdg-desktop-portal: global shortcuts and the paste key on Wayland'
            'libglvnd: OpenGL when Vulkan is not available'
            'xdg-utils: open links and folders')
provides=('sayso')
conflicts=('sayso')
options=('!strip' '!debug')
source_x86_64=("https://github.com/watzon/sayso/releases/download/v$pkgver/sayso-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/watzon/sayso/releases/download/v$pkgver/sayso-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('541650462c987ff0161a0a15abb0599772ee496cdb4c698222ffc057858e6a81')
sha256sums_aarch64=('0e932f7f061f39d8f2856b96324826be4049abb52055c51f007d5969635843ee')

package() {
  cd "sayso-$pkgver-linux-$CARCH"
  # The app finds the engine and the libraries that the engine loads next to
  # itself, and the cleanup runtime with its llama.cpp libraries in llama/ next
  # to itself.
  install -Dm755 bin/sayso "$pkgdir/usr/lib/sayso/sayso"
  install -Dm755 bin/sayso-engine "$pkgdir/usr/lib/sayso/sayso-engine"
  for lib in bin/*.so*; do
    if [[ -e "$lib" ]]; then install -Dm755 "$lib" "$pkgdir/usr/lib/sayso/${lib#bin/}"; fi
  done
  cp -a bin/llama "$pkgdir/usr/lib/sayso/llama"
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/sayso/sayso "$pkgdir/usr/bin/sayso"
  install -Dm644 share/applications/dev.sayso.Sayso.desktop "$pkgdir/usr/share/applications/dev.sayso.Sayso.desktop"
  install -Dm644 share/metainfo/dev.sayso.Sayso.metainfo.xml "$pkgdir/usr/share/metainfo/dev.sayso.Sayso.metainfo.xml"
  cp -r share/icons "$pkgdir/usr/share/"
  install -Dm644 lib/udev/rules.d/70-sayso-uinput.rules "$pkgdir/usr/lib/udev/rules.d/70-sayso-uinput.rules"
  # The app finds the AUR package by this folder, and then names an AUR helper
  # as the way to update (internal/update).
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" share/licenses/sayso/*.txt
}
