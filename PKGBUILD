# Maintainer: Patrick Siegl < patrick dot siegl at gmx dot germany >

pkgname="ast-dkms"
_pkgbase="${pkgname%-*}"

provides=("$_pkgbase")

pkgver="1.14.1"
pkgrel="1"
pkgdesc="ASPEED Graphics Linux DRM Driver"
url="https://www.aspeedtech.com/tw/support_driver/"
license=("MIT")
arch=("x86_64")

depends=("dkms" "linux-headers")

install=${_pkgbase}.install
source=("https://www.aspeedtech.com/file/support/Linux_DRM_${pkgver}_${pkgrel}.tar.gz"
        "001-ast_drv-drm_fbdev_generic.patch"
        "dkms.conf")
sha512sums=("2290e2ad32d39815d78cf753373cec43539bf7f913ca0781144bb0cd573bbe9644cd58c76be16f1a2ccbf0cb5cdd5a22579b10ea52b09cf278a66bd32965de8a"
            "93c75399dce4640649b866344448c96dceaa141e4d42666a89503431c7283dc94edf2f335ccad6eef247be57f2a6beb95a3f7b3019d3df9f4d80960b205e81b7"
            "11c62f667560ec7b540e804a0e18af2b6293fcb5c7e971bbd556ebd781acabc81bd3f1a445659e676fbb5c35688059452230a7779674f0d807400a47172dc12c")

prepare() {
    patch --forward --strip=1 --input="${srcdir}/001-ast_drv-drm_fbdev_generic.patch"
}

package() {
  install -d "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  cp ${srcdir}/Linux_DRM_1.14.1_1/sources/src601/{Makefile,ast_dp.c,ast_dp501.c,ast_dram_2500.c,ast_dram_tables.h,ast_drv.c,ast_drv.h,ast_i2c.c,ast_main.c,ast_mm.c,ast_mode.c,ast_post.c,ast_tables.h} "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  cp ${srcdir}/Linux_DRM_1.14.1_1/COPYING "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/LICENSE

  install -Dm644 ${srcdir}/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
