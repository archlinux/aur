# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jack Random <jack ät random.to>
# Contributor: Michael J. Pento <mjpento@verizon.net>
# Contributor: grimi <grimi at poczta dot fm>
pkgname=matcha-gtk-theme
_pkgver=2025-04-11
pkgver=${_pkgver//-/.}
pkgrel=3
_gs_ver=48  ## theme currently supports gnome-shell 48
pkgdesc="A flat design theme for GTK 3, GTK 2 and GNOME Shell"
arch=('any')
url="https://vinceliuice.github.io/theme-matcha.html"
license=('GPL-3.0-only')
makedepends=(
  'git'
  'setconf'
)
optdepends=(
  'gtk-engine-murrine: GTK2 theme support'
  'gtk-engines: GTK2 theme support'
  'qogir-icon-theme: Recommended icon theme'
)
options=('!strip')
install="$pkgname.install"
source=("git+https://github.com/vinceliuice/Matcha-gtk-theme.git#tag=${_pkgver}")
sha256sums=('882365e30769045ead524e114139da6478a7c647902af325377d071e8f61572e')

prepare() {
  cd Matcha-gtk-theme

  # https://github.com/vinceliuice/Matcha-gtk-theme/issues/238
  git cherry-pick -n 1e33c6e48764d70dfa05db5711ce5b816dc6b80d

  # Fix Dash to Dock issues
  git cherry-pick -n 878f344e93d1fdc2c3e3bfff956c4d64edf9d8ca

  # Set GTKSV_DIR to $pkgdir
  setconf install.sh GTKSV_DIR "$pkgdir/usr/share/gtksourceview-3.0/styles"

  # Set gnome-shell version
  sed -i "s/SHELL_VERSION=\"\"/SHELL_VERSION=\"${_gs_ver}\"/g" install.sh
}

package() {
  cd Matcha-gtk-theme
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -d "$pkgdir/usr/share/themes/"
}
