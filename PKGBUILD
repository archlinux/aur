# Maintainer: John K. Luebs <jkl@johnluebs com>
# Contributor: Simon Gomizelj <https://github.com/vodik>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>
# Contributor: Douglas Meyer <Douglas.Meyer@mail.com>
# Contributor: Tom Vincent <http://tlvince.com/contact>
# Contributor: Alexander <iam.asm89@gmail.com>

pkgname=hipchat
pkgver=4.30.0.1663
pkgrel=2
pkgdesc="Persistent group chat using XMPP"
arch=('x86_64')
url="https://www.hipchat.com/linux"
license=('custom')
depends=('fontconfig' 'libgl' 'libltdl' 'libxslt' 'hicolor-icon-theme'
         'libxcomposite' 'libxcursor' 'libxkbcommon' 'libxrandr' 'libxslt' 'libxss'
         'libpulse' 'xcb-util-keysyms' 'nss' 'openssl-1.0')
source=("https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client/pool/HipChat4-${pkgver}-Linux.deb"
  "license.html"
  "fix-seccomp-sandbox-bug.patch")
sha1sums=('680cbb1767a7eb7d40796c908558a354de811536'
          'd57436db297ab4313a5964bba05060e2c7e93e70'
          '66370d1efecc99a6c69b66109136b044d3f17399')

prepare() {
  cd "${srcdir}"
  mkdir "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  tar xzf "${srcdir}"/data.tar.gz
  patch -p1 -i "${srcdir}/fix-seccomp-sandbox-bug.patch"
}

package() {
  install -D -m644 "${srcdir}/license.html" \
          "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
  cp -R "${srcdir}/${pkgname}-${pkgver}"/{opt,usr} "${pkgdir}"
  mkdir -p "${pkgdir}/usr/bin"
  ln -nsf "/opt/HipChat4/bin/HipChat4" "${pkgdir}/usr/bin/hipchat4"

  ln -nsf "/usr/lib/libssl.so.1.0.0" "${pkgdir}/opt/HipChat4/lib/"
  ln -nsf libssl.so.1.0.0 "${pkgdir}/opt/HipChat4/lib/libssl.so"
  ln -nsf "/usr/lib/libcrypto.so.1.0.0" "${pkgdir}/opt/HipChat4/lib/"
  ln -nsf libcrypto.so.1.0.0 "${pkgdir}/opt/HipChat4/lib/libcrypto.so"
}
