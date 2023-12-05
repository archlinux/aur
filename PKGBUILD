# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: max.bra <max dot bra dot gtalk at gmail dot com>

pkgname=arronax
pkgver=0.8.1
pkgrel=3
pkgdesc="A GTK based GUI program to create and modify starters (*.desktop files) for applications, files, and URIs."
arch=('any')
license=('GPL3')
url="https://www.florian-diesch.de/software/arronax"
depends=('libwnck3' 'python-gobject' 'python-pyxdg')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('nemo-python: for Nemo extension'
            'python-caja: for Caja extension'
#            'python-nautilus: for Nautilus extension'
            'thunarx-python: for Thunar plugin')
source=("https://www.florian-diesch.de/software/arronax/dist/$pkgname-$pkgver.tar.gz"{,.gpg}
        'python311.patch')
sha256sums=('cb50187a3d92093665f8108430e2f2f5615f7577ceb849e00c1b98ecae0e9fe4'
            'ef87c55f996495f87dbd2e926e0e5b8dffc63de9afe9a7d14ea9a8dd73832d34'
            'b62f06af537253f0fcaedcbcc8fbdf5c866a0bda4c5cd517ea4b263d93d52d0c')
validpgpkeys=('C2FF86E4B400D21D087A35B665F2466BB57F5641')  # Florian Diesch <diesch@spamfence.net>

prepare() {
  cd "$pkgname-$pkgver"

  # 'bind_textdomain_codeset' deprecated since Python 3.8 and removed in 3.11
  patch -Np1 -i ../python311.patch

  # Fix icon location
  sed -i 's|hicolor/{s}x{s}|hicolor/{s}x{s}/apps|g' setup.py
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Not compatibile with Nautilus 43+
  rm -rf "$pkgdir/usr/share/nautilus-python/extensions/"
}

