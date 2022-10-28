# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rofimoji-git
pkgver=6.0.0.rc1.r3.gd48f152
pkgrel=1
pkgdesc='Character picker for rofi'
arch=('any')
url=https://github.com/fdw/rofimoji
license=('MIT')
depends=('python-configargparse')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
optdepends=('emoji-font: for the emojis character file'
            'nerd-fonts: for the nerd_font character file'
            'rofi: for the X.Org selector'
            'xclip: for one of the X.Org clipboarders'
            'xsel: for one of the X.Org clipboarders'
            'xdotool: for the X.Org typer'
            'wofi: for the Wayland selector'
            'wl-clipboard: for the Wayland clipboarder'
            'wtype: for the Wayland typer')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=$pkgname.install
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname%-git}
  # Remove include list https://github.com/pypa/wheel/issues/92
  sed -i '/^include =/,/]/d' pyproject.toml
}

build() {
  cd ${pkgname%-git}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname%-git}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 \
    src/picker/docs/${pkgname%-git}.1

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/${pkgname%-git}-6.0.0rc1.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
