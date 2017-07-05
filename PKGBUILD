# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bisq
pkgver=0.5.1
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('any')
url="https://bitsquare.io/"
license=('AGPL3')
depends=('java-openjfx')
makedepends=('maven' 'jdk8-openjdk' 'protobuf')
source=("${pkgname}::git+https://github.com/bitsquare/bitsquare.git#tag=v${pkgver}"
        "git+https://github.com/bitsquare/bitcoinj.git#commit=c7aee7e0d91ca3d84281156ee2b2b9fddc3a8d56"
        "git+https://github.com/bitsquare/libdohj.git#commit=b88940e29cbae01619fbd091df92935b326d94e7"
        "git+https://github.com/bitsquare/btcd-cli4j.git#commit=9d7ff85ab450b96c890e569dc9b584eae7bf13ad"
        "bisq.sh"
        "bisq.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '175e18841dd216ca84391a89b0fba0b12bf575ec095d200ae9a3babc83693e31'
            '2f9da2f32bb7d023af78bcbf688bc8dc01f24e1d6c7e3227928e22338343587c')

prepare() {
  msg 'Fixing protoc path...'
  sed -i 's#/usr/local/bin/protoc#/usr/bin/protoc#g' "$pkgname/common/pom.xml"
}

build() {
  # Use a temporary local maven repository.
  local mvn_repo="$srcdir/mvn-repository"

  cd "${srcdir}/bitcoinj" || exit
  msg2 "Building bitcoinj ..."
  mvn clean install -Dmaven.repo.local="$mvn_repo" -DskipTests -Dmaven.javadoc.skip=true

  cd "${srcdir}/libdohj" || exit
  msg2 "Building libdohj..."
  mvn clean install -Dmaven.repo.local="$mvn_repo" -DskipTests -Dmaven.javadoc.skip=true

  cd "${srcdir}/btcd-cli4j" || exit
  msg2 "Building btcd-cli4j..."
  mvn clean install -Dmaven.repo.local="$mvn_repo" -DskipTests -Dmaven.javadoc.skip=true

  cd "${srcdir}/${pkgname}" || exit
  msg2 "Building bisq..."
  mvn clean package -Dmaven.repo.local="$mvn_repo" -DskipTests

}

package() {
  # Install executable.
  install -D -m755 "bisq.sh" "${pkgdir}/usr/bin/bisq"
  install -D -m644 "${srcdir}/${pkgname}/gui/target/shaded.jar" "${pkgdir}/usr/share/java/bisq/shaded.jar"

  # Install desktop launcher.
  install -Dm644 bisq.desktop "${pkgdir}/usr/share/applications/bisq.desktop"
  install -Dm644 "${srcdir}/${pkgname}/package/linux/icon.png" "${pkgdir}/usr/share/pixmaps/bisq.png"

  # Install BouncyCastleProvider
  # https://github.com/bitsquare/bitsquare/blob/master/doc/build.md#3-copy-the-bountycastle-provider-jar-file
  local mvn_repo="$srcdir/mvn-repository"
  install -Dm644 "$mvn_repo/org/bouncycastle/bcprov-jdk15on/1.56/bcprov-jdk15on-1.56.jar" \
    "${pkgdir}/usr/lib/jvm/java-8-openjdk/jre/lib/ext/bcprov-jdk15on-1.56.jar"
}
