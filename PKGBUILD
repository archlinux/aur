# Maintainer: olalbns <olalbns@gmail.com>
pkgname=display-modes-git
_pkgname=display-modes
pkgver=r8.g5f149b5
pkgrel=1
pkgdesc='Quick GTK display mode switcher for Hyprland and X11'
arch=('any')
url='https://github.com/olalbns/display-modes'
license=('MIT')
depends=('python' 'python-gobject' 'gtk4')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'gettext')
optdepends=(
  'hyprland: manage displays in a Hyprland Wayland session (provides hyprctl)'
  'xorg-xrandr: manage displays in an X11 session (provides xrandr)'
)
provides=('display-modes')
conflicts=('display-modes')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  # Le catalogue .mo est généré durant la construction ; Git ne versionne pas
  # les répertoires vides, il faut donc créer sa destination explicitement.
  install -d locale/fr/LC_MESSAGES
  msgfmt po/fr.po --output-file locale/fr/LC_MESSAGES/display-modes.mo
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 locale/fr/LC_MESSAGES/display-modes.mo "${pkgdir}/usr/share/locale/fr/LC_MESSAGES/display-modes.mo"
}
