# Maintainer: Jose Riha <jose1711 gmail com>
# Contributors: Arthur Borsboom <arthurborsboom@gmail.com>, Prurigro, Keshav P R, atommix aka Aleks Lifey, Xavion, Ḷḷumex03
# Contributors: Ananda Samaddar, Dan Serban, Xavier Devlamynck, David Zaragoza, Joris Steyn

pkgname=jitsi-nightly
_pkgname=jitsi
# pkgvermajor needs manual increment
_pkgvermajor=2.11
# pkgver is determined automatically
pkgver=2.11.20210926
pkgrel=2
pkgdesc="Audio/video SIP VoIP phone and instant messenger (formerly SIP-Communicator)"
arch=('i686' 'x86_64')
url="https://jitsi.org"
license=('Apache')
provides=(jitsi)
conflicts=(jitsi jitsi-stable)
depends=('java-environment=8' 'bash' 'gtk2' 'libxv' 'alsa-lib' 'libxss' 'ffmpeg' 'archlinux-java-run')
makedepends=('ant')
optdepends=(
  'libpulse: PulseAudio support'
)
options=(!strip !emptydirs zipman !libtool docs)
source=(
  git+https://github.com/jitsi/jitsi.git
  ${_pkgname}.desktop
  ${_pkgname}.sh
  MANIFEST.MF
)
md5sums=('SKIP'
         'f5c21e511756458172dc0ae8020c7bd5'
         '345b5ab9e26038952eef90ce18b78002'
         '92f6b21cdfa361c430cb837956967b20')
install=jitsi-nightly.install

pkgver() {
  printf "${_pkgvermajor}.$(date +%Y%m%d)"
}

build() {
  cd "${srcdir}/jitsi"

  # append the build revision to the jitsi version
  sed -i "s/BUILD_ID="\"".*"\""/BUILD_ID="\"$(date +%Y%m%d)\""/" src/net/java/sip/communicator/impl/version/NightlyBuildID.java

  export PATH=/usr/lib/jvm/java-8-openjdk/bin/:$PATH
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

  ant rebuild
}

package() {
  cd "${srcdir}/jitsi"
  find lib/ lib/bundle/ -maxdepth 1 -type f -exec install -Dm644 {} "${pkgdir}/usr/lib/jitsi/"{} \;
  shopt -sq extglob
  find lib/native/linux$(sed 's/_/-/g' <<<${CARCH/#*(i?86|x86)/})/ -maxdepth 1 -type f -execdir install -Dm644 {} "${pkgdir}/usr/lib/jitsi/lib/native/"{} \;
  find sc-bundles/{,os-specific/linux/} -maxdepth 1 -type f -execdir install -Dm644 {} "${pkgdir}/usr/lib/jitsi/sc-bundles/"{} \;
  install -Dm755 "$srcdir/jitsi.sh" "${pkgdir}/usr/bin/jitsi"
  install -Dm644 "$srcdir/jitsi.desktop" "${pkgdir}/usr/share/applications/jitsi.desktop"
  local _file
  for _file in resources/install/debian/*.{svg,xpm}; do
      install -Dm644 "$_file" "${pkgdir}/usr/share/pixmaps/jitsi${_file/*sip-communicator/}"
  done

  # manual update of manifest.
  cd "${srcdir}"
  jar uvfm "${pkgdir}/usr/lib/jitsi/sc-bundles/libjitsi.jar" MANIFEST.MF
}
