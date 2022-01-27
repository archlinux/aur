# Maintainer: zapp-brannigan <fuerst.reinje@web.de>
#             danhyal <danhyal@gmail.com>
#             jgottula
_pkgname=kvdo
pkgname=kvdo-dkms
pkgrel=1
pkgver=8.1.1.287
pkgdesc='A pair of kernel modules which provide pools of deduplicated and/or compressed block storage '
arch=('x86_64')
url="https://github.com/dm-vdo/kvdo"
license=('GPL2')
provides=('kvdo')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/dm-vdo/kvdo/archive/$pkgver.tar.gz"
        "dkms.conf"
        "config_hz.patch"
	"stdarg-kernel-path-fix.patch"
)
sha256sums=('db2b9dbcfdbc213e9eba54d2fc3c61c4964e5d0fa717e4f02817e5c030713440'
            '516f60bdb28f7a0cb6c8f1f84c656ee7c6aec8feb393538f227ed515372ac88a'
            'bd4c32b8496714e9a998fed0f0114076c61e50cf1a51ebf52180b728cb1bbd9c'
            '1af3ab2a0ca1eccca52f55335a3ae8a4e3704a9919ad0551ce85082630381ed1'
)

package() {
  mkdir -p "$pkgdir"/usr/src
  cp -r "$_pkgname-$pkgver" "$pkgdir"/usr/src/"$_pkgname-$pkgver"
  cd "$pkgdir"/usr/src/kvdo-"$pkgver"
  msg2 "Patching files..."
  patch --forward --strip=0 -i "$srcdir"/config_hz.patch
  git apply -v "$srcdir"/stdarg-kernel-path-fix.patch
  msg2 "Placing dkms.conf"
  cd "$srcdir"
  sed -e "s/@PKGVER@/${pkgver}/" dkms.conf > "$pkgdir"/usr/src/"$_pkgname-$pkgver"/dkms.conf
}
