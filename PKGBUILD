# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=ubports-installer-git
pkgver=0.4.14_beta.r4.g9f0fde4
pkgrel=1
pkgdesc='A simple tool to install Ubuntu Touch on UBports devices'
arch=(any)
url='https://github.com/ubports/ubports-installer'
license=('GPL3')
depends=('android-tools' 'android-udev' 'electron6')
makedepends=('git' 'jq' 'moreutils' 'npm')
provides=('ubports-installer')
conflicts=('ubports-installer')
source=("$pkgname::git+${url}.git"
        ubports-installer
        ubports-installer.desktop
        use-system-tools.patch)
sha512sums=('SKIP'
            '50b114735cbe7cdde45dff5ae18c3e081f45d61045177a97b50b9525355b02e1a6c435996ccfe5503451ceffa027882abb5133585acc01dc5445bb1501b04f0a'
            'efb0da575db03326f56a8bb589f3f5f543a4ae23b471658555bb030bcc1c1625ba2aafd15f26fac41425b3b0bde4cf176740d92aafd5853d5ce1da2b946686e8'
            '4655eadabf03185b811e6a9df4569a23b459ee3ea4b64801aa445c3cfb7443e88a1c2de99050d4ec145c2936c58afdb4dd7767cb3ab00be4e8f969578bc86183')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/-/_/;s/-/.r/;s/-/./'
}

prepare() {
    local dist=/usr/lib/electron6
    local version="$(sed 's/^v//' $dist/version)"

    cd "$pkgname"
    for i in ${source[@]}; do
        case ${i%::*} in
            *.patch)
                patch -N -p1 -i "$srcdir/${i}"
                ;;
        esac
    done

    # Set electronDist and current electronVersion
    jq '.electronDist = $dist | .electronVersion = $version' \
        --arg dist "$dist" \
        --arg version "$version" \
        buildconfig-generic.json | sponge buildconfig-generic.json

    npm uninstall --no-audit --cache "$srcdir/npm-cache" electron-packager

    # Removing local references
    for module in he sshpk; do
        local target="node_modules/${module}/package.json"
        echo "Removing local references from ${target}"
        jq 'del(.man)' "$target" | sponge "$target"
    done
}

build() {
    cd "$pkgname"
    node build.js --no-platform-tools --os linux --package dir
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
