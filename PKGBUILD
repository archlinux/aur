# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgbase=thunder-network-git
pkgname=('thunder-wallet-git' 'thunder-node-git')
pkgver=0.1.2.alpha.r25.g8641da6
pkgrel=1
pkgdesc="Wallet / Node implementation of the lightning.network P2P protocol"
arch=('any')
url="https://www.blockchain.com/thunder/index.html"
license=('AGPL3')
depends=('java-environment-openjdk=8' 'bash')
makedepends=('maven')
source=("${pkgbase}::git+https://github.com/blockchain/thunder.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Use a temporary local maven repository.
  local mvn_repo="$srcdir/mvn-repository"

  # See build.sh from git repository

  cd "${srcdir}/${pkgbase}"
  mvn clean install -Dmaven.repo.local="$mvn_repo" -DskipTests

  msg "Building thunder-core ..."
  cd "${srcdir}/${pkgbase}/thunder-core"
  mvn clean compile assembly:single -Dmaven.repo.local="$mvn_repo" -DskipTests

  msg "Building thunder-cliengui ..."
  cd "${srcdir}/${pkgbase}/thunder-clientgui"
  mvn clean compile package -Dmaven.repo.local="$mvn_repo" -DskipTests

  msg "Building shell executables ..."
  cd "${srcdir}"
  echo -e "#!/bin/sh\njava -jar /usr/share/java/thunder-network/thunder-clientgui.jar" > \
    thunder-wallet.sh
  chmod +x thunder-wallet.sh
  echo -e "#!/bin/sh\njava -jar /usr/share/java/thunder-network/thunder-node.jar" > \
    thunder-node.sh
  chmod +x thunder-node.sh
}

check() {
  # Use a temporary local maven repository.
  local mvn_repo="$srcdir/mvn-repository"

  cd "${srcdir}/${pkgbase}"
  mvn test -Dmaven.repo.local="$mvn_repo"

  msg "Testing thunder-core ..."
  cd "${srcdir}/${pkgbase}/thunder-core"
  mvn test -Dmaven.repo.local="$mvn_repo"
}

package_thunder-wallet-git() {
  install -D -m644 "${srcdir}/${pkgbase}/thunder-clientgui/target/thunder-clientgui-0.1.jar" \
    "${pkgdir}/usr/share/java/thunder-network/thunder-clientgui.jar"
  install -D -m755 "${srcdir}/thunder-wallet.sh" "${pkgdir}/usr/bin/thunder-wallet"
}

package_thunder-node-git() {
  install -D -m644 "${srcdir}/${pkgbase}/thunder-core/target/thunder-core-0.1-jar-with-dependencies.jar" \
    "${pkgdir}/usr/share/java/thunder-network/thunder-node.jar"
  install -D -m755 "${srcdir}/thunder-node.sh" "${pkgdir}/usr/bin/thunder-node"
}

