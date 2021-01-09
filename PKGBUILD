# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libffi-minimal-git
pkgver=3.3
pkgrel=1
pkgdesc="A portable, high level programming interface to various calling conventions (32-bit)"
arch=('x86_64')
license=('MIT')
url="https://sourceware.org/libffi/"
depends=('lib32-glibc' 'libffi')
provides=(lib32-libffi)
conflicts=(lib32-libffi)
#checkdepends=('dejagnu')
source=("git+https://github.com/libffi/libffi.git")
sha512sums=('SKIP')

pkgver() {
  cd "libffi"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd libffi

  export CC="gcc -m32"

  ./autogen.sh
  ./configure --prefix=/usr \
    --libdir=/usr/lib32 --libexecdir=/usr/lib32 \
    --disable-static --enable-pax_emutramp --disable-docs --disable-debug

  make
}

#check() {
#  make -C libffi check
#}

package() {
  cd libffi

  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}"/usr/{include,share}
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
