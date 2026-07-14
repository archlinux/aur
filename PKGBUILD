# Maintainer: William Varmus <0@willvar.tw>
_extname=xlswriter
pkgname=php-${_extname}
pkgver=3.0.0
pkgrel=1
pkgdesc='Efficient and fast PHP C extension for creating and reading XLSX (Excel 2007+) files'
arch=('x86_64')
url='https://github.com/viest/php-ext-xlswriter'
license=('BSD-2-Clause')
depends=('php' 'zlib')
source=("${pkgname}-${pkgver}.tgz::https://pecl.php.net/get/${_extname}-${pkgver}.tgz")
sha256sums=('a17986ad5ac09529513fc59b2871ca2b53eaec1c2c55cf00be60a292e85ade73')

prepare() {
  cd "${srcdir}/${_extname}-${pkgver}"
  phpize
}

build() {
  cd "${srcdir}/${_extname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${_extname}-${pkgver}"
  TEST_PHP_ARGS="-q" make test
}

package() {
  cd "${srcdir}/${_extname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 /dev/stdin "${pkgdir}/etc/php/conf.d/${_extname}.ini" <<'EOF'
extension=xlswriter.so
EOF
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
