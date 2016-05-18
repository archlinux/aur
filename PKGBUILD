# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bitsquare
pkgver=0.4.6
pkgrel=1
pkgdesc="Bitsquare is a cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('x86_64')
url="https://bitsquare.io/"
license=('AGPL3')
depends=('bash' 'java-openjfx')
makedepends=('maven')
source=("${pkgname}::git+https://github.com/bitsquare/bitsquare.git#tag=v${pkgver}"
            "git+https://github.com/bitsquare/bitcoinj.git#branch=FixBloomFilters"
            "bitsquare.sh"
            "bitsquare.desktop")
sha256sums=('SKIP'
            'SKIP'
            'b2e5e85f842f0bc9910087d62f78f5fd9fc1b6232849b59e785acbec5d8955cf'
            '15592a05a2a4d6cb65c757e9eec5e3818bf38e7397a3b98e7651a8a3b51f9ba9')

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
}
