# Maintainer: Holden Grayer <grayer0113@outlook.com>

pkgname=leavesmc-git
_pkgname=leavesmc
_pkgver=1.20.4
_build=335f748
pkgver="${_pkgver}+${_build}"
pkgrel=2
pkgdesc="Fork of Paper aimed at repairing broken vanilla properties."
arch=('any')
url="https://leavesmc.org/"
license=('custom')
depends=('java-runtime>=17' 'awk')
makedepends=('zulu-17-bin')
optdepends=('screen')
conflicts=('leavesmc')
source=("leavesmc.png"
        "leavesmc.desktop"
        "leavesmc-launch-script"
        "leavesmc-launch-script-gui"
        "${pkgname}"::"git+https://github.com/LeavesMC/Leaves.git")
sha256sums=("720ee68108bbe12c362cf5ed05b3ad5b28bbaf53f3d7952d389bfc404a5baaac"
            "bf4126de32cb04e8f9bf932d8b790105adec10f032b467061ab662e92d9400bf"
            "60eb9f0bf69f3250409405e7bce73059ce766fe41bc789bb002245a6dc11ff28"
            "075b414af5a20c909b028c2c07da219e1c3acb6dc2c214ba53c8082733354ff8"
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
    install -Dm755 "leavesmc-launch-script-gui" "${pkgdir}/usr/bin/${_pkgname}-gui"
    install -Dm644 "${srcdir}/${pkgname}/build/libs/Leaves-paperclip-${_buildver}-reobf.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
    install -Dm644 "${srcdir}/${pkgname}/licenses/GPL.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_GPL"
    install -Dm644 "${srcdir}/${pkgname}/licenses/MIT.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_MIT"
}
