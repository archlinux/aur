# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=ubports-installer-git
pkgver=0.2.1_beta.r0.g1bea06f
pkgrel=1
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
        remove-electron-sudo.patch
        remove-update-check.patch)
sha512sums=('SKIP'
            '80b149a18a0e3effc3eea25674689e226d13671806953af58b8db247f5342a74df761d9dcb2f5015a6dd7342b461e6d6d60c4a883ea8346dee388552b8cdac0f'
            '5370dae98ea52ef6d1a6d35cc15774687457836cc7a74538d32279617db329f215989863f15ed46d3aba7e384d703161a1cf6ae92101d88c8efa1445464bea59'
            '419c08304996aee1cb05dc59d1b88900bff77711ad58d7d627912c90337ea9d4af98c25e516dd5ecc2c418fdacc2ec043714efc19553d1427e090e6f001c2ec7'
            'd3afd645a6f0c6addd824d1b708501b5f6606bcba848c175ce19d14f43b07baebf5c63045e56f5a62cba543eda32afc5df79c3e35ae5e8dc68f0e89658b3833b')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/-/_/;s/-/.r/;s/-/./'
}

prepare() {
    local cache="$srcdir/npm-cache"
    local dist=/usr/lib/electron
    local version="$(sed s/^v// $dist/version)"

    for i in *.patch; do
        patch -p1 -d "$pkgname" < "$i"
    done

    cd "$pkgname"
    jq '.electronDist = $dist | .electronVersion = $version' \
        --arg dist "$dist" \
        --arg version "$version" \
        buildconfig-generic.json > new-buildconfig.json
    mv new-buildconfig.json buildconfig-generic.json

    npm uninstall --no-audit --cache "$cache" electron{-packager,-sudo,-view-renderer} spectron
    npm install --no-audit --cache "$cache" electron@"$version"
}

build() {
    cd "$pkgname"
    node build.js --os linux --package dir --no-platform-tools
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
