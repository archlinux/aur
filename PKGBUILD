# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Slimbook <dev at slimbook dot es>
# Contributor: tioguda <guda.flavio@gmail.com>
pkgname=slimbookbattery
pkgver=4.0.9beta
pkgrel=3
pkgdesc="Battery optimization application for portable devices."
arch=('x86_64')
url="https://github.com/Slimbook-Team/slimbookbattery"
license=('GPL-3.0-or-later')
depends=(
  'cron'
  'dmidecode'
  'gtk3'
  'libayatana-appindicator'
  'libnotify'
  'polkit'
  'python-dbus'
  'python-gobject'
  'python-packaging'
  'python-pillow'
  'tlp'
  'tlp-rdw'
  'vte3'
  'xorg-xdpyinfo'
)
optdepends=(
  'slimbookamdcontroller: Synchronize battery mode with CPU TDP mode'
  'slimbookintelcontroller: Synchronize battery mode with CPU TDP mode'
)
install="$pkgname.install"
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb"
        'pkg_resources.patch')
sha256sums=('7b585c1d0ca4f4c02750245a487067d8eeebbb52bd5315d38a87fd07e57f1b38'
            '544d8579c95af4f49e93903a3cee5a51dc61d13153e2c981ab7a1921e2973537')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar xf data.tar.xz -C "$pkgname-$pkgver/"

  cd "$pkgname-$pkgver"

  # pkg_resources deprecated in Setuptools 82+
  # https://archlinux.org/todo/python-pkg_resources-deprecation/
  patch -Np1 -i ../pkg_resources.patch
}

package() {
  cd "$pkgname-$pkgver"
  cp -a * "$pkgdir/"

  chmod -R 755 "$pkgdir"/usr/share/slimbookbattery/src/*.py

  # Symlink service
  install -d "$pkgdir/usr/lib/systemd/system"
  ln -s "/usr/share/$pkgname/src/service/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/"
}
