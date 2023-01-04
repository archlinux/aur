# Maintainer: robertfoster
# Contributor: FabioLolix

pkgname=cie-middleware-git
pkgver=1.4.4.0.r8.396140e
pkgrel=1
pkgdesc="Middleware della CIE (Carta di Identità Elettronica) per Linux (mio fork)"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://developers.italia.it/it/cie"
license=('BSD')
depends=('crypto++' 'openssl' 'pcsclite' 'java-runtime')
noextract=('libpodofo.tar.gz')
makedepends=('git' 'gradle' 'meson')
install="${pkgname%-git}.install"

source=(
  "${pkgname%-git}::git+https://github.com/M0Rf30/${pkgname%-git}-linux#branch=main"
  "libpodofo.tar.gz::https://github.com/M0Rf30/cie-middleware-linux/releases/download/podofo-1.4.2/libpodofo-1.4.2.tar.gz"
)

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/podofo.//')" 
}

prepare() {
  tar xf libpodofo.tar.gz \
    --directory="$srcdir/${pkgname%-git}/libs/lib"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  gradle -b cie-java/build.gradle standalone
  unset CXXFLAGS
  meson builddir libs
  meson configure -Dprefix=/usr builddir
  meson compile -C builddir
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  # Java Application
  install -Dm755 cie-java/build/libs/CIEID-standalone.jar \
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
  DESTDIR="${pkgdir}" meson install -C builddir
}

sha256sums=('SKIP'
            'ef81e439b12aa2ff309b353399c033bd62b027e7bd4cbf649c025226f1de5287')
