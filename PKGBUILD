# Maintainer: Guy Boldon <gb@guyboldon.com>

pkgname=coolero
pkgname_new=coolercontrol
_app_id="org.$pkgname.Coolero"
pkgver=0.13.3
pkgrel=2
pkgdesc="A program to monitor and control your cooling devices"
arch=('any')
url="https://gitlab.com/coolercontrol/coolercontrol"
license=('GPL3')
depends=('hicolor-icon-theme' 'polkit' 'python' 'liquidctl' 'pyside6' 'qt6-svg' 'python-apscheduler'
         'python-matplotlib' 'python-numpy' 'python-psutil' 'python-setproctitle' 'python-jeepney'
         'python-pyamdgpuinfo')
makedepends=('python-build' 'python-installer' 'python-poetry')
checkdepends=('appstream-glib' 'desktop-file-utils')
optdepends=('nvidia-utils: NVIDIA GPU support')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://gitlab.com/coolercontrol/coolercontrol/-/archive/$pkgver/$pkgname_new-$pkgver.tar.gz")
sha256sums=('35029007ea6032784e7a6ea781db707b552743950107a18e36a677df057ed43d')

build() {
  cd "$pkgname_new-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname_new-$pkgver"
  desktop-file-validate "metadata/$_app_id.desktop"
  appstream-util validate-relax "metadata/$_app_id.metainfo.xml"
  python -m coolero -v
}

package() {
  cd "$pkgname_new-$pkgver"
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
