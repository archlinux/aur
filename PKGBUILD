# Maintainer: DeepChirp <deepchirp@archlinuxcn.org>

pkgname=ubaa-git
_pkgname=${pkgname%-git}
_reponame=UBAA
pkgver=r390.ab9d571
pkgrel=1
_javaversion=21
pkgdesc="Cross-platform Compose Multiplatform client for Beihang University campus services"
arch=('x86_64')
url="https://www.buaa.team"
license=('MIT')
makedepends=("git" "java-environment=${_javaversion}" "imagemagick")
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=("java-runtime>=${_javaversion}" "hicolor-icon-theme")
source=("git+https://github.com/BUAASubnet/${_reponame}.git"
        "${_pkgname}.desktop"
        "${_pkgname}.sh")
sha256sums=('SKIP'
            '79ce57a57321f1844d3f43c1f779d14e6ce95c60d6eb5adbffd0df3703f400e9'
            '6f9e5fb5a184b2ca77382cc00c65fd0ca1e38cf71b72dd419aa88d4efdbf4eaa')

pkgver() {
    cd "${_reponame}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "${_reponame}"

    export GRADLE_USER_HOME="${srcdir}/.gradle"

    # Enforce to use the specific Java version
    local _javadirs=(/usr/lib/jvm/java-${_javaversion}-*)
    export JAVA_HOME="${_javadirs[0]}"

    ./gradlew :composeApp:packageReleaseUberJarForCurrentOS --no-daemon
}

check() {
    cd "${_reponame}"

    export GRADLE_USER_HOME="${srcdir}/.gradle"

    local _javadirs=(/usr/lib/jvm/java-${_javaversion}-*)
    export JAVA_HOME="${_javadirs[0]}"

    ./gradlew :composeApp:jvmTest --no-daemon
}

package() {
    cd "${_reponame}"

    install -Dm644 composeApp/build/compose/jars/${_reponame}-linux-*-release.jar "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

    for res in 16 32 48 64 128 256 512; do
        install -d "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps"
        magick "composeApp/icons/app.png" -resize "${res}x${res}" "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_pkgname}.png"
    done

    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
