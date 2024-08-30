# Maintainer: solonovamax <solonovamax@12oclockpoint.com>

_pkgname=textidote
pkgname=${_pkgname}
pkgver=0.8.3
pkgrel=1
pkgdesc="Spelling, grammar and style checking on LaTeX documents"
arch=("any")
url="https://sylvainhalle.github.io/textidote/"
license=("GPL")

depends=("java-runtime")
makedepends=("ant" "java-environment")

conflicts=("$_pkgname-bin" "$_pkgname-git")
replaces=("$_pkgname")
provides=("$_pkgname")

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/sylvainhalle/textidote/archive/refs/tags/v$pkgver.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/sylvainhalle/textidote/v$pkgver/LICENSE"
    "build-for-java-8.patch"
    "textidote.1"
    "textidote"
)
sha256sums=(
    "8c55d6f6f35d51fb5b84e7dcc86a4041e06b3f92d6a919023dc332ba2effd584"
    "d62f065830aa3739cc031156b9690805c7b2e811b4a178c8b4acd8725d561c94"
    "6acb739ecbf7cbdc8678e50922ccc9a7521703b6d959607d8c6722d386772b7c"
    "bf381c7a8004f2d0de8dbe777ce74850d46c0aeb70358c147efdeb424491adf1"
    "15de4eb7413e838c6c99b2317e7856ab3496a0a9fdf52858dcc047a937d0459c"
)

prepare() {
    cd "$pkgname-$pkgver"

    # Patch to build targetting java 8
    patch -p1 -i "$srcdir/build-for-java-8.patch"

    ant -noinput download-deps
}

build() {
    cd "$pkgname-$pkgver"

    ant -noinput
}

package() {
    install -Dm644 "textidote.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"

    install -Dm755 "textidote" "$pkgdir/usr/bin/textidote"

    cd "$pkgname-$pkgver"

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    install -Dm644 "Completions/textidote.bash" "$pkgdir/etc/bash.completion.d/$_pkgname"

    install -Dm644 "dist/$_pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
    install -Dm644 "dist/lib/"*.jar "$pkgdir/usr/share/java/$_pkgname/"
}
