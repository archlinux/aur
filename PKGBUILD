# Contributor: Matthias Lisin <ml@visu.li>
# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=ubports-installer
pkgver=0.2.2_beta
pkgrel=1
pkgdesc='A simple tool to install Ubuntu Touch on UBports devices'
arch=(any)
url='https://github.com/ubports/ubports-installer'
license=('GPL3')
depends=('android-tools' 'android-udev' 'electron')
makedepends=('git' 'jq' 'npm')
conflicts=('ubports-installer-git')
source=("https://github.com/ubports/ubports-installer/archive/${pkgver/_/-}.tar.gz"
        ubports-installer.sh
        ubports-installer.desktop
        rootless.patch)
sha512sums=('2316633f620db34846dfda3c55774682a371d30ebe28360d882da69d18316e5f069d02ffa91cd88243337040ffbaacce2f1c83ab63a934154ebcfd8a418f5a83'
            'd622cfe1f01d1ef0fc89c6d05e655f0396133142a3244353cc43dbefb493ac0e896f4927e350cda5138b4b369975e5755552f5dfaef53dee209af5eb1d90f5f2'
            '87d6760633d83b5d02abd3f54619fa1082a2f1a69be85ee010b2e552f6a926888c37aacb9b71d75b06d87311942dc219a3e51afd758cb2b9985a0bcb1d9a0455'
            'dcc4efbe608a518adbad074d741745a8d43da580bc2279f429fc3c458a496ec91eaa913c4d43d49979b3411326dbb4e551bec092fb07cfe96fab5f559588677a')

prepare() {
    local cache="$srcdir/npm-cache"
    local dist=/usr/lib/electron

    patch -p1 -d "$pkgname-${pkgver/_/-}" < rootless.patch

    cd "$pkgname-${pkgver/_/-}"
    jq '.electronDist = $dist | .electronVersion = $version' \
        --arg dist "$dist" \
        --arg version "$(sed s/^v// $dist/version)" \
        buildconfig-generic.json > new-buildconfig.json
    mv new-buildconfig.json buildconfig-generic.json

    npm uninstall --no-audit --cache "$cache" electron{-packager,-sudo,-view-renderer} spectron
}

build() {
    cd "$pkgname-${pkgver/_/-}"
    node build.js --package dir --os linux --no-platform-tools
}

package() {
    install -Dm644 ubports-installer.desktop "$pkgdir/usr/share/applications/ubports-installer.desktop"
    install -Dm755 ubports-installer.sh "$pkgdir/usr/bin/ubports-installer"

    cd "$srcdir/$pkgname-${pkgver/_/-}/build/icons"
    for i in *x*.png; do
        install -Dm644 "$i" "$pkgdir/usr/share/icons/hicolor/${i%.png}/apps/ubports-installer.png"
    done

    cd "$srcdir/$pkgname-${pkgver/_/-}/dist/linux-unpacked/resources"
    install -Dm644 app.asar "$pkgdir/usr/share/ubports-installer/app.asar"
}
