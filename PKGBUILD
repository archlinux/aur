# Maintainer: t1meshift <kurlykster@mail.ru>
# Contributor: Robin Lange <robin dot langenc at gmail dot com>
pkgname=optimus-manager-amd-git
pkgver=1.2.2.r3.gdae468b
pkgrel=1
pkgdesc="Management utility to handle GPU switching for Optimus laptops (Git version w/ AMD)"
arch=('any')
url="https://github.com/Askannz/optimus-manager"
license=('MIT')
conflicts=("optimus-manager" "optimus-manager-git")
provides=("optimus-manager=$pkgver")
depends=('python3' 'python-setuptools' 'python-dbus' 'mesa-demos' 'xorg-xrandr')
optdepends=('bbswitch: alternative power switching method'
            'xf86-video-amdgpu: provides the Xorg AMD driver')
makedepends=('python-setuptools' 'git')
backup=('etc/optimus-manager/xorg-intel.conf'
        'etc/optimus-manager/xorg-nvidia.conf'
        'etc/optimus-manager/xorg-amd.conf'
        'etc/optimus-manager/xsetup-intel.sh'
        'etc/optimus-manager/xsetup-nvidia.sh'
        'etc/optimus-manager/xsetup-amd.sh'
        'var/lib/optimus-manager/startup_mode'
        'var/lib/optimus-manager/requested_mode')
source=("git+https://github.com/Kr1ss-XD/optimus-manager.git#branch=amdigpu-compat")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/optimus-manager/"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
 
build() {
 
  cd "${srcdir}/optimus-manager/"
  python3 setup.py build
 
}
 
 
package() {

  install="optimus-manager.install"
 
  cd "${srcdir}/optimus-manager/"
 
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 modules/optimus-manager.conf "$pkgdir/usr/lib/modprobe.d/optimus-manager.conf"
  install -Dm644 systemd/optimus-manager.service "$pkgdir/usr/lib/systemd/system/optimus-manager.service"
  install -Dm644 optimus-manager.conf "$pkgdir/usr/share/optimus-manager.conf"
  
  install -Dm644 systemd/logind/10-optimus-manager.conf "$pkgdir/usr/lib/systemd/logind.conf.d/10-optimus-manager.conf"
  
  install -Dm644 var/startup_mode "$pkgdir/var/lib/optimus-manager/startup_mode"
  install -Dm644 var/requested_mode "$pkgdir/var/lib/optimus-manager/requested_mode"
  
  install -Dm755 scripts/prime-switch-boot "$pkgdir/usr/bin/prime-switch-boot"
  install -Dm755 scripts/prime-switch "$pkgdir/usr/bin/prime-switch"
  install -Dm755 scripts/prime-offload "$pkgdir/usr/bin/prime-offload"
  
  install -Dm644 login_managers/sddm/20-optimus-manager.conf "$pkgdir/etc/sddm.conf.d/20-optimus-manager.conf"
  install -Dm644 login_managers/lightdm/20-optimus-manager.conf  "$pkgdir/etc/lightdm/lightdm.conf.d/20-optimus-manager.conf"
  
  install -Dm644 config/xorg-amd.conf "$pkgdir/etc/optimus-manager/xorg-amd.conf"
  install -Dm644 config/xorg-intel.conf "$pkgdir/etc/optimus-manager/xorg-intel.conf"
  install -Dm644 config/xorg-nvidia.conf "$pkgdir/etc/optimus-manager/xorg-nvidia.conf"
  
  install -Dm755 config/xsetup-amd.sh "$pkgdir/etc/optimus-manager/xsetup-amd.sh"
  install -Dm755 config/xsetup-intel.sh "$pkgdir/etc/optimus-manager/xsetup-intel.sh"
  install -Dm755 config/xsetup-nvidia.sh "$pkgdir/etc/optimus-manager/xsetup-nvidia.sh"
 
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
 
} 
