# Contributor: Matthias Lisin <ml@visu.li>
# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
pkgname=ubports-installer
pkgver=0.1.21_beta
pkgrel=4
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
sha512sums=('75b0f62c482e78925f9b9428d589d6c133b7693190e0de5de4f0efd8ce6d3f46f2fb3fa619850be6a4b227ca5ff0ddba77e1f33e9058d92f3b19632ce7c7ca90'
            'd622cfe1f01d1ef0fc89c6d05e655f0396133142a3244353cc43dbefb493ac0e896f4927e350cda5138b4b369975e5755552f5dfaef53dee209af5eb1d90f5f2'
            '87d6760633d83b5d02abd3f54619fa1082a2f1a69be85ee010b2e552f6a926888c37aacb9b71d75b06d87311942dc219a3e51afd758cb2b9985a0bcb1d9a0455'
            '5e1a99f7bde3fd7b5b6b22d771421520e360f5f133fdc78ed35eea03969aa0f379df1ab720c792fd2c7155e92e4ccb70db9e77732ecedbb60e4ab294c8ea7107')

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

    npm uninstall --no-audit --cache "$cache" electron{,-packager,-sudo,-view-renderer} spectron
}

build() {
    cd "$pkgname-${pkgver/_/-}"
    node build.js --build-to-dir --linux --no-platform-tools
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
