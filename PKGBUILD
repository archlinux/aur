# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-tiling-assistant-git
_pkgname=Tiling-Assistant
pkgver=r316.64227e8
pkgrel=1
pkgdesc="A GNOME Shell extension to expand GNOME's native 2 column design."
arch=('x86_64')
url="https://github.com/Leleat/Tiling-Assistant"
license=('GPL2')
depends=('gnome-shell>=1:40')
install='INSTALL'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
noextract=("*tiling-assistant@leleat-on-github*")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/Tiling-Assistant"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
  # cd into repo dir
  cd "${srcdir}/Tiling-Assistant"

  # package extension to compile settings and translations
  gnome-extensions pack tiling-assistant@leleat-on-github \
    --force \
    --podir="../translations" \
    --extra-source="src"
}

package() {
  # cd into repo dir
  cd "${srcdir}/Tiling-Assistant"

  # instead of using gnome-extensions to install the extension package
  # unzip to $pkgdir/usr/share/gnome-shell/extensions/ since gnome-extensions
  # installs the extension locally while on Arch it seems like /usr/ is the
  # convention
  _UUID="tiling-assistant@leleat-on-github"
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions"
  unzip ${_UUID}.shell-extension.zip \
    -d "${pkgdir}/usr/share/gnome-shell/extensions/${_UUID}"
}
