# Maintainer: Robin Lange <robin dot langenc at gmail dot com>
# Contributor: Robin Lange <robin dot langenc at gmail dot com>
pkgname=optimus-manager-git
pkgver=r275.56fd2d8
pkgrel=2
pkgdesc="Management utility to handle GPU switching for Optimus laptops (Git version)"
arch=('any')
url="https://github.com/Askannz/optimus-manager"
license=('MIT')
conflicts=("optimus-manager")
provides=("optimus-manager")
depends=('python' 'python-pyqt5' 'python-setuptools' 'mesa-demos' 'xorg-xrandr')
optdepends=('bbswitch: alternative power switching method')
makedepends=('python-setuptools' 'git')
backup=('etc/optimus-manager/xorg-intel.conf'
        'etc/optimus-manager/xorg-nvidia.conf'
        'etc/optimus-manager/xsetup-intel.sh'
        'etc/optimus-manager/xsetup-nvidia.sh')
source=("git+https://github.com/Askannz/optimus-manager.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/optimus-manager/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
 
build() {
 
  cd "${srcdir}/optimus-manager/"
  python setup.py build
 
}
 
 
package() {
 
  cd "${srcdir}/optimus-manager/"
 
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 modules/optimus-manager.conf "$pkgdir/usr/lib/modprobe.d/optimus-manager.conf"
  install -Dm755 xorg/optimus-manager_Xsetup "$pkgdir/usr/bin/optimus-manager_Xsetup"
  install -Dm644 systemd/optimus-manager.service "$pkgdir/usr/lib/systemd/system/optimus-manager.service"
  install -Dm644 systemd/99-optimus-manager.conf "$pkgdir/usr/lib/systemd/system/display-manager.service.d/99-optimus-manager.conf"
  install -Dm644 optimus-manager.conf "$pkgdir/usr/share/optimus-manager.conf"
  
  install -Dm644 config/xorg-intel.conf "$pkgdir/etc/optimus-manager/xorg-intel.conf"
  install -Dm644 config/xorg-nvidia.conf "$pkgdir/etc/optimus-manager/xorg-nvidia.conf"
  
  install -Dm644 desktop/optimus-manager-systray.desktop "$pkgdir/usr/share/applications/optimus-manager-systray.desktop"
  
  mkdir -p "$pkgdir/var/lib/optimus-manager/"
 
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
 
} 
