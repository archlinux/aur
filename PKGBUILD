# Maintainer: nubz4lif <nubz4lif at proton dot me>
pkgname=funkin-psych-git
pkgver=0.7.3.r0.g2dfa2777
pkgrel=2
pkgdesc="Friday Night Funkin' Engine intended to be a fix for the vanilla version's issues while also providing mod support."
arch=("x86_64" "i686" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
license=("Apache")
makedepends=("git" "haxe")
optdepends=("vlc: To play videos in-game" "gamemode")
url="https://github.com/Noobz4Life/FNF-QuackEngine"
provides=("funkin")
conflicts=("funkin")
sha256sums=("SKIP"
        "8cb8c993a70609663b1dca92f8139ee06573828aee8cbc8b9a7d84aa4f7e74b0"
        "3810018b574ee7bd9769d05b9ced17227d5cf0a3535c6441672b903b11845d6b")
source=("Funkin::git+https://github.com/ShadowMario/FNF-PsychEngine"
        "funkin.desktop"
        "funkin.sh")

pkgver() {
  cd "${srcdir}/Funkin"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
    cd "${srcdir}/Funkin"
    haxelib deleterepo # obviously not ideal, but essentially makes sure that no prompts about overwriting a version with another happens
    haxelib newrepo

    echo 'oy9:showMacroty8:loopCosti25y10:includeAllfg' >> ~/settings.cocoa #skips sscript setup mode

    haxelib install hxcpp > /dev/null --quiet
    haxe -cp ./setup -D analyzer-optimize -main Main --interp

    echo n | haxelib run lime setup

    pushd "${srcdir}/Funkin" > /dev/null
    haxelib run lime build linux -final -D officialBuild -D useAppStorage

    popd > /dev/null
}

package() {
    pushd "${srcdir}/Funkin" > /dev/null
    install -dm0755 "${pkgdir}/usr/share/funkin"
    cp -r export/release/linux/bin/* "${pkgdir}/usr/share/funkin/"
    for size in 16 32 64; do
        install -Dm0644 "art/icon${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/funkin.png"

    done

    popd > /dev/null

    install -Dm0755 funkin.sh "${pkgdir}/usr/bin/funkin"
    install -Dm0644 funkin.desktop "${pkgdir}/usr/share/applications/funkin.desktop"

    touch "${pkgdir}/usr/share/funkin/modsList.txt"
    chmod 666 "${pkgdir}/usr/share/funkin/modsList.txt"
}
