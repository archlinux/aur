# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=(backintime backintime-cli)
_pkgname="backintime"
pkgver=1.5.6
pkgrel=2
arch=(any)
url="https://github.com/bit-team/backintime"
license=(GPL)
makedepends=(python)
#checkdepends=(openssh python-dbus rsync systemd python-pyfakefs oxygen-icons python-pylint)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/bit-team/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
backintime-backup-job.{service,timer})
sha256sums=('42cdf3ecb37f692d42c78a89256e4678c8d6beb315fe49fe03d7248071f28391'
            '8a3aa12434048d604836b709df18528fe51867de7c8d229190eb5b518fa6d918'
            '5f9346be71d16786cb547362fe35755c8af59095e985c27d28ac14dfe791b7c8')

#prepare() {i
#  cd "$_pkgname-$pkgver"
#}

build() {
  cd "$_pkgname-$pkgver/common"
  ./configure --python
  make

  cd "$srcdir/$_pkgname-$pkgver/qt"
  ./configure --python
  make
}

#check() {
#  cd "$_pkgname-$pkgver/common"
#  make test
#}

package_backintime-cli() {
  pkgdesc="Simple backup system inspired from the Flyback Project and TimeVault. CLI version."
  depends=(openssh python-dbus python-keyring rsync python-packaging)
  optdepends=('backintime: Qt6 GUI version')

  cd "$_pkgname-$pkgver/common"
  make DESTDIR="$pkgdir" install
  python -m compileall -d /usr "$pkgdir"/usr
  python -O -m compileall -d /usr "$pkgdir"/usr
}

package_backintime() {
  pkgdesc="Simple backup system inspired from the Flyback Project and TimeVault. Qt6 GUI version."
  depends=("backintime-cli=$pkgver" polkit python-dbus python-pyqt6 xorg-xdpyinfo sshfs)
  # note users can optionally install EITHER kompare OR meld but not both!
  optdepends=('cronie: to trigger automated backups'
  'kompare: diff/patch frontend'
  'meld: diff/patch frontend'
  'qt6-translations: translate BIT dialogs into native language')
  install=backintime.install

  cd "$_pkgname-$pkgver/qt"
  make DESTDIR="$pkgdir" install
  python -m compileall -d /usr "$pkgdir"/usr
  python -O -m compileall -d /usr "$pkgdir"/usr

  mkdir "$pkgdir/usr/share/$_pkgname/contrib"
  install -m644 "$srcdir/$_pkgname-backup-job.service" "$pkgdir/usr/share/$_pkgname/contrib/$_pkgname-backup-job.service"
  install -m644 "$srcdir/$_pkgname-backup-job.timer" "$pkgdir/usr/share/$_pkgname/contrib/$_pkgname-backup-job.timer"

  cat <<EOF > "$pkgdir/usr/share/$_pkgname/contrib/README.txt"
Example user systemd timer and service units are provided. To use,
refer to https://wiki.archlinux.org/title/Systemd/User#How_it_works

Optionally adjust the value for OnCalendar= with a valid setting.
See man systemd.timer for options.
EOF
}

# vim:set ts=8 sts=2 sw=2 et:
