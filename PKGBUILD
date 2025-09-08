# Maintainer: dreieck
# Contributor: Cody Schafer <dev@codyps.com>

_bpn=hcxdumptool
pkgname="${_bpn}-git"
pkgdesc="Small tool to capture packets from wlan devices."
license=('MIT')
arch=('i686' 'x86_64')

url="https://github.com/ZerBea/${_bpn}"

pkgver=7.0.0.r3.g4ea5c02
pkgrel=1

source=("git+$url")
md5sums=('SKIP')

conflicts=("$_bpn")
provides=("$_bpn=${pkgver}")

makedepends=('make' 'gcc')

depends=('curl' 'libpcap' 'zlib' 'openssl')

# from https://wiki.archlinux.org/index.php/VCS_package_guidelines
pkgver() {
  cd "$srcdir/$_bpn"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build () {
  cd "$srcdir/$_bpn"
  make
}

package () {
  cd "$srcdir/$_bpn"
  make DESTDIR=$pkgdir PREFIX=/usr install
  
  for _docfile in README.md changelog; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_bpn}/${_docfile}"
  done
  
  install -D -v -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
