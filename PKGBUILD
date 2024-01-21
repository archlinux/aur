# Maintainer: Mizuki Nguyen <temppart01 at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jack Random <jack ät random.to>
# Contributor: Michael J. Pento <mjpento@verizon.net>
# Contributor: grimi <grimi at poczta dot fm>
_pkgname=matcha-gtk-theme
pkgname=matcha-gtk-theme-maximize
_pkgver=2023-10-30
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A flat design theme for GTK 3, GTK 2 and GNOME Shell. Replaces the restore button with the maximize button."
arch=('any')
url="https://vinceliuice.github.io/theme-matcha.html"
license=('GPL3')
makedepends=('setconf')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'gtk-engines: GTK2 theme support'
            'qogir-icon-theme: Recommended icon theme')
conflicts=('matcha-gtk-theme' 'matcha-gtk-theme-git')
options=('!strip')
install="$_pkgname.install"
source=("$_pkgname-${_pkgver}.tar.gz::https://github.com/vinceliuice/Matcha-gtk-theme/archive/${_pkgver}.tar.gz"
        "mate-button-fix.patch::https://github.com/vinceliuice/Matcha-gtk-theme/commit/819ccff3e9cd85de5216b5001f353d4f97112818.patch")
sha256sums=('9e7c1b7055bd996eaa01e8cd30e098dc1873f98690d2ace6ecad0e945307d470'
            '79460f0e51d2949577e56f08537d2ac6b5cdd3708f23f52ca30c619662a860c1')

prepare() {
  cd "Matcha-gtk-theme-${_pkgver}"
  # Set GTKSV_DIR to $pkgdir
  setconf install.sh GTKSV_DIR "$pkgdir/usr/share/gtksourceview-3.0/styles"
  # Patch a bug when using MATE.
  patch -Np1 -i "${srcdir}/mate-button-fix.patch"
  # Replaces restore button with maximize button.
  cd src/metacity-1
  command cp -f max-icon.svg unmax-icon.svg
  cd ../gtk
  for i in assets-*/; do
    cd $i
    rm titlebutton-restore*.png
    for image in titlebutton-maximize*.png; do cp "$image" "${image/maximize/restore}"; done
    cd ..
  done
  cd ../xfwm4
  for i in assets-*/; do
    cd $i
    rm maximize-toggled*.png
    for image in maximize*.png; do cp "$image" "${image/maximize/maximize-toggled}"; done
    cd ..
  done
}

package() {
  cd "Matcha-gtk-theme-${_pkgver}"
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -d "$pkgdir/usr/share/themes/"
}
