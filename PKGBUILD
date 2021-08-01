# Maintainer: robertfoster
# Contributor: FabioLolix

pkgname=cie-middleware-git
pkgver=1.3.2.r3.3a3265f
pkgrel=1
pkgdesc="Middleware della CIE (Carta di Identità Elettronica) per Linux (mio fork)"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://developers.italia.it/it/cie"
license=('BSD')
depends=('crypto++' 'openssl' 'pcsclite' 'java-runtime')
makedepends=('git' 'gradle' 'meson')
install="${pkgname%-git}.install"

source=("${pkgname%-git}::git+https://github.com/M0Rf30/${pkgname%-git}-linux")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  gradle -b cie-java/build.gradle standalone
  cd libcie-pkcs11/
  meson builddir
  meson configure -Dprefix=/usr builddir
  meson compile -C builddir
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  # Java Application
  install -Dm755 cie-java/bin/libs/CIEID-standalone.jar \
    "${pkgdir}/usr/share/cieid/cieid.jar"
  install -Dm644 "data/cieid.desktop" \
    "${pkgdir}/usr/share/applications/cieid.desktop"
  install -Dm755 data/logo.png \
    "${pkgdir}/usr/share/pixmaps/cieid.png"
  install -Dm755 "data/cieid.sh" \
    "${pkgdir}/usr/bin/cieid"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/cieid/LICENSE"

  # Lib for PKCS11
  DESTDIR="${pkgdir}" meson install -C libcie-pkcs11/builddir
}

md5sums=('SKIP')
