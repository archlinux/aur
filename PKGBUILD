# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
pkgname="modsman"
pkgver="0.32.1"
pkgrel=2
commithash="6add8e25be26080164cd4f84ce5338b8d98e4e4e"
shorthash="g6add8e2"
arch=('x86_64')
pkgdesc="Minecraft mod manager and updater for the CLI"
url='https://github.com/sargunv/modsman'
license=('GPL3')
makedepends=('gendesk' 'unzip' 'git')
depends=('java-runtime=8')
conflicts=('modsman-git' 'modsman-bin')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

prepare() {
    #Rebase project to proper commit
    #because the project cannot be built dirty
    cd "${srcdir}/${pkgname}"
    git reset --hard ${commithash}

    # Create Startup Script
    cat > "${pkgname}" <<-EOT
#!/bin/sh
cd /opt/modsman/bin
./modsman-cli
EOT
}

build() {
    cd "${srcdir}/${pkgname}"
    ./gradlew :${pkgname}-cli:distZip --info --stacktrace
}

package() {

    # Unzip Compiled project
    cd "${srcdir}/${pkgname}/${pkgname}-cli/build/distributions"
    unzip -o ${pkgname}-cli-${pkgver}-1-${shorthash}.dirty.zip
    rm -rf "${pkgname}/"
    cp -r "${pkgname}-cli-${pkgver}-1-${shorthash}.dirty/" "${pkgname}/"
    rm -f "modsman/bin/${pkgname}-cli.bat"

    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/${pkgname}/modsman-cli/build/distributions/modsman" "${pkgdir}/opt/"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"opt -type d -exec chmod 755 {} \;
    find "${pkgdir}/"opt -type f -exec chmod 644 {} \;

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    cp -Rr "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/usr/bin/${pkgname}"
    chmod +x "${pkgdir}/opt/${pkgname}/bin/${pkgname}-cli"
}
