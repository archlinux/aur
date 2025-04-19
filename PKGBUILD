# Maintainer: Schrottfresse <schrottfresse@gmx.de>

pkgname="necesse-server"
_build=18110069
pkgver="0.32.1"
_pkgver_minus="$(echo ${pkgver} | sed 's/\./-/g')"
_zipname="${pkgname}-linux64-${_pkgver_minus}-${_build}.zip"
_dirname="${pkgname}-${_pkgver_minus}-${_build}"
pkgrel=2
arch=('x86_64')
url="https://necessegame.com/server/"
license=('proprietary')
depends=("java-runtime=17")
source=("https://necessegame.com/content/server/${_pkgver_minus}-${_build}/${_zipname}"
        "${pkgname}.service")
sha256sums=('1cb7622a3d4d6af7ee4e4b87130310793a1124c4a0eee9cf25a538e59c5ae593'
            '3d32c112c80584c55eccfdafe5510f6fe57b0ce57ce03ca30b4d3e2674f2c7ce')

build() {
    cd "${_dirname}"
    # delete bundled openjre17
    rm -rf ./jre
    # delete unused windows and macos libs
    find lib -regextype egrep -iregex ".*-natives-(windows|macos).*.jar" -delete
}

package() {
    # Copy systemd service file
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" "${pkgname}.service"
    # Create dir for save files
    install -dm755 "${pkgdir}/var/lib/${pkgname}"

    cd "${_dirname}"
    # Copy server jar
    install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/" "Server.jar"
    # Copy libs
    install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/lib/" lib/*.jar
    # Copy lang files
    install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/locale/" locale/*.lang
}
