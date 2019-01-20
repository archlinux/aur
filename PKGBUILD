# Maintainer: Barry Smith <irunarch at gmx dot com>
# Contributor: Robin Lange <robin dot langenc at gmail dot com>
_pkgname=optimus-manager
pkgname=$_pkgname-git
pkgver=r239.0833353
pkgrel=1
pkgdesc="Management utility to handle GPU switching for Optimus laptops."
arch=('any')
url="https://github.com/Askannz/optimus-manager"
license=('MIT')
conflicts=("$_pkgname")
provides=("$_pkgname")
depends=('python' 'python-setuptools' 'nvidia' 'mesa-demos' 'bbswitch' 'xorg-xrandr')
makedepends=('git' 'python-setuptools')
backup=('etc/optimus-manager/xorg-intel.conf'
        'etc/optimus-manager/xorg-nvidia.conf')
source=("git+https://github.com/Askannz/$_pkgname.git")
sha256sums=('SKIP')
 
pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/$_pkgname/"
  python setup.py build
}
 
package() {
  cd "${srcdir}/$_pkgname/"
 
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 modules/optimus-manager.conf "$pkgdir/etc/modprobe.d/optimus-manager.conf"
  install -Dm755 xorg/optimus-manager_Xsetup "$pkgdir/usr/bin/optimus-manager_Xsetup"
  install -Dm644 systemd/optimus-manager.service "$pkgdir/usr/lib/systemd/system/optimus-manager.service"
  install -Dm644 systemd/99-optimus-manager.conf "$pkgdir/usr/lib/systemd/system/display-manager.service.d/99-optimus-manager.conf"
  install -Dm644 optimus-manager.conf "$pkgdir/usr/share/optimus-manager.conf"
  
  install -Dm644 config/xorg-intel.conf "$pkgdir/etc/optimus-manager/xorg-intel.conf"
  install -Dm644 config/xorg-nvidia.conf "$pkgdir/etc/optimus-manager/xorg-nvidia.conf"
  
  mkdir -p "$pkgdir/var/lib/optimus-manager/"
 
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
} 
