# Maintainer: Nixuge
# If/When recaf 4 becomes the main release, this package will be removed/archived.
#
# The java17-openjfx requirement instead of java-openjfx is here to avoid confusion,
# as the current package is currently being annoying to install without Java 20 
# in the repos

_reponame=recaf
_installname=recaf-4
pkgname=${_reponame}-dev4-git
pkgver=r3816.5945a284
pkgrel=1
pkgdesc="A modern Java bytecode editor. dev4 (beta) branch."
arch=("any")
url="https://github.com/Col-E/Recaf/tree/dev4"
license=("MIT")
depends=("java-runtime" "java17-openjfx" "ttf-font")
makedepends=("git" "java-environment" "jdk17-openjdk")
provides=($_installname)
source=("recaf::git+https://github.com/Col-E/Recaf#branch=dev4"
        "recaf-4"
        "recaf-4.desktop")
sha256sums=("SKIP"
        "34a64f21c7b5de1435e8e111f6d4bacfa1d0d735b7dab412ad669fe1376810db"
        "3d89d8b9c46ef27edaddcc0d612fed3ac0537ecee6aa049fc4fb2a2bbbbdfe54")

pkgver() {
    cd "$srcdir/$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_reponame"
    JAVA_HOME="/usr/lib/jvm/java-17-openjdk" ./gradlew build
}

package() {
    cd "$srcdir/$_reponame"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_installname/LICENSE"

    install -Dm755 \
            "recaf-ui/build/libs/recaf-ui-4.0.0-SNAPSHOT-all.jar" \
            "$pkgdir/usr/share/java/$_installname/$_installname.jar"
    
    install -Dm644 "recaf-ui/src/main/resources/icons/logo.png" "$pkgdir/usr/share/pixmaps/recaf-4.png"
    install -Dm644 "$srcdir/recaf-4.desktop" "$pkgdir/usr/share/applications/recaf-4.desktop"


    install -Dm755 "$srcdir/recaf-4" "$pkgdir/usr/bin/recaf-4"
}
