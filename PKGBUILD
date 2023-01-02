# Contributor: James P. Harvey <jamespharvey20 at gmail dot com>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname=mstflint3
pkgver=3.8.0.27
_pkgver=3.8.0-1.27.gf3d39b6
pkgrel=1
pkgdesc='OpenFabrics Alliance firmware burning application (old version) for Mellanox ConnectX-2'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('python' 'sqlite')
source=("https://www.openfabrics.org/downloads/mstflint/mstflint-$_pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd mstflint-3.8.0
  sed -i '/FLAGS/ s/-Werror/-std=gnu++98/' configure.ac
  ./autogen.sh
}

build() {
  cd mstflint-3.8.0
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --mandir=/usr/share/man \
    --disable-inband
  make
}

package() {
  cd mstflint-3.8.0
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"

  # Remove files that might conflict with latest mstflint
  rm -rvf "${pkgdir}/usr/bin/hca_self_test.ofed"
  rm -rvf "${pkgdir}/usr/include"
  rm -rvf "${pkgdir}/usr/lib"
  rm -rvf "${pkgdir}/usr/share/mstflint"

  # Rename all mst* binaries to mst3*
  for bin in mst{config,flint,mcra,mread,mtserver,mwrite,regdump,vpd}; do
    mv -v "${pkgdir}/usr/bin/${bin}" \
          "${pkgdir}/usr/bin/${bin/#mst/mst3}"
  done
  mv -v "${pkgdir}/usr/share/man/man1/mstflint.1" \
        "${pkgdir}/usr/share/man/man1/mst3flint.1"
}
