# Maintainer: Jose Riha <jose1711 gmail com>
# Contributors: Arthur Borsboom <arthurborsboom@gmail.com>, Prurigro, Keshav P R, atommix aka Aleks Lifey, Xavion, Ḷḷumex03
# Contributors: Ananda Samaddar, Dan Serban, Xavier Devlamynck, David Zaragoza, Joris Steyn

pkgname=jitsi-nightly
_pkgname=jitsi
# pkgver is determined automatically
pkgver=2.14.r13264.gccf694380
pkgrel=1
pkgdesc="Audio/video SIP VoIP phone and instant messenger (formerly SIP-Communicator)"
arch=('x86_64')
url="https://github.com/jitsi/jitsi"
license=('Apache-2.0')
provides=(jitsi)
conflicts=(jitsi jitsi-stable)
depends=('java-runtime>=11' 'bash' 'glibc' 'libstdc++' 'archlinux-java-run' 'gtk2' 'dbus' 'libx11' 'libxext' 'libxss' 'libxtst' 'libxv' 'libsm' 'libice' 'alsa-lib')
makedepends=('git' 'maven' 'cmake' 'java-environment>=11')
optdepends=(
  'libpulse: PulseAudio support'
)
source=(
  git+https://github.com/jitsi/jitsi.git
  ${_pkgname}.desktop
  ${_pkgname}.sh
)
md5sums=('SKIP'
         '27e2bff81511b120c4b5924d188fe6a9'
         'aa8fbd429afeca25100e91f155083a96')
install=jitsi-nightly.install

pkgver() {
  cd "${srcdir}/jitsi"
  printf "%s.r%s.g%s" \
    "$(sed -n 's:.*<revision>\([0-9.]*\).*</revision>.*:\1:p' pom.xml)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/jitsi"

  mvn -B -Dmaven.repo.local="${srcdir}/m2" package -DskipTests

  cmake -S native -B cmake-build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="${srcdir}/jitsi/native-install"
  cmake --build cmake-build --target install
}

package() {
  cd "${srcdir}/jitsi"

  install -dm755 "${pkgdir}/usr/share/jitsi/lib"
  find target/bundles -maxdepth 1 -name '*.jar' ! -name '*.pom' \
    -exec install -m644 -t "${pkgdir}/usr/share/jitsi/lib/" {} +
  cp -r --no-preserve=ownership resources/install/src/main/dist/. "${pkgdir}/usr/share/jitsi/"

  install -Dm755 -t "${pkgdir}/usr/lib/jitsi/" native-install/*.so

  install -Dm755 "${srcdir}/jitsi.sh" "${pkgdir}/usr/bin/jitsi"
  install -Dm644 "${srcdir}/jitsi.desktop" "${pkgdir}/usr/share/applications/jitsi.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps/" resources/install/debian/jitsi{.svg,-16.xpm,-32.xpm}
  install -Dm644 resources/install/debian/jitsi.1 "${pkgdir}/usr/share/man/man1/jitsi.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
