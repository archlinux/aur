# Maintainer: Vinicius Moreira

pkgname=fpakman
pkgver=0.5.1
pkgrel=1
pkgdesc="Free non-official GUI for Flatpak / Snap applications management."
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('eed932b89ec50cf0fedc21291961aa67b085aa1997725553e7e142496547fedf745bb4517f66f83fc5c9230b2d31a93d5341ad02f47b6519a1d015104f4f9782')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/panel_entry.py
  python3 aur/tray_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/local/bin

  mv fpakman.desktop $pkgdir/usr/share/applications/
  mv fpakman_tray.desktop $pkgdir/usr/share/applications/
  
  chmod +x fpakman-tray
  mv fpakman-tray $pkgdir/usr/local/bin/
}
