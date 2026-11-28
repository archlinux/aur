# Maintainer: thegala <thegala at disroot.org>

_pkgname=freerouting
pkgname=${_pkgname}-git
pkgver=2.6.0.r2.g779e271
pkgrel=1
epoch=1
pkgdesc="Advanced PCB autorouter"
arch=('any')
url="https://github.com/freerouting/freerouting"
license=('GPL-3.0-only')
depends=('java-runtime>=25')
makedepends=('git' 'jdk25-openjdk')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/freerouting/freerouting.git"
        'freeroute')
sha256sums=('SKIP'
            '22e00f2ca4d35b504474cf096a9f7fc5f8d5d45136b1914adea9145eabe0b440')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    export JAVA_HOME=/usr/lib/jvm/java-25-openjdk
    export GRADLE_USER_HOME="${srcdir}/.gradle"
    ./gradlew --no-daemon executableJar
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm644 "build/libs/freerouting-current-executable.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
    install -Dm755 "${srcdir}/freeroute" "${pkgdir}/usr/bin/${_pkgname}"
    ln -s "${_pkgname}" "${pkgdir}/usr/bin/freeroute"
    # Allows KiCad to detect freerouting
    ln -s "/usr/share/java/${_pkgname}/${_pkgname}.jar" "${pkgdir}/usr/bin/freeroute.jar"
}
