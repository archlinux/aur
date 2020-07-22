# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
_pkgname=mip6d
pkgname=mip6d-umip.org-git
pkgver=2.0.2.umip.0.4.r139.7d67209
pkgrel=1
pkgdesc="UMIP userland with NEPL and MCoA patches for Mobile IPv6/NEMO operation with multihoming"
arch=(i686 x86_64)
url="http://www.umip.org"
license=('GPL2')
depends=(openssl)
optdepends=('radvd: to act as a NEMO Mobile Router advertising a MNP on the mobile link'
            'strongswan: to secure communication between the HA and MN')
makedepends=(git indent)
provides=(mip6d mip6d-umip.org)
conflicts=(mip6d mip6d-umip.org)
install=mip6d.install
source=(${_pkgname}::git+https://github.com/jlanza/umip.git
        mip6d.install
        mip6d.service
        openssl-1.1.patch)
sha384sums=('SKIP'
            '457e7f5730bdb938e538e97806741cba3a0db80a1172f0240c77ddb6e4053bbe0d64dc5921313487786e4667445c6d68'
            'dff32c8ebef69d7c44bd86ae081c24f5b48ed40113487438493e3e7da94a92a48ffa71d984ecc5b75334a3c9a56b44ec'
            'c32ee86b68a9403aecc0c735867608d21c40060541768860e84f875e7ff007fb96ff842e5da2d9bbaf2309df1032102c')

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s.%s" "$(sed -rn '/^AC_INIT/s/.*\[(.*)-umip-(.*)\].*/\1.umip.\2/p' configure.ac)" \
                     "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"

  patch -p1 -i ../openssl-1.1.patch
}

build() {
  cd "$_pkgname"
  autoreconf --install
  ./configure --prefix=/usr --sbindir=/usr/bin --enable-vt
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install

  for file in extras/example-*.conf; do
    install -D -m 0644 $file $pkgdir/usr/share/doc/$_pkgname/${file#extras/}
  done

  install -D -m 0644 $srcdir/mip6d.service $pkgdir/usr/lib/systemd/system/mip6d.service
}

# vim:set ts=2 sw=2 et:
