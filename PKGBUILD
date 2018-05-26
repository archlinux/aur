# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: John K. Luebs <jkl@johnluebs com>
# Contributor: Simon Gomizelj <https://github.com/vodik>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Douglas Meyer <Douglas.Meyer@mail.com>
# Contributor: Tom Vincent <http://tlvince.com/contact>
# Contributor: Alexander <iam.asm89@gmail.com>

pkgname=hipchat
pkgver=4.30.4.1672
pkgrel=1
pkgdesc='Persistent group chat using XMPP'
arch=('x86_64')
url='https://www.hipchat.com/linux'
license=('custom')
depends=('fontconfig' 'libgl' 'libltdl' 'libxslt' 'hicolor-icon-theme'
         'libxcomposite' 'libxcursor' 'libxkbcommon' 'libxrandr' 'libxslt' 'libxss'
         'libpulse' 'xcb-util-keysyms' 'nss' 'openssl-1.0')
source=(https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client/pool/HipChat4-${pkgver}-Linux.deb
        license.html
        fix-seccomp-sandbox-bug.patch)
sha512sums=('07e84c45a5ca550aa524e0a833763fec6b8313b0f2fb431a08beff824d60f52ebc3bebb02f795504de2398d225d45691b700d38bcda3b85f8a4604430d164b80'
            '7e7d712a01edcb91fcd3759d77620ae53c5f24e6fc0ec311bec7eebf5736d643945c2600c9198261e47d0349ef358a6d673a446e15c7599c31b548c93f464f7d'
            '6f7affb6cf85a16452bd934c8ebb996d5f98bc82100d1a4b7c308438ff4dd90c36552ec533de803264201fdfbf7e127cb8ecbfce92f24f205fcf762576a8b51f')

prepare() {
  cd "${srcdir}"
  mkdir "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  tar xzf "${srcdir}"/data.tar.gz
  patch -p1 -i "${srcdir}/fix-seccomp-sandbox-bug.patch"
}

package() {
  install -D -m644 "${srcdir}/license.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
  cp -R "${srcdir}/${pkgname}-${pkgver}/"{opt,usr} "${pkgdir}"
  mkdir -p "${pkgdir}/usr/bin"
  ln -nsf /opt/HipChat4/bin/HipChat4 "${pkgdir}/usr/bin/hipchat4"

  ln -nsf /usr/lib/libssl.so.1.0.0 "${pkgdir}/opt/HipChat4/lib/"
  ln -nsf libssl.so.1.0.0 "${pkgdir}/opt/HipChat4/lib/libssl.so"
  ln -nsf /usr/lib/libcrypto.so.1.0.0 "${pkgdir}/opt/HipChat4/lib/"
  ln -nsf libcrypto.so.1.0.0 "${pkgdir}/opt/HipChat4/lib/libcrypto.so"
}
