# Maintainer: Sick Codes <info at sick dot codes>
# Contributor: Danct12 <danct12@disroot.org>
# Contributor: Bart Ribbers <bribbers@disroot.org>

_pkgname=waydroid
pkgname=${_pkgname}-git
pkgrel=3
pkgver=1.1.1.r5.g736e9c9
pkgdesc="A container-based approach to boot a full Android system on a regular Linux system"
arch=('any')
license=('GPL3')
depends=('lxc' 'python' 'cython' 'libgbinder' 'python-gbinder' 'python-gobject' 'nftables' 'dnsmasq')
makedepends=('git' 'make')
optdepends=('waydroid-image: Android image for use with waydroid'
            'python-pyclip: share clipboard with container')
_commit="96204ad92421fd3e1a17b3555e7057d05255046e" # tags/1.1.1
source=(${_pkgname}::git+https://github.com/waydroid/waydroid.git
        gbinder.conf)
sha256sums=('SKIP'
            '87a21d401281735ea026d715ea79b36e01f9af084198de2761b32d5b58a343dd')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# prepare() {
#   cd waydroid
#   patch -p1 < ../122.patch
# }

package() {
  cd waydroid
  install -dm755 "${pkgdir}/usr/lib/waydroid"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/bin"
  cp -r tools data "${pkgdir}/usr/lib/waydroid/"
  mv "${pkgdir}/usr/lib/waydroid/data/Waydroid.desktop" "${pkgdir}/usr/share/applications"
  cp waydroid.py "${pkgdir}/usr/lib/waydroid/"
  ln -s /usr/lib/waydroid/waydroid.py "${pkgdir}/usr/bin/waydroid"
  install -Dm644 -t "${pkgdir}/etc" "$srcdir/gbinder.conf"
  install -Dm644 -t "${pkgdir}/etc/gbinder.d" gbinder/anbox.conf
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" debian/waydroid-container.service

}

