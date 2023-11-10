# Maintainer: nubz4lif <nubz4lif at proton dot me>
pkgname=funkin-quack-git
pkgver=0.1.r61.g324d320
pkgrel=1
pkgdesc="A modification for Friday Night Funkin': Psych Engine to provide better linux support and more features."
arch=("x86_64" "i686" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
license=("Apache")
makedepends=("git" "haxe")
optdepends=("vlc: To play videos in-game")
provides=("funkin")
conflicts=("funkin")
sha256sums=("SKIP" "SKIP" "SKIP")
source=("Funkin::git+https://github.com/Noobz4Life/FNF-QuackEngine.git#branch=experimental"
        "funkin.desktop" 
        "funkin.sh")

pkgver() {
  cd "${srcdir}/Funkin"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
    cd "${srcdir}/Funkin"
    haxelib newrepo

    haxelib install hmm
    haxelib install lime
    haxelib run hmm install

    echo n | haxelib run lime setup

    pushd "${srcdir}/Funkin" > /dev/null
    for _ in 1 2; do # Run this twice due to SScript setup mode, Haxe doesn't recompile unchanged files anyway.
        #echo n due to SScript asking if you want to customize settings.
        echo n | haxelib run lime build linux -final -D officialBuild -D useAppStorage
    done
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
}
