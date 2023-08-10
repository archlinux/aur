# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonup-qt
_app_id=net.davidotek.pupgui2
pkgver=2.8.2
pkgrel=1
pkgdesc="Install and manage Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris"
arch=('any')
url="https://davidotek.github.io/protonup-qt"
license=('GPL3')
depends=('pyside6' 'python-inputs' 'python-psutil' 'python-requests'
         'python-steam' 'python-vdf' 'python-pyxdg' 'python-pyaml'
         'python-zstandard' 'qt6-tools')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('appstream-glib' 'desktop-file-utils')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DavidoTek/ProtonUp-Qt/archive/refs/tags/v$pkgver.tar.gz"
        "$_app_id.sh")
sha256sums=('1bb0e18cc6825a9f84e4447f8985fd91b099f9ed88cf6be301dd813580cc866d'
            '732fd88026a801d64ffb85c98c1bc53536100524cced87ab86a112d83de07c1f')

build() {
  cd "ProtonUp-Qt-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "ProtonUp-Qt-$pkgver"
  appstream-util validate-relax --nonet "share/metainfo/$_app_id.appdata.xml"
  desktop-file-validate "share/applications/$_app_id.desktop"
}

package() {
  cd "ProtonUp-Qt-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  cp -r share "$pkgdir/usr/"

  install -Dm755 "$srcdir/$_app_id.sh" "$pkgdir/usr/bin/$_app_id"
  ln -s /usr/bin/$_app_id "$pkgdir/usr/bin/$pkgname"
}
