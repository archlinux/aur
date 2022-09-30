# Maintainer: Chinmay Dalal <00foahcd7@mozmail.com>

pkgname=rofimoji-fuzzel-git
pkgver=5.6.0.r0.gfd95a65
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
            'wl-clipboard: for the Wayland clipboarder'
            'wtype: for the Wayland typer')
provides=("${pkgname%-fuzzel-git}")
conflicts=("${pkgname%-fuzzel-git}")
install=$pkgname.install
source=("git+$url.git" "fuzzel.patch")
b2sums=('SKIP' 'SKIP')

pkgver() {
  cd ${pkgname%-fuzzel-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname%-fuzzel-git}
  # Remove data_files section https://github.com/pypa/wheel/issues/92
  sed -i '/\[options.data_files\]/,/^$/d' setup.cfg
  patch -p1 -i "$srcdir/fuzzel.patch"
  for file in $(find src -type f)
  do
    sed -i 's/<small>//g' $file
    sed -i 's/<\/small>//g' $file
  done
}

build() {
  cd ${pkgname%-fuzzel-git}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname%-fuzzel-git}
  export PYTHONHASHSEED=0
  python -m install --optimize=1 --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 \
    src/picker/docs/${pkgname%-fuzzel-git}.1

  # https://github.com/FFY00/python-install/pull/6
  chmod +x "$pkgdir"/usr/bin/*

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s $site_packages/${pkgname%-fuzzel-git}-${pkgver%%.r*}.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
