# Maintainer: Evy Storozhenko <evysgarden@protonmail.com>

pkgname=rars-git
pkgver=r340.f0c874c
pkgrel=1
pkgdesc="RISC-V Assembler and Runtime Simulator"
url="https://github.com/TheThirdOne/${pkgname%-git}"
arch=('x86_64')
license=('MIT')

depends=('java-environment')
makedepends=('git')
provides=('rars')
conflicts=('rars')

source=("git+https://github.com/TheThirdOne/${pkgname%-git}.git"
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'cccd77ebd03d0e9080c3840ddad6f0cdc677ca9129ad9db844d9eaaa90716919'
            '6478c02af2ec257d681b9cfb222a05da79ba1680db2fe3d09894308d113c0107')

prepare() {
    cd ${srcdir}/${pkgname%-git}
    git submodule update --init
}

pkgver() {
    cd ${srcdir}/${pkgname%-git}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${pkgname%-git}
    ./build-jar.sh
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"

    cd ${srcdir}/${pkgname%-git}
    install -Dm644 "./${pkgname%-git}.jar" "${pkgdir}/usr/share/java/${pkgname%-git}/${pkgname%-git}.jar"
    install -Dm644 "./License.txt" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
