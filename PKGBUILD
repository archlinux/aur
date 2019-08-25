# This is the PKGBUILD for ngs-python
# Maintainer: Georgios Amanakis <g_amanakis{at}yahoo{dt}com>

pkgname=ngs-python
_pkgname=ngs
pkgver=2.10.0
pkgrel=1
pkgdesc="A new, domain-specific API for accessing reads, alignments and pileups produced from Next Generation Sequencing."
arch=('x86_64')
url="https://github.com/ncbi/ngs"
depends=('java-environment' 'perl-file-copy-recursive' 'zlib' 'ncbi-vdb' 'ngs')
provides=('ngs-python')
license=('custom:PublicDomain')
source=("https://github.com/ncbi/ngs/archive/$pkgver.tar.gz" "ngs.patch" "ngs-python.patch")
md5sums=('ce06ab5caeb516fed992060a41dda5e6'
         '3973d35d7a1b252eb6a426403a652ef9'
         '105d75eb6e144af86569e1240e959702')

prepare(){
  cd "${_pkgname}-${pkgver}"
  # ncbi build process frequently checks if we are root user which interferes 
  #   with makepkg use of fakeroot
  patch -p1 -i $srcdir/ngs.patch 
  patch -p1 -i $srcdir/ngs-python.patch 
}

build(){
  cd "${_pkgname}-${pkgver}"
  ./configure --prefix="$pkgdir/usr/" --build-prefix="$srcdir/build"
  cd ./ngs-python
  ./configure --prefix="$pkgdir/usr/" --build-prefix="$srcdir/build" --with-ngs-sdk-prefix="/usr" --with-ncbi-vdb-prefix="/usr"
  cd ../
  make -C ngs-sdk
  make -C ngs-python
}

#check(){
#  cd "${pkgname}-${pkgver}"
#  make -k test
#}

package(){
  cd "$_pkgname-$pkgver"
  # ncbi does not use autoconf/automake so there is no respect for DESTDIR
  #   but there is a ROOT(dir)
  #make "ROOT=$pkgdir" install
  make -C ngs-python install

  # add license
  mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
  cp "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
