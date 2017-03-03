# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributors: Keshav P R, atommix aka Aleks Lifey, Xavion, Ananda Samaddar, Dan Serban, Xyne

pkgname=jitsi
pkgver=2.10.5550
pkgrel=3
pkgdesc="An audio/video SIP VoIP phone and instant messenger written in Java (formerly SIP-Communicator)"
arch=('i686' 'x86_64')
url="http://jitsi.org"
license=('apache')
depends=('java-runtime')
makedepends=('apache-ant' 'java-environment-common')
options=(!strip !emptydirs zipman !libtool docs)
source=("https://download.jitsi.org/jitsi/src/jitsi-src-${pkgver}.zip"
		jitsi.desktop
		jitsi.sh)
sha256sums=('cdfc6f038d1b877c42d26dba1864ac7c6b554dd55c18767a29f2db3618647287'
            '61e3bec3470790fa067f87d978016ec4452a6fd3dfba2c9afa5245b58d3cb19d'
            '798e2559c74536d947f5c793c6e74400a453623ee1d3e15aaf0f2601f0892705')

build()
{
  cd "${srcdir}/${pkgname}"
  # append the build revision to the jitsi version
  sed -i "s/0\.build\.by\.SVN/build.${pkgver}/" src/net/java/sip/communicator/impl/version/NightlyBuildID.java
  . /etc/profile.d/apache-ant.sh
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
