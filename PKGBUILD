# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=ubports-installer-git
pkgver=0.1.21_beta.r23.ga569e6b
pkgrel=2
pkgdesc='A simple tool to install Ubuntu Touch on UBports devices'
arch=(any)
url='https://github.com/ubports/ubports-installer'
license=('GPL3')
depends=('android-tools' 'android-udev' 'electron')
makedepends=('git' 'jq' 'npm')
provides=('ubports-installer')
conflicts=('ubports-installer')
source=("$pkgname::git+${url}.git"
        ubports-installer
        ubports-installer.desktop
        rootless.patch)
sha512sums=('SKIP'
            '51280df65c791b745aa06c689cbb0830ba48b69ebcb5ebfc96e4f9917c3da49d4aca6468dbac4bf1221988105f682861c6b76784a877b875ddaa29942e0ef1a2'
            '5370dae98ea52ef6d1a6d35cc15774687457836cc7a74538d32279617db329f215989863f15ed46d3aba7e384d703161a1cf6ae92101d88c8efa1445464bea59'
            '5e1a99f7bde3fd7b5b6b22d771421520e360f5f133fdc78ed35eea03969aa0f379df1ab720c792fd2c7155e92e4ccb70db9e77732ecedbb60e4ab294c8ea7107')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/-/_/;s/-/.r/;s/-/./'
}

prepare() {
    local cache="$srcdir/npm-cache"
    local dist=/usr/lib/electron

    patch -p1 -d "$pkgname" < rootless.patch

    cd "$pkgname"
    jq '.electronDist = $dist | .electronVersion = $version' \
        --arg dist "$dist" \
        --arg version "$(sed s/^v// $dist/version)" \
        buildconfig-generic.json > new-buildconfig.json
    mv new-buildconfig.json buildconfig-generic.json

    npm uninstall --no-audit --cache "$cache" electron{,-packager,-sudo,-view-renderer} spectron
}

build() {
    cd "$pkgname"
    node build.js --build-to-dir --linux --no-platform-tools
}

package() {
    install -Dm644 ubports-installer.desktop "$pkgdir/usr/share/applications/ubports-installer.desktop"
    install -Dm755 ubports-installer "$pkgdir/usr/bin/ubports-installer"

    cd "$pkgname/build/icons"
    for i in *x*.png; do
        install -Dm644 "$i" "$pkgdir/usr/share/icons/hicolor/${i%.png}/apps/ubports-installer.png"
    done

    cd "$srcdir/$pkgname/dist/linux-unpacked/resources"
    install -Dm644 app.asar "$pkgdir/usr/share/ubports-installer/app.asar"
}
