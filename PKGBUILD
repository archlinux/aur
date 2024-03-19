# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rofimoji-git
_name=${pkgname%-git}
pkgver=6.2.0.r15.g473196a
pkgrel=1
pkgdesc='Emoji, unicode and general character picker for rofi and rofi-likes'
arch=('any')
url=https://github.com/fdw/rofimoji
license=('MIT')
depends=('python-configargparse')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
optdepends=(
  'emoji-font: for the emojis character file'
  'nerd-fonts: for the nerd_font character file'
  'otf-font-awesome: for the fontawesome6 character file'
  'ttf-font-awesome: for the fontawesome6 character file'

  'bemenu: for a generic selector'

  'dmenu: for one of the X.Org selectors'
  'rofi: for one of the X.Org selectors'
  'xclip: for one of the X.Org clipboarders'
  'xsel: for one of the X.Org clipboarders'
  'xdotool: for the X.Org typer'

  'fuzzel: for one of the Wayland selectors'
  'tofi: for one of the Wayland selectors'
  'wmenu: for one of the Wayland selectors'
  'wofi: for one of the Wayland selectors'
  'wl-clipboard: for the Wayland clipboarder'
  'wtype: for the Wayland typer'
)
provides=("$_name")
conflicts=("$_name")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_name"
  # Remove include list https://github.com/pypa/wheel/issues/92
  sed -i '/^include =/,/]/d' pyproject.toml
}

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 \
    src/picker/docs/"$_name".1

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-${pkgver%%.r*}.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
