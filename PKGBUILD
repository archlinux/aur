# Maintainer: Holden Grayer <grayer0113@outlook.com>

pkgname=leavesmc-git
_pkgname=leavesmc
_pkgver=1.20.4
_build=a4724ba
pkgver="${_pkgver}+${_build}"
pkgrel=1
pkgdesc="Fork of Paper aimed at repairing broken vanilla properties."
arch=('any')
url="https://leavesmc.org/"
license=('custom')
depends=('java-runtime>=17' 'awk')
makedepends=('zulu-17-bin')
optdepends=('screen: Used to continue running the server after closing the terminal.')
provides=('leavesmc')
conflicts=('leavesmc')
install=${_pkgname}.install
source=("leavesmc.png"
        "leavesmc.desktop"
        "leavesmc-launch-script"
        "leavesmc.install"
        "${pkgname}"::"git+https://github.com/LeavesMC/Leaves.git")
sha256sums=("720ee68108bbe12c362cf5ed05b3ad5b28bbaf53f3d7952d389bfc404a5baaac"
            "4a03cc59260564cbd176260250a4256e56793d4e82e40c61d421dd549c981022"
            "d967d878d6d2d80e034ba31fb1852cc45243c9339bede3959d1274b1f1761367"
            "af0f7f846da7e5da02193538d5120fdb40cc3730e1ec0574c23583bc0b03841f"
            "SKIP")

build() {
    cd "${srcdir}/${pkgname}"
    export JAVA_HOME=/usr/lib/jvm/zulu-17
    ./gradlew applyPatches --info
    ./gradlew createReobfPaperclipJar --info
}

package() {
    _buildver="$(awk -F= '/^version/ {gsub(/"|,|\s/,""); printf $2}' ${srcdir}/${pkgname}/gradle.properties)"

    install -Dm644 "leavesmc.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
    install -Dm644 "leavesmc.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm755 "leavesmc-launch-script" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${pkgname}/build/libs/Leaves-paperclip-${_buildver}-reobf.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
    install -Dm644 "${srcdir}/${pkgname}/licenses/GPL.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_GPL"
    install -Dm644 "${srcdir}/${pkgname}/licenses/MIT.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_MIT"
}
