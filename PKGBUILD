# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: neeshy <neeshy@tfwno.gf>

pkgname=ripme
pkgver=2.1.7
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/ripmeapp2/ripme"
license=('MIT')
depends=('java-runtime>=17' 'bash')
makedepends=('java-environment>=17' 'gradle')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ripmeapp2/ripme/archive/${pkgver}.tar.gz"
        "ripme-${pkgver}-gradle.patch")
sha256sums=('191cafb660a611cabe104c494853d27ee501b52bde204b8b38ab37a8d2340e30'
            '361495b47ab85fbfde959513435f6c1b0f0054eaf263343c8d38b6593e828e9b')

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
  install -Dm644 "build/libs/ripme-2.1.7-29-b080faae.jar" "${pkgdir}/usr/share/java/ripme.jar"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/ripme/LICENSE"
  install -Dm755 ripme.sh "${pkgdir}/usr/bin/ripme"
}
