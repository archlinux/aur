# Maintainer: Dionicio3 <dionicio3@dionicio3.com>
pkgname=vlabeler-git
pkgver=r1404.e5ce5cdb
pkgrel=1
epoch=
pkgdesc="Open source voice labeling application"
arch=('x86_64')
url="https://github.com/sdercolin/vlabeler"
license=('Apache')
depends=('java-runtime=17')
makedepends=('java-environment=17')
source=("git+https://github.com/sdercolin/vlabeler.git"
        "vLabeler-git.desktop")
sha256sums=('SKIP'
            'c9319e05112076219879979cada93e21ada7bcd8acd7913180fad152096ddc76')

pkgver() {
    cd "$srcdir"/vlabeler
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/vlabeler"
    ./gradlew createDistributable
}

package() {
    # Copy build output
    mkdir -p "$pkgdir"/usr/lib/"$pkgname"/vLabeler
    cp -r "$srcdir"/vlabeler/build/compose/binaries/main/app/vLabeler/* \
      "$pkgdir"/usr/lib/"$pkgname"/vLabeler

    # Mark binary as executable
    chmod 755 "$pkgdir"/usr/lib/"$pkgname"/vLabeler/bin/vLabeler

    # Wrapper
    echo "#!/bin/sh" > "$srcdir"/vLabeler
    echo "exec /usr/lib/$pkgname/vLabeler/bin/vLabeler" >> "$srcdir"/vLabeler
    install -Dm755 "$srcdir"/vLabeler "$pkgdir"/usr/bin/vLabeler

    # Icon
    install -Dm644 "$srcdir"/vlabeler/src/jvmMain/resources/icon.png "$pkgdir"/usr/share/pixmaps/vlabeler.png

    # Desktop file
    install -Dm644 "$srcdir"/vLabeler-git.desktop "$pkgdir"/usr/share/applications/vLabeler-git.desktop
}
