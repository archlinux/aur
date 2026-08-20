# Maintainer: ada <cmdada@proton.me>
pkgname=findmylinux
pkgver=0.1.0
pkgrel=1
pkgdesc="Use Apple's Find My network to estimate your system GPS location, with a GTK app for configuration and status"
arch=('any')
url="https://github.com/cmdada/findmylinux"
license=('AGPL-3.0-or-later')
depends=('python' 'python-cryptography' 'python-requests' 'python-gobject'
         'gtk4' 'libadwaita' 'libshumate' 'bluez' 'bluez-utils'
         'geoclue' 'polkit' 'findmylinux-anisette')
install='findmylinux.install'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('32e7cfbc859c97437b3bf6c9862301a277041d2655fa00ffabf480ac5150c0df')

check() {
  cd "$srcdir/$pkgname-$pkgver"
  python test_encoding.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  local libdir="$pkgdir/usr/lib/findmylinux"
  install -Dm644 findmylinux.py       "$libdir/findmylinux.py"
  install -Dm644 apple.py             "$libdir/apple.py"
  install -Dm644 _srp_vendor.py       "$libdir/_srp_vendor.py"
  install -Dm644 findmylinux-gui.py   "$libdir/findmylinux-gui.py"
  install -Dm644 apple_root_ca.pem    "$libdir/apple_root_ca.pem"

  install -Dm755 packaging/bin/findmylinux     "$pkgdir/usr/bin/findmylinux"
  install -Dm755 packaging/bin/findmylinux-gui "$pkgdir/usr/bin/findmylinux-gui"

  install -Dm644 packaging/systemd/system/findmylinux.service \
    "$pkgdir/usr/lib/systemd/system/findmylinux.service"
  install -Dm644 packaging/systemd/system/findmylinux-resume.service \
    "$pkgdir/usr/lib/systemd/system/findmylinux-resume.service"
  install -Dm644 packaging/systemd/user/findmylinux-location.service \
    "$pkgdir/usr/lib/systemd/user/findmylinux-location.service"

  install -Dm644 packaging/org.adabit.FindMyLinux.desktop \
    "$pkgdir/usr/share/applications/org.adabit.FindMyLinux.desktop"
  install -Dm644 packaging/tmpfiles/findmylinux.conf \
    "$pkgdir/usr/lib/tmpfiles.d/findmylinux.conf"
}
