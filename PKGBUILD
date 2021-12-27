# Maintainer: Johannes Frohnmeyer <aur at akbvopenfl1 dot hopto dot org>

pkgname=inceptum-git
pkgver=0.1.0.r3.gc3de25b
pkgrel=1
pkgdesc="An advanced minecraft launcher written in java"
arch=("x86_64")
url="https://gitlab.com/JFronny/inceptum"
license=("GPL3")
depends=("java-runtime>=17" 'bash')
makedepends=('git' 'java-environment=17' 'gradle')
source=(git+"${url}".git
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh"
        "${pkgname%-git}.service"
        "${pkgname%-git}.sysusers"
        "${pkgname%-git}.conf")
sha256sums=('SKIP'
            '70a6ac8d2cb1c29699aa740b49fac05b2efca85f8de3c8f0b290ee5e077ec726'
            '6867e8476c9eb04cb303f40a4949db227c0c92e94b864d667a2d5a1f1c3d77da'
            '034407520261b79175f0011a5cf1523ef077dad55341c39753501ae4730cb870'
            'd982ba99cabef051cf95e1d58646205588727d32351de340a1fcfbb2ebd6f8bb'
            '41ae84877dd3ce346a7d97fc7f493c8e9dcacfa67ce6974ace56baecee9a8411')

pkgver() {
    git -C "${pkgname%-git}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    gradle build -Prelease
    mv "build/libs/Inceptum-$(git describe --tags --abbrev=0)-custom.jar" "../${pkgname%-git}.jar"
}

package() {
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm755 "${pkgname%-git}.jar" -t "${pkgdir}/usr/share/java/${pkgname%-git}"
    install -Dm755 "${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"

    install -Dm644 "${pkgname%-git}.conf" "${pkgdir}/etc/conf.d/${pkgname%-git}"
    install -Dm644 "${pkgname%-git}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname%-git}.conf"
    install -Dm644 "${srcdir}/${pkgname%-git}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname%-git}.service"
    install -dm2755 "${pkgdir}/srv/${pkgname%-git}"
    chown -R inceptum:inceptum "${pkgdir}/srv/${pkgname%-git}"
}
