# Maintainer: Arthur Borsboom <arthurborsboom@gmail.com>
# Contributors: Prurigro, Keshav P R, atommix aka Aleks Lifey, Xavion, Ḷḷumex03
# Contributors: Ananda Samaddar, Dan Serban, Xavier Devlamynck, David Zaragoza, Joris Steyn

pkgname=jitsi-nightly
_pkgname=jitsi
# pkgvermajor needs manual increment
_pkgvermajor=2.9
# pkgver is determined automatically
pkgver=2.9.20170213
pkgrel=1
pkgdesc="An audio/video SIP VoIP phone and instant messenger written in Java (formerly SIP-Communicator)"
arch=('i686' 'x86_64')
url="https://jitsi.org"
license=('Apache')
provides=(jitsi)
conflicts=(jitsi jitsi-stable)
depends=('java-environment' 'bash' 'gtk2' 'libxv' 'alsa-lib' 'libxss')
makedepends=('apache-ant')
optdepends=(
  'libpulse: PulseAudio support'
)
options=(!strip !emptydirs zipman !libtool docs)
source=(
  git+https://github.com/jitsi/jitsi.git
  ${_pkgname}.desktop
  ${_pkgname}.sh
)
md5sums=(
  'SKIP'
  'f5c21e511756458172dc0ae8020c7bd5'
  '800cb34c0d15f07c7e087ad0d83a39e3'
)
install=jitsi-nightly.install

pkgver() {
  printf "${_pkgvermajor}.$(date +%Y%m%d)"
}

build() {
  cd "${srcdir}/jitsi"

  # append the build revision to the jitsi version
  sed -i "s/BUILD_ID="\"".*"\""/BUILD_ID="\"$(date +%Y%m%d)\""/" src/net/java/sip/communicator/impl/version/NightlyBuildID.java
  . /etc/profile.d/apache-ant.sh
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
}
