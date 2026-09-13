# Maintainer: William Varmus <0@willvar.tw>
pkgname=php-opentelemetry
pkgver=1.4.1
pkgrel=1
pkgdesc='OpenTelemetry auto-instrumentation support extension for PHP'
arch=('x86_64')
url='https://github.com/open-telemetry/opentelemetry-php-instrumentation'
license=('Apache-2.0')
depends=('php')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/open-telemetry/opentelemetry-php-instrumentation/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('13e310b776b202da09e27679813c1766697e4ac7ba7065694e1072b92c03a654')

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
