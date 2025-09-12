# Maintainer: robertfoster
# Contributor: FabioLolix

pkgname=cie-middleware-git
pkgver=1.5.9.r17.4e6b712
pkgrel=1
pkgdesc="Middleware della CIE (Carta di Identità Elettronica) per Linux (mio fork)"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://developers.italia.it/it/cie"
license=('BSD')
depends=('crypto++' 'java-runtime>=17' 'libnotify' 'openssl' 'pcsclite' 'podofo')
makedepends=('git' 'gradle' 'java-environment>=17' 'meson')
install="${pkgname%-git}.install"

source=("${pkgname%-git}::git+https://github.com/M0Rf30/${pkgname%-git}-linux")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  gradle -p cie-java standalone
  unset CXXFLAGS
  meson setup builddir libs
  meson configure -Dprefix=/usr builddir
  meson compile -C builddir
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  # Java Application
  install -Dm755 cie-java/build/libs/CIEID-standalone.jar \
    "${pkgdir}/usr/share/cieid/cieid.jar"
  install -Dm644 data/app.m0rf30.cieid.desktop \
    "${pkgdir}/usr/share/applications/app.m0rf30.cieid.desktop"
  install -Dm755 data/app.m0rf30.cieid.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/app.m0rf30.cieid.svg"
  install -Dm644 data/app.m0rf30.cieid.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/app.m0rf30.cieid.metainfo.xml"
  install -Dm644 data/libcie-pkcs11.module \
    "${pkgdir}/usr/share/p11-kit/modules/libcie-pkcs11.module"
  mkdir -p "${pkgdir}/usr/lib/pkcs11"
  ln -s /usr/lib/libcie-pkcs11.so \
    "${pkgdir}/usr/lib/pkcs11/libcie-pkcs11.so"
  install -Dm755 data/cieid.sh \
    "${pkgdir}/usr/bin/cieid"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/cieid/LICENSE"

  # Lib for PKCS11
  DESTDIR="${pkgdir}" meson install -C builddir
}

sha256sums=('SKIP')
