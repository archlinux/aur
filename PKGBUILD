pkgname=(zlib-ng-static zlib-ng-compat-static)
_pkgname=zlib-ng
pkgver=2.3.3
pkgrel=1
pkgdesc='zlib replacement with optimizations for next generation systems'
url='https://github.com/zlib-ng/zlib-ng'
arch=('aarch64' 'x86_64')
license=('Zlib')
# depends=(glibc)
makedepends=(musl gcc make gzip)
options=(staticlibs)
source=("${url}/archive/refs/tags/$pkgver/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f9c65aa9c852eb8255b636fd9f07ce1c406f061ec19a2e7d508b318ca0c907d1')
b2sums=('36fed55807a98bb17edbb53b5b9456c3023dcf5aea9208b453d1cd187c56bba56a6818c3a14a39bf271a7f6bcee5203cc1e4f7e8d1961e965661a232afd0778f')

build() {
  export CC="musl-gcc -fno-link-libatomic"
  export CFLAGS="$CFLAGS -Os"
  mv "${_pkgname}-${pkgver}" ${pkgname[0]}
  cp -r ${pkgname[0]} ${pkgname[1]}
  cd ${pkgname[0]}
  ./configure \
    --prefix=/usr \
    --includedir=/usr/include/${pkgname[0]} \
    --libdir=/usr/lib/${pkgname[0]} \
    --static
  make -j $(nproc)
  cd ../${pkgname[1]}
  ./configure \
    --prefix=/usr \
    --includedir=/usr/include/${pkgname[1]} \
    --libdir=/usr/lib/${pkgname[1]} \
    --static \
    --zlib-compat
  make -j $(nproc)
}

check() {
  make -C ${pkgname[0]} EMU_RUN="" test
  make -C ${pkgname[1]} EMU_RUN="" test
}

package_zlib-ng-static() {
  provides=(zlib-ng-static)
  cd ${pkgname[0]}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/man"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname[0]}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname[0]}"
}

package_zlib-ng-compat-static() {
  pkgdesc+=" (zlib compat)"
  provides=(zlib-static)
  cd ${pkgname[1]}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/man"
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname[1]}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname[1]}"
}
