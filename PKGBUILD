# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Tim Jester-Pfadt <t.jp@gmx.de>
# Maintainer: KafCoppelia <k740677208@gmail.com>

_pkgname=squashfuse
pkgname=${_pkgname}-git
pkgver=r494.dc217a8
pkgrel=1
pkgdesc="FUSE filesystem to mount squashfs archives"
arch=('x86_64')
url="https://github.com/vasi/squashfuse"
license=('LicenseRef-squashfuse')
provides=('squashfuse')
conflicts=('squashfuse')
depends=('fuse3' 'zstd' 'glibc' 'zlib' 'xz' 'lz4' 'lzo')
makedepends=('git' 'make')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ./autogen.sh
}

build() {
  cd ${srcdir}/${_pkgname}
  ./configure --prefix=/usr
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' -i libtool
  make -j
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/$pkgname
  install -Dm644 *.h -t ${pkgdir}/usr/include/${_pkgname}
}
