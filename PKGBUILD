# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rofimoji-git
pkgver=5.1.0.r8.g7641ab2
pkgrel=1
pkgdesc='Character picker for rofi'
arch=('any')
url=https://github.com/fdw/rofimoji
license=('MIT')
depends=('python-configargparse')
makedepends=('git' 'python-pip' 'python-wheel')
optdepends=('emoji-font: for the emojis character file'
            'nerd-fonts: for the nerd_font character file'
            'rofi: for the X.Org selector'
            'xclip: for one of the X.Org clipboarders'
            'xsel: for one of the X.Org clipboarders'
            'xdotool: for the X.Org typer'
            'wofi: for the Wayland selector'
            'wl-clipboard: for the Wayland clipboarder'
            'wtype: for the Wayland typer')
provides=('rofimoji')
conflicts=('rofimoji')
install=$pkgname.install
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd rofimoji
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd rofimoji
  # Avoid installing files directly under site-packages/
  sed -i '/\[options.data_files\]/,/^$/d' setup.cfg
}

build() {
  cd rofimoji
  export PIP_CONFIG_FILE=/dev/null
  pip wheel --isolated --no-deps .
}

package() {
  cd rofimoji
  export PYTHONHASHSEED=0
  export PIP_CONFIG_FILE=/dev/null
  pip install --isolated \
              --no-deps \
              --root="$pkgdir" \
              --ignore-installed \
              --no-warn-script-location *.whl
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 src/picker/docs/rofimoji.1

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s $site_packages/rofimoji-${pkgver%%.r*}.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
