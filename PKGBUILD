# Maintainer: Alexandre Pujol <alexandre@pujol.io>

_name='mausoleum'
pkgname="$_name"
pkgver=0.9.0
pkgrel=4
pkgdesc='A Python GUI application, command line interface, and wrapper for Tomb'
arch=('any')
url='https://github.com/mandeep/Mausoleum'
license=('GPL3')
depends=(
  'tomb'
  'python-pyqt5'
  'python-pytoml'
  'python-click'
  'python-appdirs'
)
makedepends=('python-setuptools')
conflicts=("$_name-git")
provides=("$_name" "$_name-gui")
source=("$pkgname-$pkgver.tar.gz::https://github.com/mandeep/Mausoleum/archive/v$pkgver.tar.gz"
        "mausoleum.desktop")
sha512sums=('e997aeccf4e606e822bcf813fa974aa2b09c6f4e78a5d15a801bde3fe640a454cb14f9a22633750fe42913ea98481ef106d86dd9ed4660b90de3cc5bf14566f1'
            'fdb2db16c6e8fa3f86a51198d732e50387ea174384ed5f23d7db35f62c00137c84add144fb2e0305d1ea52ee233f8f9f779ef49778ac97f26410ae1a2a2d8ed3')

prepare() {
  # Use latest archlinux dependencies
  cd "Mausoleum-$pkgver"
  sed -i -e "s/==[0-9.]*//g" setup.py
}

build() {
  cd "Mausoleum-$pkgver"
  python setup.py build
}

package() {
  cd "Mausoleum-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Care for the icon
  install -Dm644 mausoleum/images/ic_vpn_key_black_48dp_1x.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/$_name.png"

  # Compose the desktop entry
  export name="$_name" pkgver pkgdesc
  install -d "$pkgdir"/usr/share/applications
  envsubst < "$srcdir/$_name.desktop" > "$pkgdir/usr/share/applications/$_name.desktop"
}
