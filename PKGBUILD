# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=iotop-py3
pkgver=0.6
pkgrel=1
pkgdesc='View I/O usage of processes'
arch=('any')
url='http://guichaz.free.fr/iotop/'
provides=('iotop')
conflicts=('iotop')
license=('GPL')
depends=('python')
makedepends=('bc' 'python')
source=("http://guichaz.free.fr/${pkgname/-py3}/files/${pkgname/-py3}-$pkgver.tar.bz2")
sha256sums=('3adea2a24eda49bbbaeb4e6ed2042355b441dbd7161e883067a02bfc8dcef75b')

prepare() {
  # Convert Python 2 to Python 3, concurrently
  local procs=`grep processor /proc/cpuinfo | wc -l`
  local np=`echo $procs+1 | bc`
  2to3 "${pkgname/-py3}-$pkgver" -w -n --no-diff -j $np
}

package() {
  cd "${pkgname/-py3}-$pkgver"

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  # Fix for FS#33906
  chmod 644 "$pkgdir/usr/share/man/man8/iotop.8"
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
