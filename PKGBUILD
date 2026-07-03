# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
# Co-Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=autenticacao-gov-pt
_pkgname=autenticacao.gov
pkgver=3.15.0
pkgrel=4
pkgdesc="Portuguese Citizen Card Application (Portugal eID) source code based version"
arch=('i686' 'x86_64')
url="http://www.cartaodecidadao.pt/"
license=('GPL2' 'LGPL3' 'custom:EUPL')
depends=('qt5-base'
         'qt5-tools'
         'qt5-quickcontrols'
         'qt5-quickcontrols2'
         'qt5-graphicaleffects'
         'pcsclite>=1.5.0'
         'openssl'
         'ccid'
         'libzip'
         'poppler-qt5'
         'libcurl-compat'
         'xml-security-c'
         'libcurl-gnutls'
         'openjpeg2'
         'openpace-git'
         'cjson'
         'icu')
makedepends=('swig' 'qconf' 'git' 'jdk-openjdk')
optdepends=('plugin-autenticacao-gov-pt: Necessário para autenticações online'
            'autenticacao-gov-pt-pki: PKI que confirma a validade dos certificados dos CC'
            'ecce-gov-pt-certificates: Certificados da ECCE quem assina dos certificados contidos em cartaodecidadao-pki')
conflicts=('classpath' 'cartaodecidadao' 'cartaodecidadao-bin')
replaces=('cartaodecidadao')

source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/amagovpt/autenticacao.gov/archive/refs/tags/v${pkgver}.tar.gz"
        "autenticacao-gov-pt.install"
        "gcc15-fix.patch")

sha512sums=('20686c9af55670fc3a9d865ad83d0be852d602a3a11feba1fce8d508ff11278c53327c2b905a02bf60ffe56240a4554ca719be3a5c1a4450e8d290d3a4b3b939'
            '344a0722a4554150f17f25d49d85c8a42d5e75b2444d59b1648f7c3d0817eb93eb011680f3cccf092a5eceef7c13e8048f0d09de4f07199a33c7bd1033c3de9f'
            '5a8a576520936b05fb059e93747510eb1e28d6adcb8e37b39ba6c24b8c2629a492a02b315cdfb1593877181e1bb46668faf544b3a55703f5cf3cb79276a1b56f')

install='autenticacao-gov-pt.install'

prepare(){
cat >> ${srcdir}/${_pkgname}-${pkgver}/pteid-mw-pt/_src/eidmw/eidlibJava_Wrapper/eidlibJava_Wrapper.pro <<EOF
INCLUDEPATH += /usr/lib/jvm/default/include
INCLUDEPATH += /usr/lib/jvm/default/include/linux
EOF
# work around for upstream bug (GCC-15)
cd ${srcdir}/${_pkgname}-${pkgver}
patch -p1 < ${srcdir}/gcc15-fix.patch
grep -nrl '/usr/local' | xargs -r sed -i "s|\/usr\/local|\/usr|g"
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}/pteid-mw-pt/_src/eidmw
  qmake pteid-mw.pro
  #grep -nrl '/usr/local' | xargs -r sed -i "s|\/usr\/local|\/usr|g"
  make -j${nproc}
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/pteid-mw-pt/_src/eidmw

  # Fix upstream bug not creating path
  mkdir -p ${pkgdir}/usr/local/lib/
  mkdir -p ${pkgdir}/usr/share/fonts/pteid/lato/

  # Install programs and libraries
  make INSTALL_ROOT="$pkgdir" DESTDIR=$pkgdir PREFIX=/usr install

  # Fix library path from debian to Arch Linux
  mv ${pkgdir}/usr/local/lib/ ${pkgdir}/usr/lib/


  # Install desktop files
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/pteid-mw-pt/_src/eidmw/debian/pteid-mw-gui.desktop ${pkgdir}/usr/share/applications/pteid-mw-gui.desktop

  # Install fonts
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/pteid-mw-pt/_src/eidmw/eidguiV2/fonts/lato/Lato-Black.ttf ${pkgdir}/usr/share/fonts/pteid/lato/
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/pteid-mw-pt/_src/eidmw/eidguiV2/fonts/lato/Lato-Bold.ttf ${pkgdir}/usr/share/fonts/pteid/lato/
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/pteid-mw-pt/_src/eidmw/eidguiV2/fonts/lato/Lato-Regular.ttf ${pkgdir}/usr/share/fonts/pteid/lato/

  # Cleanup
  rm -rf ${pkgdir}/usr/local/share/pteid-mw/fonts/Lato-Regular.ttf

  # Install image files
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/pteid-mw-pt/_src/eidmw/debian/pteid-signature.png ${pkgdir}/usr/share/autenticacao-gov/pteid-signature.png
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/pteid-mw-pt/_src/eidmw/debian/pteid-scalable.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/pteid-scalable.svg
}
