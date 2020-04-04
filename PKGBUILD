# Maintainer: Hal Gentz <zegentzy@protonmail.com>
# Contributer: Vesa Kaihlavirta <vegai@iki.fi>
 
pkgname=openttd-btpro
_pkgname=openttd
btpro_release=C_19303
pkgver=1.9.3
pkgrel=2
pkgdesc='An engine for running Transport Tycoon Deluxe. BTPro patches applied.'
arch=('x86_64')
url='http://openttd.btpro.nl/index.php/forum/30-btpro-openttd-client-talk/'
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo' 'hicolor-icon-theme' 'desktop-file-utils' 'xz')
optdepends=('openttd-opengfx: free graphics' 
            'openttd-openmsx: free musicset'
            'openttd-opensfx: free soundset')
source=("https://proxy.binaries.openttd.org/openttd-releases/${pkgver}/${_pkgname}-${pkgver}-source.tar.xz"
        "http://openttd.btpro.nl/OpenTTD_versions/BTPro_Client_${pkgver}_${btpro_release}.diff"
        "http://openttd.btpro.nl/OpenTTD_versions/innerhighlight.grf")
sha256sums=(
            '1988e17f5b6f4b8f423c849ef1c579c21f678722ae4440f87b27a5fea6385846'
            'e370ee6b73167d33d2266e946eeb9102c5efea6599ee4782efd9308c529e4b82'
            '1b181a27fbb468c7301291fc61384087ce7b1592cb0023be00f04736eec6e79b')
conflicts=('openttd')
 
prepare() {
  cd ${_pkgname}-${pkgver} 
  patch -p1 < "../BTPro_Client_${pkgver}_${btpro_release}.diff" || true
}
 
build() {
  cd ${_pkgname}-${pkgver} 
 
  # http://site.icu-project.org/download/61#TOC-Migration-Issues
  CXXFLAGS+=' -DU_USING_ICU_NAMESPACE=1'
 
 ./configure \
    --prefix-dir=/usr \
    --binary-name=${_pkgname} \
    --binary-dir=bin \
    --data-dir=share/${_pkgname} \
    --install-dir="${pkgdir}" \
    --doc-dir=share/doc/${_pkgname} \
    --menu-name="OpenTTD"
 
  make
}
 
package() {
  cd ${_pkgname}-${pkgver} 
 
  make install
  install -m644 -D ../innerhighlight.grf "${pkgdir}"/usr/share/openttd/baseset/innerhighlight.grf
}

