# Maintainer: Matthias Lisin <ml@visu.li>
pkgname=ubports-installer-git
pkgver=0.3.2_beta.r6.g15ed833
pkgrel=2
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
        disable-update-check.patch)
sha512sums=('SKIP'
            'e746e844f013c85f9ef6db7163b08e34745c48de2f94f096c582e6aa89b6cde54a91eca23e2eea0e0d6cb20f2582a0e33456c2503be45d6632bb0e02eb5b4cf1'
            'efb0da575db03326f56a8bb589f3f5f543a4ae23b471658555bb030bcc1c1625ba2aafd15f26fac41425b3b0bde4cf176740d92aafd5853d5ce1da2b946686e8'
            '027f2085245135b3aff6e5340b00be55199161d7409788cd800028518c8e03a365c7b5cac762b817e3f71f8d719fdd6bb546807fcda5e64ef6ef11adca4a5c02')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/-/_/;s/-/.r/;s/-/./'
}

prepare() {
    local dist=/usr/lib/electron4
    local version="$(sed s/^v// $dist/version)"

    cd "$pkgname"
    for i in ${source[@]}; do
        case ${i%::*} in
            *.patch)
                msg2 "Applying ${i}"
                patch -p1 -i "$srcdir/${i}"
                ;;
        esac
    done

    # Set electronDist and current electronVersion
    mv -v buildconfig-generic.json buildconfig-generic.json.orig
    jq '.electronDist = $dist | .electronVersion = $version' \
        --arg dist "$dist" \
        --arg version "$version" \
        buildconfig-generic.json.orig > buildconfig-generic.json

    npm uninstall --no-audit --cache "$srcdir/npm-cache" electron{-packager,-view-renderer} spectron

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
