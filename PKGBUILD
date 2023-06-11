# Maintainer: bipin kumar <kbipinkumar@pm.me>
# Contributor: sukanka <su975853527 at gmail>
pkgname=augustus
_pkgname=Augustus
pkgver=3.5.0
pkgrel=5
pkgdesc="A eukaryotic gene prediction program"
arch=('i686' 'x86_64')
url="http://augustus.gobics.de/"
license=('custom:Artistic-2.0')
depends=('bamtools'  'boost-libs' 'gsl' 'mysql++' 'sqlite' 'python' 'lpsolve' 'perl' 'htslib' 'python-pandas' 'python-numpy' 'python-biopython' 'mariadb-libs' 'gcc-libs' 'glibc' 'bash')
makedepends=('boost' 'suitesparse' 'samtools' )
source=($pkgname-$pkgver.tar.gz::https://github.com/Gaius-Augustus/Augustus/archive/v$pkgver.tar.gz
	"$pkgname.patch::https://github.com/Gaius-Augustus/Augustus/pull/395.patch")
sha256sums=('5ed6ce6106303b800c5e91d37a250baff43b20824657b853ae04d11ad8bdd686'
            'f6676c6f9e5fade9adaf6a457fd87c9401a5ebc5f6aa4a87037990dd381afd1d')

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 < $srcdir/$pkgname.patch
}

build() {
  cd $_pkgname-$pkgver
  make SAMTOOLS=/usr/include/bam PREFIX="$pkgdir"/usr INSTALLDIR=${pkgdir}/usr/lib/augustus
}

package() {
  cd $_pkgname-$pkgver
  install -d ${pkgdir}/usr/bin
  make DESTDIR="$pkgdir" PREFIX="$pkgdir"/usr INSTALLDIR=${pkgdir}/usr/lib/augustus install

  # fix broken links
  for bin in {augustus,etraining,prepareAlign,fastBlockSearch}
  do
    ln -sf /usr/lib/augustus/bin/${bin} "$pkgdir"/usr/bin/${bin}
  done
  rm "$pkgdir"/usr/bin/{load2db,getSeq}

  install -Dm644 src/LICENSE.TXT "$pkgdir"/usr/share/licenses/augustus/LICENSE
}
