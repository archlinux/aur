# Maintainer: Patrick Siegl < patrick dot siegl at gmx dot germany >

pkgname="ast-dkms"
_pkgbase="${pkgname%-*}"

provides=("$_pkgbase")

pkgver="1.14.2"
pkgrel="2"
pkgdesc="ASPEED Graphics Linux DRM Driver"
url="https://www.aspeedtech.com/tw/support_driver/"
license=("MIT")
arch=("x86_64")

depends=("dkms" "linux-headers")

install=${_pkgbase}.install
source=("https://www.aspeedtech.com/file/support/Linux_DRM_${pkgver}_${pkgrel}.tar.gz"
        "001-ast_drv-drm_fbdev_generic.patch"
        "dkms.conf")
sha512sums=("7e94978c62a50a6cd677820e04049c7c7dec16661ab72d0b4cdaf457799076ef1c510f093efb26eaaa25c1c9766a74f071610c1288628f7bd46a7a88cb1481d3"
            "4f9ad030f2c9d35ac96972171703422add2d730878f3858f8cfec6d2dbf2a83c8b52ec53d5f43667ec48ebcce0600296ce2af57db727418a2b11d948eeb0d9be"
            "11c62f667560ec7b540e804a0e18af2b6293fcb5c7e971bbd556ebd781acabc81bd3f1a445659e676fbb5c35688059452230a7779674f0d807400a47172dc12c")

prepare() {
    patch --forward --strip=1 --input="${srcdir}/001-ast_drv-drm_fbdev_generic.patch"
}

package() {
  install -d "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}_${pkgrel}/
  cp ${srcdir}/Linux_DRM_${pkgver}_${pkgrel}/sources/src601/{Makefile,ast_dp.c,ast_dp501.c,ast_dram_2500.c,ast_dram_tables.h,ast_drv.c,ast_drv.h,ast_i2c.c,ast_main.c,ast_mm.c,ast_mode.c,ast_post.c,ast_tables.h} "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}_${pkgrel}/
  cp ${srcdir}/Linux_DRM_${pkgver}_${pkgrel}/COPYING "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}_${pkgrel}/LICENSE

  install -Dm644 ${srcdir}/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}_${pkgrel}/dkms.conf
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
    -e "s/@PKGVER@/${pkgver}_${pkgrel}/" \
    -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}_${pkgrel}/dkms.conf
}
