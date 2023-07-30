# Maintainer: Mahid Sheikh <mahidsheikh@proton.me>
#
# shellcheck disable=all
pkgname=phanpy-tauri
pkgver=0.1.2
pkgrel=1
pkgdesc="The Phanpy Mastodon web client, now as a Tauri app!"
arch=(x86_64)
url="https://github.com/StandingPadAnimations/phanpy-tauri/tree/production"
license=('MIT')
depends=(webkit2gtk gtk3)
source=('https://github.com/StandingPadAnimations/phanpy-tauri/releases/download/v0.1.2/phanpy-tauri-0.1.2.tar.gz'
        'multiimage-fix.patch')
sha256sums=('b023668879be3e9053686bf5161b269907ecf33e2644d2b6712b93a305a3910f'
            'a483c50fa26d462f6797e3058182dafeda8ded92c4cf35c6b1bec6e2c9165211')
package() {
  cd "$srcdir"
  bsdtar -xf phanpy-tauri.tar.gz -C "$pkgdir"

  # Fix bug related to viewing multiple images.
  #
  # https://github.com/cheeaun/phanpy/issues/181
  #
  # WebKit has an issue where hardware acclerated compositing 
  # ends up causing the UI to take a while to load when 
  # clicking and viewing an image, but only on posts with
  # multiple images. This is related to how WebKit changes 
  # OpenGL viewport size when resizing the image, or so I 
  # think. Frankly this is a weird issue. 
  #
  # I've also tried using Zink to see if that fixes anything, but
  # Nothing loaded when using Zink so I just left it alone.
  #
  # This unfortunately comes with the downside of Phanpy being 
  # much, much slower, but I can't do anything about it.
  patch --directory="$pkgdir" --forward --strip=1 --input="${srcdir}/multiimage-fix.patch"
}
