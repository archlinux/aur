# Maintainer:Bipin Kumar <kbipinkumar@pm.me>

pkgname=fastani
_pkgname=FastANI
pkgver=1.33
pkgrel=2
pkgdesc='Fast alignment-free computation of whole-genome Average Nucleotide Identity (ANI).' 
arch=(x86_64)
url="https://github.com/ParBLiSS/FastANI"
license=('Apache')
depends=('glibc' 'gsl' 'zlib' 'gcc-libs' 'bash')
optdepends=('python-pyfastani: Cython bindings and Python interface to FastANI')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ParBLiSS/FastANI/archive/refs/tags/v${pkgver}.tar.gz"
        "drop-memcpy-wrapper.patch")
b2sums=('7475b14a12aadf6a9c6796f2f9fea23e89fecb7334fce7783f81150e775925372abdb7d9709006f88a1f12bd3392e67d2ce34447e0b2596df2e372b77b1dda76'
        '71ee77debce516c56eb959463c5a47016bbc37760444ac7e615608c663cbc90a30f228bfbd2bb8907f4d4985bcce41471de439d70465f8c4744a4c9462ced9eb')

prepare() {
  cp drop-memcpy-wrapper.patch ${_pkgname}-${pkgver}
  cd ${_pkgname}-${pkgver}
  patch -p1 < drop-memcpy-wrapper.patch
  sed -i 's/-O3/-O2/g' Makefile.in
  sed -i 's/$(CXXFLAGS)/$(CXXFLAGS) $(LDFLAGS)/g' Makefile.in
  sed -i 's/@prefix@/$(DESTDIR)@prefix@/g' Makefile.in
  autoupdate configure.ac
  autoconf
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --with-gsl=/usr/
  make -j1
}

package() {
  cd ${_pkgname}-${pkgver}
  install -d 755 ${pkgdir}/usr
  make DESTDIR=${pkgdir}/ install
  install -d ${pkgdir}/usr/share/${pkgname}
  for file in scripts/*
    do [ -f "$file" ] || continue
    install -Dm755 "$file" ${pkgdir}/usr/share/${pkgname}/$file
  done
}
