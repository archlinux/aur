# Maintainer: Marc Schreiber <info@schrieveslaach.de>
pkgname=sonarlint-ls
arch=('x86_64')
url=https://github.com/SonarSource/sonarlint-language-server
pkgver=2.16.0.65434
pkgrel=2
pkgdesc="SonarLint language server (used by SonarLint VSCode)"
license=('LGPLv3')
depends=('java-runtime>=11')
makedepends=('git' 'maven')
source=("https://github.com/SonarSource/sonarlint-language-server/archive/refs/tags/${pkgver}.tar.gz" 'sonarlint-ls' 'python-version.patch')
sha256sums=('4c9ea7e00b89a04634b42976110ab40fa62b7841536c2ff5338f487462ad50a4' 'b951d9b6f1e1f9f70430776d958487b385cc8290c0a48335d938b3128e1a80c4' 'de37805132570bc8f8329416cde45a8060d2257580bcf024f201aa4254188bd2')

prepare() {
   cd "${srcdir}/sonarlint-language-server-${pkgver}"
   mvn --no-transfer-progress versions:set -DprocessAllModules "-DnewVersion=${pkgver}"

   patch --forward --strip=1 --input="${srcdir}/python-version.patch"
}

build() {
   cd "${srcdir}/sonarlint-language-server-${pkgver}"
   mvn --no-transfer-progress package -DskipTests
}

check() {
   cd "${srcdir}/sonarlint-language-server-${pkgver}"
   mvn --no-transfer-progress test
}

package() {
   mkdir -p "${pkgdir}/usr/bin"
   install "${srcdir}/sonarlint-ls" "${pkgdir}/usr/bin/sonarlint-ls"
   mkdir -p "${pkgdir}/usr/share/java/sonarlint-ls"
   install "${srcdir}/sonarlint-language-server-${pkgver}/target/sonarlint-language-server-${pkgver}.jar" "${pkgdir}/usr/share/java/sonarlint-ls/sonarlint-ls.jar"

   mkdir -p "${pkgdir}/usr/share/java/sonarlint-ls/analyzers"
   install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonargo.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
   install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonarhtml.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
   install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonarjava.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
   install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonarjs.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
   install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonarphp.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
   install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonarpython.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
   install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonartext.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
   install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonarxml.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
}
