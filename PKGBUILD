# Maintainer: DeepChirp <DeepChirp@outlook.com>

pkgname=ubaa
_reponame=UBAA
pkgver=1.5.2
pkgrel=1
_javaversion=21
pkgdesc="Cross-platform Compose Multiplatform client for Beihang University campus services"
arch=('x86_64')
_author=BUAASubnet
url="https://github.com/${_author}/${_reponame}"
license=('unknown')
makedepends=("java-environment=${_javaversion}" "imagemagick")
depends=("java-runtime>=${_javaversion}" "bash")
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('b0c42e9ece7a36f624e40fd87be805bd25dff888ec5f1544dc517d7f3a03b811'
            '79ce57a57321f1844d3f43c1f779d14e6ce95c60d6eb5adbffd0df3703f400e9'
            '6f9e5fb5a184b2ca77382cc00c65fd0ca1e38cf71b72dd419aa88d4efdbf4eaa')

build() {
    cd "${srcdir}/${_reponame}-${pkgver}"

    export API_ENDPOINT="https://ubaa.mofrp.top:2021"
    ./gradlew :composeApp:packageReleaseUberJarForCurrentOS --no-daemon
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
}
