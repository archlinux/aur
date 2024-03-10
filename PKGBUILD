# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: neeshy <neeshy@tfwno.gf>

pkgname=ripme
pkgver=2.1.9
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/ripmeapp2/ripme"
license=('MIT')
depends=('java-runtime>=17' 'bash')
makedepends=('java-environment>=17' 'gradle')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ripmeapp2/ripme/archive/${pkgver}.tar.gz"
        "ripme-${pkgver}-gradle.patch")
sha256sums=('0f47b41130e30440fb616e46da92239459f587ac5a24516be24490760a755150'
            'c0860740059b15196d7ad8239014b51f5e979fcae714376c32aba36b6eda07e6')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/ripme-${pkgver}-gradle.patch"
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
  install -Dm644 "build/libs/ripme-${pkgver}.jar" "${pkgdir}/usr/share/java/ripme.jar"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/ripme/LICENSE"
  install -Dm755 ripme.sh "${pkgdir}/usr/bin/ripme"
}
