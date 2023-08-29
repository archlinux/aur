# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: neeshy <neeshy@tfwno.gf>

pkgname=ripme
pkgver=2.1.5
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/ripmeapp2/ripme"
license=('MIT')
depends=('java-runtime>=17')
makedepends=('java-environment>=17' 'gradle')
source=("https://github.com/ripmeapp2/ripme/archive/${pkgver}.tar.gz"
        "ripme-gradle.patch")
sha256sums=('43dda7ac2615fe776b4575738d928c29d89c9bcbf6b0e870a788ab51208e8440'
            'bc905c7e218fbd14cbf24f984b30c3d552dde05a4f00d2c207ee20abfbb6fd37')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/ripme-gradle.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CURRENT_JAVA_VERSION=$(archlinux-java get | grep -P "\d+" -o)
  gradle clean build -PjavacRelease=${CURRENT_JAVA_VERSION} -x test
  cat <<EOF >ripme.sh
#!/bin/sh
exec java -jar /usr/share/java/ripme.jar "\$@"
EOF
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 "build/libs/ripme-2.1.5.jar" "${pkgdir}/usr/share/java/ripme.jar"
  install -Dm755 ripme.sh "${pkgdir}/usr/bin/ripme"
}
