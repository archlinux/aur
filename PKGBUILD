# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=jdtls
pkgver=0.16.0
pkgrel=1
pkgdesc="Eclipse Java language server"
arch=(any)
url="https://github.com/eclipse/eclipse.jdt.ls"
license=('EPL')
depends=('java-runtime')
makedepends=('git' 'java-environment' 'maven')
# This needs to be built from the git tag as the build system expects a valid git repo:
# https://github.com/eclipse/eclipse.jdt.ls/issues/432
source=("jdtls::git+https://github.com/eclipse/eclipse.jdt.ls.git#tag=v${pkgver}"
        "launcher.sh")
md5sums=('SKIP'
         'd92f22ae00c112d65ef41fa5a578b55a')

prepare() {
    # try to remove a previously generated archive to avoid multiple matches in the timestamped tar.gz files below
    rm -rf "${srcdir}/jdtls/org.eclipse.jdt.ls.product/distro"
}

build() {
    cd "${srcdir}/jdtls"
    mvn -Pserver-distro -Dmaven.repo.local="${srcdir}/repo" clean package
}

package() {
    mkdir -p "${pkgdir}/usr/share/java/jdtls"
    tar -xzf "${srcdir}/jdtls/org.eclipse.jdt.ls.product/distro/jdt-language-server-${pkgver}-"*.tar.gz -C "${pkgdir}/usr/share/java/jdtls"
    mkdir -p "${pkgdir}/usr/bin"
    install "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/jdtls"
}
