# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=ucanaccess
pkgver=5.0.1
pkgrel=1
pkgdesc="Java JDBC driver implementation that allows to read/write Microsoft Access databases"
arch=(any)
url="https://ucanaccess.sourceforge.net/site.html"
license=(Apache)
depends=('java-runtime=8')
makedepends=(java-environment=8 maven)
checkdepends=(maven)
source=("$pkgname-$pkgver.zip::https://sourceforge.net/projects/ucanaccess/files/UCanAccess-${pkgver}-src.zip/download"
        ucanaccess)
# MD5 & SHA1 are from official website.
md5sums=(eb626eed4140706be4118375d2fb5456
         SKIP)
sha1sums=(c7dc634372efb6fd6dc2a9abb75977b5b0d77812
          SKIP)

prepare() {
    cd "UCanAccess-${pkgver}-src"

    mvn --batch-mode \
      -Dproject.build.outputTimestamp="$SOURCE_DATE_EPOCH" \
      validate
}

build() {
    cd "UCanAccess-${pkgver}-src"

    mvn --batch-mode \
      -DskipTests \
      -Dproject.build.outputTimestamp="$SOURCE_DATE_EPOCH" \
      package dependency:copy-dependencies
}

check() {
    cd "UCanAccess-${pkgver}-src"

    mvn --batch-mode \
      -Dproject.build.outputTimestamp="$SOURCE_DATE_EPOCH" \
      test
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" ucanaccess

    cd "UCanAccess-${pkgver}-src"

    install -Dm644 -t "${pkgdir}/usr/share/java/${pkgname}" \
        "target/${pkgname}-${pkgver}.jar"
    install -Dm644 -t "${pkgdir}/usr/share/java/${pkgname}" \
        "target/dependency/"commons-lang3-*.jar \
        "target/dependency/"commons-logging-*.jar \
        "target/dependency/"hsqldb-*.jar \
        "target/dependency/"jackcess-*.jar
}
