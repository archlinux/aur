# Maintainer: bastidest <bastidest at mailbox dot org>

pkgname=email-to-pdf-converter
pkgver=2.5.3
pkgrel=1
pkgdesc="Converts email files (eml, msg) to pdf"
arch=('any')
url="https://github.com/nickrussler/${pkgname}"
license=('APACHE')
depends=('jre-openjdk' 'wkhtmltopdf')
makedepends=('gradle')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "java-version-and-build-version.patch")
sha256sums=('bc4eb5a77bff392c70c8e3b1395c300e9d5b5b6ac8ea2f1d8474a58b23fef0ae'
            '5c007032df5b81eaa10ebbef8f3011031ea983c97575783a318640fc8a4b35bc')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/java-version-and-build-version.patch" build.gradle
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  BUILD_VERSION="${pkgver}" gradle shadowJar
}

package() {
  install -Dm644 "${pkgname}-${pkgver}/build/libs/emailconverter-${pkgver}-all.jar" "$pkgdir/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm755\
    <(echo -e "#/bin/sh\nexec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}.jar' \"\$@\"")\
    "${pkgdir}/usr/bin/${pkgname}"
}
