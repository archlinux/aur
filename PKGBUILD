# Maintainer: William Varmus <0@willvar.tw>
pkgname=php-opentelemetry
pkgver=1.3.1
pkgrel=1
pkgdesc='OpenTelemetry auto-instrumentation support extension for PHP'
arch=('x86_64')
url='https://github.com/open-telemetry/opentelemetry-php-instrumentation'
license=('Apache-2.0')
depends=('php')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/open-telemetry/opentelemetry-php-instrumentation/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c0edcc02fa25ba7a12be7b079ad6228abe714cdc7d78a8bf48053a64e415a6c9')

prepare() {
  cd "${srcdir}/opentelemetry-php-instrumentation-${pkgver}/ext"
  phpize
}

build() {
  cd "${srcdir}/opentelemetry-php-instrumentation-${pkgver}/ext"
  ./configure --prefix=/usr --enable-opentelemetry
  make
}

check() {
  cd "${srcdir}/opentelemetry-php-instrumentation-${pkgver}/ext"
  TEST_PHP_ARGS="-q" make test
}

package() {
  cd "${srcdir}/opentelemetry-php-instrumentation-${pkgver}/ext"
  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 /dev/stdin "${pkgdir}/etc/php/conf.d/opentelemetry.ini" <<'EOF'
extension=opentelemetry.so
EOF
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
