# Maintainer: bastidest <bastidest at mailbox dot org>

pkgname=email-to-pdf-converter
pkgver=3.0.0
pkgrel=2
pkgdesc="Converts email files (eml, msg) to pdf"
arch=('any')
url="https://github.com/nickrussler/${pkgname}"
license=('Apache-2.0')
depends=('java-runtime<=21' 'wkhtmltopdf')
makedepends=('java-environment<=21' 'gradle')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "java-version-and-build-version.patch")
sha256sums=('069669977dcea15d78eafd5bef075a63d2f8d1f4de128373cda83eacfe12f16d'
            'd5e15425d9c6f8b0f403fc4353500cf6a9da3ccfd3188924689bea63772649c8')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/java-version-and-build-version.patch" build.gradle
}

_get_matching_java_version() {
  local max_version="$1"
  cat <(archlinux-java get) <(archlinux-java status | grep -oe 'java-[0-9]*-[a-z]*' | sort -Vr) | awk -F- '{if($2+0<='"${max_version}"'){print $0;exit 0}}'
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  JAVA_HOME="/usr/lib/jvm/$(_get_matching_java_version 21)" BUILD_VERSION="${pkgver}" gradle shadowJar
}

package() {
  install -Dm644 "${pkgname}-${pkgver}/build/libs/emailconverter-${pkgver}-all.jar" "$pkgdir/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm755\
    <(echo -e "#/bin/sh\nexec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}.jar' \"\$@\"")\
    "${pkgdir}/usr/bin/${pkgname}"
}
