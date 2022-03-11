# Maintainer: Bastian Rieck <bastian@rieck.me>
pkgname=jdresolve-git
pkgver=r11.365e7f0
pkgrel=1
pkgdesc='A fast and recursive DNS name resolver for log files'
arch=('x86_64')
url="https://github.com/jdrowell/jdresolve"
license=('GPL-2.0')
depends=('perl-net-dns')
makedepends=('git')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
changelog=
source=(
  'jdresolve::git+https://github.com/jdrowell/jdresolve'
  'fix_man_path.patch'
)
noextract=()
md5sums=(
  'SKIP'
  '7080466cab31a0a594d9301425fdfbaf'
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr
  patch --forward --strip=1 --input="${srcdir}/fix_man_path.patch"
	make
}

check() {
  # Not a real check, but at least a type of smoke test.
	cd "$srcdir/${pkgname%-git}"
	make -k none
}

package() {
	cd "$srcdir/${pkgname%-git}"
  # Create directories for storing the executables and man pages in.
  # This is not done by the shipped Makefile.
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/man
	make DESTDIR="$pkgdir/" man install
}
