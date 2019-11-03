# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=ubports-installer-git
pkgver=0.4.5_beta.r0.g5ce9c51
pkgrel=1
pkgdesc='A simple tool to install Ubuntu Touch on UBports devices'
arch=(any)
url='https://github.com/ubports/ubports-installer'
license=('GPL3')
depends=('android-tools' 'android-udev' 'electron4')
makedepends=('git' 'jq' 'moreutils' 'npm')
provides=('ubports-installer')
conflicts=('ubports-installer')
source=("$pkgname::git+${url}.git"
        ubports-installer
        ubports-installer.desktop
        disable-update-check.patch
        use-system-tools.patch)
sha512sums=('SKIP'
            '478766bca96e64cb13b86003113e33eba74139e5a0d56687ff0647e4d2356639249c9f4054c5c3741fec697c624980dd1507925702f4865370ec9a20f766720a'
            'efb0da575db03326f56a8bb589f3f5f543a4ae23b471658555bb030bcc1c1625ba2aafd15f26fac41425b3b0bde4cf176740d92aafd5853d5ce1da2b946686e8'
            '42d977dabe003cc4001e75a7dd782090bd7218c8b5270e820d922b3ca206e58669de9e0d9bc4056839baf1b363922e2a789626642959a31070d3160e51c151cf'
            '4655eadabf03185b811e6a9df4569a23b459ee3ea4b64801aa445c3cfb7443e88a1c2de99050d4ec145c2936c58afdb4dd7767cb3ab00be4e8f969578bc86183')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/-/_/;s/-/.r/;s/-/./'
}

prepare() {
    local dist=/usr/lib/electron4
    local version="$(sed 's/^v//' $dist/version)"

    cd "$pkgname"
    for i in ${source[@]}; do
        case ${i%::*} in
            *.patch)
                msg2 "Applying ${i}"
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
        msg2 "Removing local references from ${target}"
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
