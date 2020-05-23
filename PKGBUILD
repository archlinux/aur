# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Reference: https://git.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/fio

_pkgname=fio
pkgname=fio-pmdk
pkgver=3.19
pkgrel=1
pkgdesc="Flexible I/O Tester (+engine dev-dax libpmem pmemblk)"
arch=('x86_64')
url="https://fio.readthedocs.io/en/latest/"
license=('GPL')
depends=('curl' 'glusterfs' 'gperftools' 'libaio' 'numactl' 'pmdk')
optdepends=('python2: some python2.7 scripts')
provides=('fio')
conflicts=('fio' 'fio-git')
source=("https://brick.kernel.dk/snaps/$_pkgname-$pkgver.tar.gz")
md5sums=("d163747d8f624f9d899d84b0b47bbeb9")

build() {
  cd "$_pkgname-$pkgver"
  # ./configure --help
  ./configure \
    --prefix=/usr \
    --extra-cflags="$CFLAGS" \
    --enable-lex
  make
}

check() {
  cd "$_pkgname-$pkgver"
  [ 3 -eq "$(./fio --enghelp | grep -e dev-dax -e libpmem -e pmemblk | wc -l)" ]
}

package() {

  cd "$_pkgname-$pkgver"

  make \
    DESTDIR="$pkgdir" \
    prefix=/usr \
    mandir=/usr/share/man \
    install

  # documentation
  install -dvm755 "$pkgdir/usr/share/doc/$pkgname/"
  mv -v examples HOWTO README REPORTING-BUGS SERVER-TODO "$pkgdir/usr/share/doc/$pkgname/"
  install -dvm755 "$pkgdir/usr/share/licenses/$pkgname/"
  mv -v COPYING MORAL-LICENSE "$pkgdir/usr/share/licenses/$pkgname/"

}
