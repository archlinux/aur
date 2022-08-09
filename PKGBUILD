# Maintainer: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

pkgname=waydroid
pkgver=1.3.0
pkgrel=1
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system"
arch=('any')
url='https://github.com/waydroid'
license=('GPL')
depends=('lxc' 'python' 'python-gbinder' 'python-gobject' 'nftables' 'dnsmasq')
makedepends=('git')
optdepends=('waydroid-image: Android image for use with waydroid'
            'python-pyclip: share clipboard with container')
_commit="1eba5463d904e3e87cc237627d96727a90960624" # tags/1.3.0
source=("waydroid::git+https://github.com/waydroid/waydroid.git#commit=$_commit"
        gbinder.conf)

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd waydroid
}

package() {
  cd waydroid
  install -dm755 "$pkgdir/usr/lib/waydroid"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/bin"
  cp -r tools data "$pkgdir/usr/lib/waydroid/"
  mv "$pkgdir/usr/lib/waydroid/data/Waydroid.desktop" "$pkgdir/usr/share/applications"
  cp waydroid.py "$pkgdir/usr/lib/waydroid/"
  ln -s /usr/lib/waydroid/waydroid.py "$pkgdir/usr/bin/waydroid"

  install -Dm644 -t "$pkgdir/etc" "$srcdir/gbinder.conf"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" systemd/waydroid-container.service
}

sha256sums=('SKIP'
            '87a21d401281735ea026d715ea79b36e01f9af084198de2761b32d5b58a343dd')
