# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rofimoji-git
pkgver=5.2.0.r0.g540ae53
pkgrel=1
pkgdesc='Character picker for rofi'
arch=('any')
url=https://github.com/fdw/rofimoji
license=('MIT')
depends=('python-configargparse')
makedepends=('git' 'python-build' 'python-install' 'python-setuptools'
             'python-wheel')
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
  # Remove data_files section https://github.com/pypa/wheel/issues/92
  sed -i '/\[options.data_files\]/,/^$/d' setup.cfg
}

build() {
  cd ${pkgname%-git}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname%-git}
  export PYTHONHASHSEED=0
  python -m install --optimize=1 --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 \
    src/picker/docs/${pkgname%-git}.1

  # https://github.com/FFY00/python-install/pull/6
  chmod +x "$pkgdir"/usr/bin/${pkgname%-git}

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s $site_packages/${pkgname%-git}-${pkgver%%.r*}.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
