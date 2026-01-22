# Maintainer: Max Weber <abex at runelite dot net>
# Contributor: Jason Stryker <public at jasonstryker dot com>

pkgname=runelite-git
pkgver=1.12.13.r4.g02e33cb
pkgrel=1
pkgdesc="Open source Old School RuneScape client. (Git Version)"
url='https://runelite.net/'
arch=(any)
license=('BSD')
depends=(
    'java-runtime>=11'
    'ttf-font')
optdepends=(
    'gvfs: enable links'
    'libnotify: native tray notifications')
makedepends=(
    'git')
provides=("runelite=${pkgver}")
conflicts=('runelite')
source=(
    "git+https://github.com/runelite/runelite.git"
    runelite.desktop
    runelite.png)
sha512sums=(
    'SKIP'
    'SKIP'
    'SKIP')

pkgver() {
    cd "${srcdir}/runelite"
    git describe --long --abbrev=7 | sed 's/runelite-parent-//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {    
    cd "${srcdir}/runelite/"
    ./gradlew :client:clean :client:shadowJar --no-daemon
}

package() {
    _client_jar="$(find "${srcdir}/runelite/runelite-client/build/libs/" -type f -name 'client-*-shaded.jar')"
    install -D -m644 \
        "$_client_jar" \
        "${pkgdir}/usr/share/java/runelite/RuneLite.jar"

    install -D -m644 \
        "${srcdir}/runelite.desktop" \
        "${pkgdir}/usr/share/applications/runelite.desktop"

    install -D -m644 \
        "${srcdir}/runelite.png" \
        "${pkgdir}/usr/share/pixmaps/runelite.png"

    install -D -m644 \
        "${srcdir}/runelite/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -D -m755 \
        "/dev/null" \
        "${pkgdir}/usr/bin/runelite"

    echo '#!/bin/sh' > "${pkgdir}/usr/bin/runelite"
    echo 'exec java -jar /usr/share/java/runelite/RuneLite.jar "$@"' >> "${pkgdir}/usr/bin/runelite"
}
