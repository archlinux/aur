# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: neeshy <neeshy@tfwno.gf>

pkgname=ripme
pkgver=2.1.8
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/ripmeapp2/ripme"
license=('MIT')
depends=('java-runtime>=17' 'bash')
makedepends=('java-environment>=17' 'gradle')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ripmeapp2/ripme/archive/${pkgver}.tar.gz"
        "ripme-${pkgver}-gradle.patch")
sha256sums=('cae03b2c6318b1b1980042156b66be7950a4026127a314ba82fdb3832c0e4d0c'
            'd8b2a8fd3f6e40e685bd2eff771a583b06f17a6eaad789b779ab59ebccc6ce16')

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
  install -Dm644 "build/libs/ripme-2.1.8.jar" "${pkgdir}/usr/share/java/ripme.jar"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/ripme/LICENSE"
  install -Dm755 ripme.sh "${pkgdir}/usr/bin/ripme"
}
