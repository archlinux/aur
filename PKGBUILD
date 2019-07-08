# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=skide
pkgname=${_pkgname}-git
pkgver=r316.141055e
pkgrel=1
pkgdesc="A fully tooled Open Source Editor for Skript providing IDE like features"
arch=("any")
url="https://skide.21xayah.com/"
license=("GPL2")
depends=("jre8-openjdk" "java-openjfx")
makedepends=("jdk8-openjdk" "gradle" "kotlin" "git")
source=("$pkgname::git+https://github.com/SavageLLC/SkIDE.git"
        "skide.desktop")
sha512sums=('SKIP'
            'fe90b70afa2ef5a3ff7a7d41eacefe9ffdc5554e2893b682454e9c5240b64a46abf4184d28fea017d245b2bdebbfc5075e5bacb0b956994799a88dcba3fe40c2')


pkgver() {
    cd "$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    export PATH="/usr/lib/jvm/java-8-openjdk/bin:${PATH}"
    export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
    gradle installDist

    sed -i 's/DEFAULT_JVM_OPTS=""/DEFAULT_JVM_OPTS="-Dskide.os=arch -Dskide.mode=prod"/' "build/install/SkIDE/bin/SkIDE"
}

check() {
    cd "$pkgname"

    export PATH="/usr/lib/jvm/java-8-openjdk/bin:${PATH}"
    export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
    gradle test
}

package() {
    cd "$pkgname"

    rm "build/install/SkIDE/bin/SkIDE.bat"

    install -d "${pkgdir}/usr/share/java/skide/" "${pkgdir}/usr/bin"
    cp -r "build/install/SkIDE/." "${pkgdir}/usr/share/java/skide/"
    ln -s "/usr/share/java/skide/bin/SkIDE" "${pkgdir}/usr/bin/skide"

    install -Dm 644 "src/main/resources/images/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm 644 "../skide.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

   echo "" > "${pkgdir}/usr/share/java/skide/lib/check" # works around "old version check"-bug. Ignore this :D
}
