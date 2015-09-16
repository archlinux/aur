# Maintainer: 2ion
pkgname=bash-ctypes-git
pkgver=r56.b0800b2
pkgrel=1
pkgdesc="Foreign Function Interface for Bash"
arch=('x86_64' 'i686')
url="https://github.com/taviso/ctypes.sh"
license=('MIT')
depends=('bash' 'libffi')
makedepends=('git' 'libffi' 'autoconf' 'automake' 'libtool')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(\
  'bash-ctypes::git+https://github.com/taviso/ctypes.sh#branch=master' \
  'ctypes_bash_profile.sh')
md5sums=(\
  'SKIP' \
  '8f94ef9e242b89d5ea860527e2595f2c')
install=${pkgname}.install

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  autoreconf -vifs
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make install DESTDIR="$pkgdir"
  install -Dm755 "${srcdir}/ctypes_bash_profile.sh" "${pkgdir}/etc/profile.d/ctypes.sh"
}
