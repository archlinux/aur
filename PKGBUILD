# Maintainer: Roc <roc dot gui at outlook dot com>
# Maintainer: Francois Menning <f.menning@pm.me>

_gitname=ChromeOS-kde
pkgname=plasma5-themes-chromeos-git
pkgver=r76.383b4a5
pkgrel=1
pkgdesc="ChromeOS theme for the KDE Plasma desktop."
arch=('any')
url="https://github.com/vinceliuice/${_gitname}"
license=('GPL3')
depends=('plasma-desktop')
optdepends=('kvantum: for included kvantum theme' 'chromeos-gtk-theme-git: matching gtk theme' 'tela-icon-theme-git: matching icon theme' 'sddm: for included sddm theme')
makedepends=('git')
source=(
  "${_gitname}::git+${url}.git"
  'fix-theme-installer-path.patch'
)
sha256sums=('SKIP' '3c5ec095be345bc5e560c0f594e1afdef9b2ffef9e3de90c52673382ec85f729')
replaces=('chromeos-kde-theme-git')
conflicts=('chromeos-kde-theme-git')

pkgver() {
  cd ${_gitname}
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare () {
  export SRCDIR="$srcdir/$_gitname"
  export PKGDIR="$pkgdir"

  cd "$SRCDIR"
  patch -Np1 -i "$srcdir"/fix-theme-installer-path.patch
}

package() {
  export SRCDIR="$srcdir/$_gitname"
  export PKGDIR="$pkgdir"

  cd "$SRCDIR"
  bash install.sh

  # sddm
  sddmdir="${pkgdir}/usr/share/sddm/themes"

  install -dm755 "${sddmdir}"
  cp -r sddm/ChromeOS "${sddmdir}"
}
