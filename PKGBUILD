# Maintainer: jlaunay
# Contributor: Jan Subelj <jan dot subelj010 at gmail dot com>
pkgname=g910-gkeys-git
_appname=g910-gkeys
_gitname=g910-gkey-macro-support
pkgver=0.4.0
pkgrel=2
pkgdesc='GKey support for Logitech G910 Keyboard on GNU/Linux'
url='https://github.com/JSubelj/g910-gkey-macro-support'
arch=('any')
license=('GPL3')
depends=('python-pyusb' 'python-uinput')
source=('git+https://github.com/JSubelj/g910-gkey-macro-support.git')
makedepends=('git' 'systemd' 'python-build' 'python-installer' 'python-wheel')
install=${pkgname}.install
backup=("etc/g910-gkeys/config.json" "usr/lib/systemd/user/g910-gkeys.service" "etc/udev/rules.d/60-g910-gkeys.rules" "etc/modules-load.d/uinput-g910-gkeys.conf")
md5sums=('SKIP')

build() {
    cd ${srcdir}/${_gitname}
    python -m build --wheel --no-isolation
}

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${srcdir}/${_gitname}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 -t $pkgdir/usr/lib/systemd/user etc/g910-gkeys.service
  install -Dm 644 -t $pkgdir/etc/udev/rules.d/60-g910-gkeys.rules etc/60-g910-gkeys.rules
  install -Dm 644 -t $pkgdir/etc/modules-load.d/uinput-g910-gkeys.conf etc/uinput-g910-gkeys.conf
}
