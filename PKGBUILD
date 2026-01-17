# Maintainer: Lukas Frühstück <aur@nullptr.at>

pkgname=tzpfms
pkgver=0.4.1 
pkgrel=1
pkgdesc="TPM-based encryption keys for ZFS datasets"
arch=('x86_64')
url="https://git.sr.ht/~nabijaczleweli/tzpfms"
license=('0BSD' 'MIT')
depends=('tpm2-tss' 'zfs-utils' 'openssl')
makedepends=('shellcheck')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  disable-tpm1x.patch
)
sha512sums=(
  '9de6611c4d481655369f35c5908e113f61455018dbec46f09a264b72be43e3afd7e1c556e67118e41a5e96afd59830714e43442404e9cad2c3dcf689e2a52277'
  'bda908409aca8ba646132d9024c0a8f30fb9ae68623cd1cfbc7926294f71ae4e3244238c14113abb75b33dce4bc612fd26f858faebb31e4ea555f9948182c119'
)

prepare() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  patch -Np1 -i ../disable-tpm1x.patch
}

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make MANDOC=true DISABLE_TPM1X=true
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}/out"
  install -Dm755 "zfs-tpm-list"         "${pkgdir}/usr/bin/zfs-tpm-list"
  install -Dm755 "zfs-tpm2-change-key"  "${pkgdir}/usr/bin/zfs-tpm2-change-key"
  install -Dm755 "zfs-tpm2-clear-key"   "${pkgdir}/usr/bin/zfs-tpm2-clear-key"
  install -Dm755 "zfs-tpm2-load-key"    "${pkgdir}/usr/bin/zfs-tpm2-load-key"
  install -Dm644 ../LICENSES/*       -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 man/*.8             -t "${pkgdir}/usr/share/man/man8"
}
