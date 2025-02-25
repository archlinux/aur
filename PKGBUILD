# Maintainer:  Calvin Lee <calvins.lee@utah.edu>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maximilian Kindshofer <maximilian@kindshofer.net>

pkgname=(kitty-bitmap)
pkgver=0.39.1
pkgrel=1
pkgdesc="A modern, hackable, featureful, OpenGL-based terminal emulator. Patched to support bitmap fonts."
arch=('x86_64')
url="https://github.com/kovidgoyal/kitty"
license=('GPL-3.0-only')
depends=('python3' 'fontconfig' 'freetype2' 'harfbuzz' 'wayland' 'libx11' 'libxkbcommon' 'libxkbcommon-x11' 'hicolor-icon-theme' 'dbus' 'kitty-terminfo' 'xxhash' 'libxcursor' 'lcms2' 'libgl' 'zlib' 'openssl' 'libxi' 'libpng' 'librsync')
makedepends=('libxinerama' 'libxrandr' 'wayland-protocols' 'simde' 'ttf-nerd-fonts-symbols-mono' 'go')
optdepends=('imagemagick: viewing images with icat' 'libcanberra: playing "bell" sound on terminal bell' 'python-pygments: syntax highlighting in kitty +kitten diff')
provides=('kitty')
conflicts=('kitty')
source=("${pkgname/-bitmap}-${pkgver}.tar.gz::https://github.com/kovidgoyal/${pkgname/-bitmap/}/archive/v$pkgver.tar.gz" "Allow-bitmap-fonts.patch")
sha512sums=('215c442275900d71ca4734cd5093ec58995cea53101bd16615b98e9d3d0a1cbc6b876092752390637d4d8ef52c6cfbe39e6d82aa041e302898c346087ea3496e'
            'f334d7f9a2d05bf8c3ae33ca1e523cb0125386fa587ace4a4720757600b8a596fc13235f94a3e8d450dc3c9031c47b52f6b633a966df4ead6c2c4c058be5070a')

prepare() {
  cd "$srcdir/${pkgname/-bitmap}-$pkgver"
  patch --strip=1 --input="${srcdir}/Allow-bitmap-fonts.patch"
}

build() {
  cd "$srcdir/${pkgname/-bitmap}-$pkgver"
  python3 setup.py linux-package --update-check-interval=0
}

package() {

  cd "$srcdir/${pkgname/-bitmap}-$pkgver"

  cp -r linux-package "${pkgdir}"/usr

  # completions
  python __main__.py + complete setup bash | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/kitty
  python __main__.py + complete setup fish | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/kitty.fish
  # doesn't know how to http://zsh.sourceforge.net/Doc/Release/Completion-System.html#Autoloaded-files
  # so we write our own header
  {
      echo "#compdef kitty"
      python __main__.py + complete setup zsh
  } | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_kitty

  install -Dm644 "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/kitty.png "${pkgdir}"/usr/share/pixmaps/kitty.png

  rm -r "$pkgdir"/usr/share/terminfo

  install -Dm644 docs/generated/conf/kitty.conf "${pkgdir}"/usr/share/doc/${pkgname}/kitty.conf
}
