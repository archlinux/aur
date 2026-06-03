# Maintainer: DeepChirp <deepchirp@archlinuxcn.org>

pkgname=ubaa
_reponame=UBAA
pkgver=1.7.4
pkgrel=1
_javaversion=21
pkgdesc="Cross-platform Compose Multiplatform client for Beihang University campus services"
arch=('x86_64')
url="https://github.com/BUAASubnet/${_reponame}"
license=('MIT')
makedepends=("java-environment=${_javaversion}" "imagemagick")
depends=("java-runtime>=${_javaversion}" "bash" "hicolor-icon-theme")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        "0001-build-composeApp-enable-ProGuard.patch")
sha256sums=('4c2aba70c4e030df6bd01bcae185b9f93309afb485d027835daf2171c3bee50d'
            '79ce57a57321f1844d3f43c1f779d14e6ce95c60d6eb5adbffd0df3703f400e9'
            '6f9e5fb5a184b2ca77382cc00c65fd0ca1e38cf71b72dd419aa88d4efdbf4eaa'
            'e51dff75d4452219ef8fa93bcf478f9bea29a8dc2ca05bac7ea0ec6d15b5378c')

prepare() {
    cd "${_reponame}-${pkgver}"

    # Enable ProGuard to reduce size
    patch -p1 -i "${srcdir}/0001-build-composeApp-enable-ProGuard.patch"
}


build() {
    cd "${_reponame}-${pkgver}"

    export GRADLE_USER_HOME="${srcdir}/.gradle"

    # Enforce to use the specific Java version
    local _javadirs=(/usr/lib/jvm/java-${_javaversion}-*)
    export JAVA_HOME="${_javadirs[0]}"

    ./gradlew :composeApp:packageReleaseUberJarForCurrentOS --no-daemon
}

check() {
    cd "${_reponame}-${pkgver}"

    export GRADLE_USER_HOME="${srcdir}/.gradle"

    local _javadirs=(/usr/lib/jvm/java-${_javaversion}-*)
    export JAVA_HOME="${_javadirs[0]}"

    ./gradlew :composeApp:jvmTest --no-daemon
}

package() {
    cd "${_reponame}-${pkgver}"

    install -Dm644 composeApp/build/compose/jars/${_reponame}-linux-*-${pkgver}-release.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

    for res in 16 32 48 64 128 256 512; do
        install -d "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps"
        magick "composeApp/icons/app.png" -resize "${res}x${res}" "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png"
    done

    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
