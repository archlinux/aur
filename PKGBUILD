# Maintainer:Bipin Kumar <kbipinkumar@pm.me>

pkgname=fastani
_pkgname=FastANI
pkgver=1.34
pkgrel=1
pkgdesc='Fast alignment-free computation of whole-genome Average Nucleotide Identity (ANI).' 
arch=(x86_64)
url="https://github.com/ParBLiSS/FastANI"
license=('Apache')
depends=('glibc' 'gsl' 'zlib' 'gcc-libs' 'bash')
optdepends=('python-pyfastani: Cython bindings and Python interface to FastANI')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ParBLiSS/FastANI/archive/refs/tags/v${pkgver}.tar.gz"
        )
b2sums=('81b9080ab0900ae6f2445f3568b085f8f74944d4797fb83caf6cfb80b0fd7836226949676646be684245a3c0c70d4c75ed1ed29d1b08543c4eb5d26e34c2d6cb')

prepare() {
  cd ${_pkgname}-${pkgver}
  # drop-memcpy-wrapper
  sed -i '6,11d' Makefile.in
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
