# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-meet
pkgver=1.0.14
pkgrel=1
pkgdesc='Secure, end-to-end encrypted video conferencing'
arch=(any)
url='https://proton.me/meet'
license=(GPL-3.0-or-later)
_electron=electron43
depends=(bash $_electron hicolor-icon-theme)
makedepends=(git jq nodejs-lts-krypton pnpm)
source=(ProtonWebClients::git+https://github.com/ProtonMail/WebClients.git#tag=proton-meet-desktop@$pkgver
        proton-meet.desktop
        proton-meet.sh)
b2sums=('c22d1338e74a34a73aa93f295c8094334f6262405af2fd13f570af3aa08b7480c7de36b4a3d5cade0d376bed710bba1035394f37b20acdaf5cec7bb1e9e2cdf4'
        'efdcc089844bf0287c61e7d5f8c6aa9f5721a6000751b887a586f3a5b5caf36686500b09c10dc3039e6914be804c155edf67a0be17640602221d96a25e1a197c'
        'cc16def864fd2e9134c194b473db94b0588871af895803fe4151ab7b715f66bbbb695a0964c03577da12b72397230626dabf186885cd206de412c8eac3a47e4a')

prepare() {
    cd ProtonWebClients

    # Find out which major release of electron this version of proton-mail requires
    local _electron_major=$(jq --raw-output '.devDependencies.electron' < "applications/meet-desktop/package.json" | sed 's/^[~^]\?\([0-9]\+\)\(\.[0-9]\+\)*$/\1/')

    # Check if we depend on the correct electron version
    if [ "$_electron" != "electron$_electron_major" ] ; then
        echo "Error: Incorrect electron version detected. Please change the value of \"_electron\" from \"$_electron\" to \"electron$_electron_major\"."
        return 1
    fi

    # Specify electron version in launcher
    sed -i "s|@ELECTRON@|$_electron|" "$srcdir/proton-meet.sh"

    sed -i '/tarball: https:\/\/nexus\.protontech\.ch/s/, tarball: [^}]*//' pnpm-lock.yaml
    pnpm install --frozen-lockfile --filter 'proton-meet-desktop...' --ignore-scripts --trust-lockfile \
        --config.@protontech:registry=https://registry.npmjs.org/ \
        --config.@proton-meet:registry=https://registry.npmjs.org/ \
        --store-dir "$srcdir/.pnpm-store"
}

build() {
    cd ProtonWebClients
    pnpm --filter proton-meet-desktop run package
}

check() {
    cd ProtonWebClients
    pnpm --filter proton-meet-desktop run test
}

package() {
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"

    cd ProtonWebClients/applications/meet-desktop
    install -d "$pkgdir/usr/share/$pkgname"
    cp out/"Proton Meet"-linux-*/resources/* "$pkgdir/usr/share/$pkgname/"

    cd assets
    install -Dm644 icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 icons/icon@2x.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png"
    install -Dm644 linux/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
