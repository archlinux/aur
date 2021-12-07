# Maintainer: Evy Storozhenko <evysgarden@protonmail.com>

pkgname=rars-git
pkgver=r340.f0c874c
pkgrel=2
pkgdesc="RISC-V Assembler and Runtime Simulator"
url="https://github.com/TheThirdOne/${pkgname%-git}"
arch=('x86_64')
license=('MIT')
depends=('java-runtime>=8')
makedepends=('git'
             'java-environment>=8')
provides=('rars')
conflicts=('rars')

source=("git+https://github.com/TheThirdOne/${pkgname%-git}.git"
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '94f7e604bc4447bfc8b0b32d9ca529163ca011623ebf2294fb3ccf4791272d4e'
            'ab5b088335e5f189eaffa3399e764d85ad5069bb266a68a5640d2732504c5b56')

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
    install -Dm644 "./src/images/RISC-V.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
}
