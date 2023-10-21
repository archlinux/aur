# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: neeshy <neeshy@tfwno.gf>

pkgname=ripme
pkgver=2.1.6
pkgrel=3
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/ripmeapp2/ripme"
license=('MIT')
depends=('java-runtime>=17')
makedepends=('java-environment>=17' 'gradle')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ripmeapp2/ripme/archive/${pkgver}.tar.gz")
sha256sums=('a0856d540b9a53a15afea6af7d609423ddb85de4e294176fd84b0f24a0e94b68')

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
  install -Dm644 "build/libs/ripme-2.1.6-1-68189f27.jar" "${pkgdir}/usr/share/java/ripme.jar"
  install -Dm755 ripme.sh "${pkgdir}/usr/bin/ripme"
}
