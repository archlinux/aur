# Maintainer: Guy Chait <53366531+gchait@users.noreply.github.com>
pkgname=autocake
pkgver=0.1.0
pkgrel=1
pkgdesc="Fully automated SQM (cake) bandwidth tuner for Linux Wi-Fi workstations"
arch=('any')
url="https://github.com/gchait/autocake"
license=('MIT')
depends=('bash' 'iproute2' 'curl')
# No makedepends: base-devel is assumed installed for AUR builds, which
# already provides make, sed, install, etc. Listing them is discouraged
# per current Arch packaging guidelines.
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
# Replace SKIP with the real hash before publishing to AUR — run
# `updpkgsums` after tagging the release. SKIP bypasses tarball
# integrity verification entirely; it's only acceptable while the
# tag doesn't exist yet (chicken-and-egg during initial setup).
sha256sums=('2fd2d70875a2b53e35d8d799a9ff3051cc9ba5e749dd3c064b166a9ba0498fc0')
install=$pkgname.install

package() {
  cd "$pkgname-$pkgver"

  # PREFIX=/usr per FHS for distro packages (/usr/local is admin-owned).
  # SYSTEMDDIR=/usr/lib/systemd/system per systemd's Unit Load Path: that
  # path is for distro-shipped units, /etc/systemd/system is reserved for
  # local admin overrides and `systemctl enable` symlinks.
  make install \
    DESTDIR="$pkgdir" \
    PREFIX=/usr \
    SYSTEMDDIR=/usr/lib/systemd/system

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
