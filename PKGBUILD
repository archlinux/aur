# Maintainer: Guy Boldon <gb@guyboldon.com>

pkgname=coolero
_app_id="org.$pkgname.Coolero"
pkgver=0.12.0
pkgrel=1
pkgdesc="A program to monitor and control your cooling devices"
arch=('any')
url="https://gitlab.com/coolero/coolero"
license=('GPL3')
depends=('hicolor-icon-theme' 'polkit' 'python' 'liquidctl' 'pyside6' 'qt6-svg' 'python-apscheduler'
         'python-matplotlib' 'python-numpy' 'python-psutil' 'python-setproctitle' 'python-jeepney'
         'python-pyamdgpuinfo')
makedepends=('python-build' 'python-installer' 'python-poetry')
checkdepends=('appstream-glib' 'desktop-file-utils')
optdepends=('nvidia-utils: NVIDIA GPU support')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://gitlab.com/coolero/coolero/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d9a1e4237433025500d10e2a2dcefdb71cf4166cf73ef69dd3d100d6fe9308c5')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  desktop-file-validate "metadata/$_app_id.desktop"
  appstream-util validate-relax "metadata/$_app_id.metainfo.xml"
  python -m coolero -v
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # systemd service files
  install -Dm644 "packaging/systemd/${pkgname}d.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "packaging/systemd/${pkgname}d.socket" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "packaging/systemd/${pkgname}.conf" -t "$pkgdir/usr/lib/sysusers.d/"

  # desktop metadata
  install -Dm644 "metadata/$_app_id.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "metadata/$_app_id.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "metadata/$_app_id.png" -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 "metadata/$_app_id.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}
