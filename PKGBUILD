# Maintainer: ahmedmoselhi <ahmedmoselhi55@gmail.com> 

pkgname='grub-customizer-gtk'
_pkgname='grub-customizer'
pkgver=5.2.2
pkgrel=1
pkgdesc='A tool to choose grub2 bootscreen theme'
arch=('x86_64')
url="https://launchpad.net/grub-customizer"
license=('GPL3')
depends=('grub')
makedepends=('cmake' 'gcc' 'gtkmm3' 'gettext' 'openssl' 'libarchive')
provides=('grub-customizer')
source=("${_pkgname}_${pkgver}.tar.gz"::"http://ppa.launchpad.net/danielrichter2007/grub-customizer/ubuntu/pool/main/g/${_pkgname}/${_pkgname}_${pkgver}.orig.tar.gz"
              "grub.cfg")
sha256sums=("39d4b3dda81c3804566f0cc9d2ab1f41e1ffa923656b651c1488220ed2046793"
                       "db215fe06e97929ad5e82eb8257b8c487ab61414e3e9a2946b9f18880cf2caad")

prepare() {
rm -rf ${_pkgname}-${pkgver}
tar -zxf ${_pkgname}_${pkgver}.tar.gz
}

build() {
  cd "${_pkgname}-${pkgver}"
  mkdir -p builddir && cd builddir
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_CXX_FLAGS=" -std=c++11"
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  # install lang files
  arr=(ar ast bg bs ca cs cy de el en_GB es et eu fi fr gl hr hu it ja kk ko lt nl pl pt_BR pt ro ru sk sr sv ta th tr uk vi zh_CN zh_TW)
  for i in "${arr[@]}"; do
      install -Dm644 "translation/translation-$i.mo" "${pkgdir}/usr/share/locale/$i/LC_MESSAGES/grub-customizer.mo"
  done
  
  # install icons
   for i in 16x16 24x24 32x32 48x48 64x64 128x128; do
       install -Dm644 "misc/icons/$i.svg" "${pkgdir}/usr/share/icons/hicolor/$i/apps/grub-customizer.svg"
   done
  
  # install desktop files
  install -Dm755 "misc/${_pkgname}.desktop"  "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  
  # install bin files
  install -Dm755 "builddir/${_pkgname}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "builddir/grubcfg-proxy"  "${pkgdir}/usr/lib/${_pkgname}/grubcfg-proxy"
  install -Dm644 "${srcdir}/grub.cfg" "${pkgdir}/etc/${_pkgname}/grub.cfg"
  
  # install documentation
  install -Dm755 "README" "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -Dm755 "changelog" "${pkgdir}/usr/share/doc/${_pkgname}/changelog"
}