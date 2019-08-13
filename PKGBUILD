# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_gradlename=Raven
_pkgname=raven
pkgname=${_pkgname}-git
pkgver=r41.45a1360
pkgrel=1
pkgdesc="Free software alternative discord client"
arch=("any")
url="https://github.com/SavageLLC/Raven"
license=("GPL2")
depends=("java-runtime>=12" "ffmpeg-compat-54")
makedepends=("java-environment>=12" "gradle" "kotlin" "git")
source=("$pkgname::git+https://github.com/SavageLLC/Raven.git"
        "raven.desktop")
sha512sums=('SKIP'
            'f21180f8bc3dcb6a987619ebaab196c24a6e1fdaff1dd2c298417c7bbf12312a52da7bd1171ea1281219358acbc23d77998b37b3b8acad65773c073bb5739de3')


pkgver() {
    cd "$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    gradle installDist
}

check() {
    cd "$pkgname"

    gradle test
}

package() {
    cd "$pkgname"

    rm "build/install/${_gradlename}/bin/${_gradlename}.bat"

    install -d "${pkgdir}/usr/share/java/${_pkgname}" "${pkgdir}/usr/bin"
    cp -r "build/install/${_gradlename}/." "${pkgdir}/usr/share/java/${_pkgname}"
    ln -s "/usr/share/java/${_pkgname}/bin/${_gradlename}" "${pkgdir}/usr/bin/${_pkgname}"
    
    install -Dm 644 "../${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
