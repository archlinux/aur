# This is the PKGBUILD for ngs
# Maintainer: Aaron Baker <aa{last name}99{at}gmail{dt}org>

pkgname=ngs
pkgver=1.2.3
pkgrel=1
pkgdesc="A new, domain-specific API for accessing reads, alignments and pileups produced from Next Generation Sequencing."
arch=('x86_64')
url="https://github.com/ncbi/ngs"
depends=('java-environment' 'perl-file-copy-recursive' 'zlib')
provides=('ngs')
license=('custom:PublicDomain')
source=("https://github.com/ncbi/ngs/archive/$pkgver.tar.gz" "$pkgname.patch")
sha256sums=('625ec04737dea787f3800744f1d5fddb4d83b21013c281bcbc8691149b230794' '9e4356666dbe7fc01dfcfaad914b108777164c464a77776742fae78da369a352')

prepare(){
  cd "${pkgname}-${pkgver}"
  # ncbi build process frequently checks if we are root user which interferes 
  #   with makepkg use of fakeroot
  patch -p1 -i $srcdir/$pkgname.patch 
}

build(){
  cd "${pkgname}-${pkgver}"
  ./configure --prefix="$pkgdir/usr/"
  cd "ngs-java"
  ./configure --prefix="$pkgdir/usr/"
  cd ".."
  make || echo "hack: cannot configure ngs-bam until the rest is compiled; but make fails because ngs-bam is not configured"

  cd "ngs-bam"
  ./configure --prefix="$pkgdir/usr/"
  cd ".."
  make
}

check(){
  cd "${pkgname}-${pkgver}"
  make -k test
}

package(){
  cd "$pkgname-$pkgver"
  # ncbi does not use autoconf/automake so there is no respect for DESTDIR
  #   but there is a ROOT(dir)
  make "ROOT=$pkgdir" install

  # add license
  mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
  cp "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  # reorganize files from build process to fit Arch
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/share/java"
  mv "$pkgdir/usr/jar" "$pkgdir/usr/share/java/$pkgname"
}
