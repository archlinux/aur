# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=raxml
pkgver=8.2.12
pkgrel=1
pkgdesc="Randomized Axelerated Maximum Likelihood"
arch=('x86_64')
url="http://sco.h-its.org/exelixis/web/software/raxml/"
license=('GPL3')
depends=('bash' 'perl')
conflicts=(raxml-mpi)
install='raxml.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/stamatak/standard-RAxML/archive/v$pkgver.tar.gz"
        'raxml.install')
sha256sums=('338f81b52b54e16090e193daf36c1d4baa9b902705cfdc7f4497e3e09718533b'
            'c908ecbcfd6323e0b05a19037f96904a9b379ae0a9934ade839210095bb49caf')

build() {
  cd standard-RAxML-$pkgver

  for _f in $(ls Makefile*gcc | grep -vE "HYBRID|MPI") ; do
    rm -f *.o
    make -f $_f || true
  done
}

package() {
  cd standard-RAxML-$pkgver

  for _f in raxml* ; do
    install -Dm755 $_f "$pkgdir"/usr/bin/$(basename $_f)
  done

  for _perlscript in usefulScripts/*.pl ; do
    install -Dm755 $_perlscript "$pkgdir"/usr/bin/$(basename $_perlscript .pl)
  done

  for _shellscript in usefulScripts/*.sh ; do
    install -Dm755 $_shellscript "$pkgdir"/usr/bin/$(basename $_shellscript .sh)
  done
}
