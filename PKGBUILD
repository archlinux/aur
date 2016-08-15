# Maintainer: Luca Weiss <WEI16416@spengergasse.at>

pkgname=walinuxagent
_pkgname=WALinuxAgent
pkgver=2.1.6
pkgrel=1
pkgdesc="Microsoft Azure Linux Guest Agent"
arch=('any')
url="https://github.com/Azure/WALinuxAgent"
license=('Apache')
depends=('python' 'openssh' 'parted' 'net-tools')
makedepends=('python' 'python-setuptools')
checkdepends=()
optdepends=()
provides=("walinuxagent")
conflicts=("walinuxagent")
options=()
install=
changelog=
source=(
  "https://github.com/Azure/WALinuxAgent/archive/v${pkgver}.zip"
  "setup_default_systemd.patch")
sha256sums=(
  'cb70ab8f55fc82c89f33b2c88e691c0b8809b187fdaa6c481ec7ae357f32c3a9'
  'e7cb463690dd312a9e63a4efe1e869e1d3c04b59ea71001198cbcfd5c1cba351')

prepare() {
  #cd "$_pkgname-$pkgver"
  #find . -type f -exec \
  #  sed -i 's/\/usr\/sbin/\/usr\/bin/g' {} +
  # TODO: Replace directory /usr/sbin with /usr/bin
  patch -p1 < setup_default_systemd.patch
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --prefix="/usr" --init-system=systemd --optimize=1
  mv $pkgdir/usr/sbin $pkgdir/usr/bin
  sed -i -e 's/\/usr\/sbin/\/usr\/bin/g' $pkgdir/usr/lib/systemd/system/waagent.service
  #sed -i -e '0,/env python/s/env python/env python2/' $pkgdir/usr/bin/waagent
}

# vim:set ts=2 sw=2 et:
