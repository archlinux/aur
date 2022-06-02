# Maintainer: Alexandre Pujol <alexandre@pujol.io>

_name='mausoleum'
pkgname="$_name-git"
pkgver=0.8.3.r31.g7ef5e30
pkgrel=1
pkgdesc='A Python GUI application, command line interface, and wrapper for Tomb'
arch=('any')
url='https://github.com/mandeep/Mausoleum'
license=('GPL3')
makedepends=('python-setuptools')
depends=(
  'tomb'
  'python-pyqt5'
  'python-pytoml'
  'python-click'
  'python-appdirs'
)
makedepends=('git')
conflicts=("$_name")
provides=("$_name" "$_name-gui")
source=("$_name::git+https://github.com/mandeep/Mausoleum.git"
        "mausoleum.desktop")
sha512sums=('SKIP'
            'fdb2db16c6e8fa3f86a51198d732e50387ea174384ed5f23d7db35f62c00137c84add144fb2e0305d1ea52ee233f8f9f779ef49778ac97f26410ae1a2a2d8ed3')
options=(!emptydirs)

pkgver() {
  cd "$_name"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

prepare() {
  # Use latest archlinux dependencies
  cd "$_name"
  sed -i -e "s/==[0-9.]*//g" setup.py
}

build() {
  cd "$_name"
  python setup.py build
}

package() {
  cd "$_name"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Care for the icon
  install -Dm644 mausoleum/images/ic_vpn_key_black_48dp_1x.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/$_name.png"

  # Compose the desktop entry
  export name="$_name" pkgver pkgdesc
  install -d "$pkgdir"/usr/share/applications
  envsubst < "$srcdir/$_name.desktop" > "$pkgdir/usr/share/applications/$_name.desktop"
}
