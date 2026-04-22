# Maintainer: DeepChirp <deepchirp@archlinuxcn.org>

pkgname=ubaa
_reponame=UBAA
pkgver=1.6.0
pkgrel=1
_javaversion=21
pkgdesc="Cross-platform Compose Multiplatform client for Beihang University campus services"
arch=('x86_64')
_author=BUAASubnet
url="https://github.com/${_author}/${_reponame}"
license=('MIT')
makedepends=("java-environment=${_javaversion}" "imagemagick")
depends=("java-runtime>=${_javaversion}" "bash" "hicolor-icon-theme")
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('8d53537a101c2a18d11e005266bfb291d4ca65e12aa63ed6075ccbf2708cc495'
            '79ce57a57321f1844d3f43c1f779d14e6ce95c60d6eb5adbffd0df3703f400e9'
            '6f9e5fb5a184b2ca77382cc00c65fd0ca1e38cf71b72dd419aa88d4efdbf4eaa')

build() {
    cd "${srcdir}/${_reponame}-${pkgver}"

    export GRADLE_USER_HOME="${srcdir}/.gradle"
    export API_ENDPOINT="https://ubaa.mofrp.top:2021"

    ./gradlew :composeApp:packageReleaseUberJarForCurrentOS --no-daemon
}

check() {
    cd "${srcdir}/${_reponame}-${pkgver}"

    export GRADLE_USER_HOME="${srcdir}/.gradle"
    export API_ENDPOINT="https://ubaa.mofrp.top:2021"

    ./gradlew :composeApp:jvmTest --no-daemon
}

package() {
    cd "${srcdir}/${_reponame}-${pkgver}"

    install -Dm644 composeApp/build/compose/jars/${_reponame}-linux-*-${pkgver}-release.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    for res in 16 32 48 64 128 256 512; do
        install -d "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps"
        magick "composeApp/icons/app.png" -resize "${res}x${res}" "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png"
    done

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
