# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bitsquare-git
pkgver=0.4.8.r13.g49ef005
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('any')
url="https://bitsquare.io/"
license=('AGPL3')
depends=('java-openjfx')
makedepends=('maven' 'jdk8-openjdk')
source=("${pkgname}::git+https://github.com/bitsquare/bitsquare.git"
            "git+https://github.com/bitsquare/bitcoinj.git#branch=FixBloomFilters"
            "bitsquare.sh"
            "bitsquare.desktop")
sha256sums=('SKIP'
            'SKIP'
            '95a61502d44523c983549d6bf3deb81dc49fef490a187d28fd16e024c2d3e2aa'
            '15592a05a2a4d6cb65c757e9eec5e3818bf38e7397a3b98e7651a8a3b51f9ba9')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Use a temporary local maven repository.
  local mvn_repo="$srcdir/mvn-repository"

  cd "${srcdir}/bitcoinj"
  echo "Building bitcoinj ..."
  mvn clean install -Dmaven.repo.local="$mvn_repo" -DskipTests -Dmaven.javadoc.skip=true

  cd "${srcdir}/${pkgname}"
  echo "Building bitsquare ..."
  mvn clean package -Dmaven.repo.local="$mvn_repo" -DskipTests
}

package() {
  # Install executable.
  install -D -m755 "bitsquare.sh" "${pkgdir}/usr/bin/bitsquare"
  install -D -m644 "${srcdir}/${pkgname}/gui/target/shaded.jar" "${pkgdir}/usr/share/java/bitsquare/shaded.jar"

  # Install desktop launcher.
  install -Dm644 bitsquare.desktop "${pkgdir}/usr/share/applications/bitsquare.desktop"
  install -Dm644 "${srcdir}/${pkgname}/package/linux/icon.png" "${pkgdir}/usr/share/pixmaps/bitsquare.png"

  # Install BouncyCastleProvider
  # https://github.com/bitsquare/bitsquare/blob/master/doc/build.md#3-copy-the-bountycastle-provider-jar-file
  local mvn_repo="$srcdir/mvn-repository"
  install -Dm644 "$mvn_repo/org/bouncycastle/bcprov-jdk15on/1.53/bcprov-jdk15on-1.53.jar" \
    "${pkgdir}/usr/lib/jvm/java-8-openjdk/jre/lib/ext/bcprov-jdk15on-1.53.jar"
}
