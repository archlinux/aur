# Maintainer: HeyCitizen <4637290+InTheMorning@users.noreply.github.com>
# Contributers: Vesa Kaihlavirta <vegai@iki.fi>, Hal Gentz <zegentzy@protonmail.com>
 
pkgname=openttd-btpro
_pkgname=openttd
_btpro_release=A_110103
pkgver=1.10.3
pkgrel=1
pkgdesc='An engine for running Transport Tycoon Deluxe. BTPro patches applied.'
arch=('x86_64')
url='http://openttd.btpro.nl/index.php/forum/30-btpro-openttd-client-talk/'
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo' 'hicolor-icon-theme' 'desktop-file-utils' 'xz')
optdepends=('openttd-opengfx: free graphics' 
            'openttd-openmsx: free musicset'
            'openttd-opensfx: free soundset')
source=("https://proxy.binaries.openttd.org/openttd-releases/${pkgver}/${_pkgname}-${pkgver}-source.tar.xz"
        "http://openttd.btpro.nl/OpenTTD_versions/BTPro_Client_${pkgver}_${_btpro_release}.diff"
        "http://openttd.btpro.nl/OpenTTD_versions/innerhighlight.grf")
sha256sums=(
            'c11601ef547eb1f6d4f9a035bd19e0a760b47872ce7d9b4117aaa45ac377b53b'
            'b119cf682567f786a98bf7a1eb510c3790b00043326923f1d88ea3f6dca625a3'
            '1b181a27fbb468c7301291fc61384087ce7b1592cb0023be00f04736eec6e79b')
conflicts=('openttd')
 
prepare() {
  cd ${_pkgname}-${pkgver} 
  patch -p1 < "../BTPro_Client_${pkgver}_${_btpro_release}.diff" || true
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
  mkdir -p "${pkgdir}/usr/share/openttd/baseset/newgrf/"
  install -m644 -D ../innerhighlight.grf "${pkgdir}/usr/share/openttd/baseset/newgrf/innerhighlight.grf"
}

