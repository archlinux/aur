# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: max.bra <max dot bra dot gtalk at gmail dot com>
pkgname=arronax
pkgver=0.8.1
pkgrel=7
pkgdesc="Create and modify application, file and URI starters."
arch=('any')
license=('GPL-3.0-or-later')
url="https://www.florian-diesch.de/software/arronax"
depends=(
  'gtk3'
  'libwnck3'
  'python-gobject'
  'python-pyxdg'
)
makedepends=(
  'git'
  'intltool'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'nemo-python: for Nemo extension'
  'python-caja: for Caja extension'
#  'python-nautilus: for Nautilus extension'
  'thunarx-python: for Thunar plugin'
)
#source=("https://www.florian-diesch.de/software/arronax/dist/$pkgname-$pkgver.tar.gz"{,.gpg}
_commit=acb6aaf4826cd8f3d92bdbec8116e317fe954a98  # 0.8.1
source=("git+https://codeberg.org/diesch/arronax.git#commit=${_commit}"
        'python311.patch')
sha256sums=('03f5252ef7e5e80dee1c467ca5cd9126cb4cef559b10e68aef41fe1c7226958e'
            'b62f06af537253f0fcaedcbcc8fbdf5c866a0bda4c5cd517ea4b263d93d52d0c')
#validpgpkeys=('C2FF86E4B400D21D087A35B665F2466BB57F5641')  # Florian Diesch <diesch@spamfence.net>

prepare() {
  cd "$pkgname"
  git clean -dfx

  # 'bind_textdomain_codeset' deprecated since Python 3.8 and removed in 3.11
  # https://codeberg.org/diesch/arronax/issues/1
  patch -Np1 -i ../python311.patch

  # Fix icon location
  sed -i 's|hicolor/{s}x{s}|hicolor/{s}x{s}/apps|g' setup.py
}

build() {
  cd "$pkgname"
  ./scripts/create-mo-files.sh
  ./scripts/translate-desktop-files.sh

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Not compatibile with Nautilus 43+
  rm -rf "$pkgdir/usr/share/nautilus-python/"
}
