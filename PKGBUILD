# Maintainer: Alexandre Pujol <alexandre@pujol.io>

_name='mausoleum'
pkgname="$_name"
pkgver=0.15.0
pkgrel=1
pkgdesc='A Python GUI application, command line interface, and wrapper for Tomb'
arch=('any')
url='https://github.com/mandeep/Mausoleum'
license=('GPL-3.0-or-later')
depends=(
  'tomb'
  'python-pyqt5'
  'python-pytoml'
  'python-click'
  'python-appdirs'
)
makedepends=('git' 'python-setuptools')
conflicts=("$_name-git")
provides=("$_name" "$_name-gui")
source=("git+https://github.com/mandeep/Mausoleum#tag=v$pkgver"
        "mausoleum.desktop")
sha512sums=('a8244ba1d5cc2ef96c3a6d9833e2429f86ed089831b8ea4b6cee90c51f6eba269a0685726a1e2f17639070c6d1972cc5af6f4dd70f5cef5fb7d802d78e302b63'
            'fdb2db16c6e8fa3f86a51198d732e50387ea174384ed5f23d7db35f62c00137c84add144fb2e0305d1ea52ee233f8f9f779ef49778ac97f26410ae1a2a2d8ed3')

prepare() {
  # Use latest archlinux dependencies
  cd "Mausoleum"
  sed -i -e "s/==[0-9.]*//g" setup.py
}

build() {
  cd "Mausoleum"
  python setup.py build
}

package() {
  cd "Mausoleum"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Care for the icon
  install -Dm644 mausoleum/images/ic_vpn_key_black_48dp_1x.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/$_name.png"

  # Compose the desktop entry
  export name="$_name" pkgver pkgdesc
  install -d "$pkgdir"/usr/share/applications
  envsubst < "$srcdir/$_name.desktop" > "$pkgdir/usr/share/applications/$_name.desktop"
}
