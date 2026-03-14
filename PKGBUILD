# Maintainer: graysky <therealgraysky AT protonmail DOT com>
# Contributor: germar <germar DOT reitze AT gmail DOT com>

pkgname=(backintime backintime-cli)
_pkgname="backintime"
pkgver=1.6.1
pkgrel=2
arch=(any)
url="https://github.com/bit-team/backintime"
license=(GPL-1.0-or-later)
makedepends=(asciidoctor man-db python-pyfakefs)
#checkdepends=(openssh python-dbus rsync systemd python-pyfakefs oxygen-icons python-pylint)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/bit-team/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
backintime-backup-job.{service,timer})
sha256sums=('3d959a902403f11d87865982a38d65d82292af3d54a5c93a710a91175922cfc4'
            '3b0f70a9046d5ee2a883dfcd8f74335935618a724f2847f2da7dee17a0a9f4f3'
            '5f9346be71d16786cb547362fe35755c8af59095e985c27d28ac14dfe791b7c8')

#prepare() {
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
  depends=(openssh python-dbus python-keyring python-packaging rsync sshfs)
  optdepends=('backintime: Qt6 GUI version'
    'encfs: encrypted filesystem in user-space'
    'gocryptfs: encrypted overlay filesystem')

  cd "$_pkgname-$pkgver/common"
  make DESTDIR="$pkgdir" install
  python -m compileall -d /usr "$pkgdir"/usr
  python -O -m compileall -d /usr "$pkgdir"/usr
}

package_backintime() {
  pkgdesc="Simple backup system inspired from the Flyback Project and TimeVault. Qt6 GUI version."
  depends=("backintime-cli=$pkgver" polkit python-pyqt6 python-secretstorage qt6-svg xorg-xdpyinfo)
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
