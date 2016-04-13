# Maintainer: Luca Weiss <WEI16416@spengergasse.at>

pkgname=walinuxagent
_pkgname=WALinuxAgent
pkgver=2.0.18
pkgrel=1
pkgdesc="The Microsoft Azure Linux Agent"
arch=('any')
url="https://github.com/Azure/WALinuxAgent"
license=('Apache')
depends=('python2' 'openssh')
makedepends=('python2')
checkdepends=()
optdepends=()
provides=("walinuxagent")
conflicts=("walinuxagent")
options=()
install=
changelog=
source=("https://github.com/Azure/WALinuxAgent/archive/WALinuxAgent-${pkgver}.zip")
md5sums=('927eb9ff2e2f8001a9cbb07bc1d14780')

prepare() {
  cd "$_pkgname-$_pkgname-$pkgver"
  #find . -type f -exec \
  #  sed -i 's/\/usr\/sbin/\/usr\/bin/g' {} +
  # TODO: Replace directory /usr/sbin with /usr/bin
}

package() {
  cd "$_pkgname-$_pkgname-$pkgver"
  # TODO: Use --prefix="$pkgdir/" when bug in setup.py is fixed. See https://github.com/Azure/WALinuxAgent/issues/173
  python2 setup.py install --root="$pkgdir" --prefix="/usr" --init-system=systemd --optimize=1
  mv $pkgdir/usr/sbin $pkgdir/usr/bin
  sed -i -e 's/\/usr\/sbin/\/usr\/bin/g' $pkgdir/usr/lib/systemd/system/waagent.service
  sed -i -e '0,/env python/s/env python/env python2/' $pkgdir/usr/bin/waagent
}

# vim:set ts=2 sw=2 et:

