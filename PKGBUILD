# Maintainer: Brandon Golway <brando56894 at gmail dot com>
_pkgname=freenas-vm-tools
pkgname="$_pkgname"-git
pkgver=r72.ee4a755
pkgrel=1
pkgdesc="Bhyve VM tools for FreeNAS 10"
arch=(x86_64)
url="https://www.freenas.org"
license=('GPL')
depends=(poco)
makedepends=(git cmake binutils clang libmariadbclient libtool unixodbc)
provides=('freenas-vm-tools')
conflicts=('freenas-vm-tools')
source=("git+https://github.com/freenas/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
        cd "$_pkgname"
        export CXX=clang++
        cmake -DCMAKE_INSTALL_PREFIX=/usr .
        make
}

package() {
        cd "$_pkgname"
        make DESTDIR="$pkgdir/" install
	mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
        cd systemd
        mkdir -p "$pkgdir"/usr/lib/systemd/system
        install -m644 freenas-vm-tools.service  "$pkgdir"/usr/lib/systemd/system/freenas-vm-tools.service
}
