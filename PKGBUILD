# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributors: Keshav P R, atommix aka Aleks Lifey, Xavion, Ananda Samaddar, Dan Serban, Xyne, Joan Figueras

pkgname=jitsi
pkgver=2.10.5550
pkgrel=10
pkgdesc="An audio/video SIP VoIP phone and instant messenger written in Java (formerly SIP-Communicator)"
arch=('x86_64')
url="http://jitsi.org"
license=('Apache')
depends=('java-runtime=8')
makedepends=('apache-ant' 'java-environment=8')
options=(!strip !emptydirs zipman !libtool docs)
source=("https://download.jitsi.org/jitsi/src/jitsi-src-${pkgver}.zip"
		jitsi.desktop
		jitsi.sh)
sha256sums=('cdfc6f038d1b877c42d26dba1864ac7c6b554dd55c18767a29f2db3618647287'
            '50f3314b2a66e797f76171bcf9fb59e4436d9baf63dfd945b184fc4109ed27d9'
            '8e69f001f0aebcfcdb216b344b8adc4c228c0af42e940bf4ca709cbe01dbc0c5')

build()
{
  cd "${srcdir}/${pkgname}"
  # append the build revision to the jitsi version
  sed -i "s/0\.build\.by\.SVN/build.${pkgver}/" src/net/java/sip/communicator/impl/version/NightlyBuildID.java
  ant rebuild
}

package() {
  cd "${srcdir}/${pkgname}"
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
