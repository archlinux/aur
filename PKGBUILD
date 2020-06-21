# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributors: Keshav P R, atommix aka Aleks Lifey, Xavion, Ananda Samaddar, Dan Serban, Xyne, Joan Figueras

pkgname=jitsi
pkgver=2.10.5550
_pkgver=2.10
pkgrel=12
pkgdesc="An audio/video SIP VoIP phone and instant messenger written in Java (formerly SIP-Communicator)"
arch=('x86_64')
url="https://desktop.jitsi.org/Main/HomePage"
license=('Apache')
depends=('java-runtime=8')
makedepends=('apache-ant' 'java-environment=8')
options=(!strip !emptydirs zipman !libtool docs)
source=("https://github.com/jitsi/jitsi/archive/Jitsi-${_pkgver}.tar.gz"
		jitsi.desktop
		jitsi.sh)
sha256sums=('13a079ddfe30cb94c33fa41f89623f174cda1b7896857b3feed68091a6834af1'
            '3f872512a3dda3f43e05cf2f318a8c6333121680c44cbe559cb0ca3bab400a3a'
            '8e69f001f0aebcfcdb216b344b8adc4c228c0af42e940bf4ca709cbe01dbc0c5')

build()
{
  cd "${pkgname}-${pkgname^}-${_pkgver}"
  # append the build revision to the jitsi version
  sed -i "s/0\.build\.by\.SVN/build.${pkgver}/" src/net/java/sip/communicator/impl/version/NightlyBuildID.java
  ant rebuild
}

package() {
  cd "${pkgname}-${pkgname^}-${_pkgver}"
  find lib/ lib/bundle/ -maxdepth 1 -type f -exec install -Dm644 {} "${pkgdir}/usr/lib/${pkgname}/"{} \;
#  find lib/os-specific/linux/ -maxdepth 1 -type f -execdir install -Dm644 {} "${pkgdir}/usr/lib/${pkgname}/lib/"{} \;
  shopt -sq extglob
  find lib/native/linux$(sed 's/_/-/g' <<<${CARCH/#*(i?86|x86)/})/ -maxdepth 1 -type f -execdir install -Dm644 {} "${pkgdir}/usr/lib/${pkgname}/lib/native/"{} \;
  find sc-bundles/{,os-specific/linux/} -maxdepth 1 -type f -execdir install -Dm644 {} "${pkgdir}/usr/lib/${pkgname}/sc-bundles/"{} \;
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "resources/install/debian/"
  for _file in *.{svg,xpm}; do
    install -Dm644 "$_file" "${pkgdir}/usr/share/pixmaps/${_file}"
  done
}
