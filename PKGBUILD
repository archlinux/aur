# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=proton-mail
pkgver=1.11.0
pkgrel=1
pkgdesc='Proton official desktop application for Proton Mail and Proton Calendar'
arch=('any')
url='https://proton.me/mail'
license=('GPL-3.0-or-later')
_electron=electron36
depends=('bash' "$_electron" 'hicolor-icon-theme')
makedepends=('git' 'jq' 'nodejs-lts-jod' 'yarn')
source=("ProtonWebClients::git+https://github.com/ProtonMail/WebClients.git#branch=release/inbox-desktop@$pkgver"
        'proton-mail.desktop'
        'proton-mail.sh')
b2sums=('SKIP'
        'f0a2b4eca51362b204f487c6484e07080b2d953f38acb3b7ce81a05394fe2f57e5fd42f8806111c467aa528e539654a6b1adc3965328668c4734b3eecf3407e9'
        '8e85e7543d433d57739d730707826baeadfadd537aed38ba487c7360fe5a69b0cd6e1989be13ebd5bceadc4b888bb3c1c1b17f02f7a5daadad7a2d1b2e0b1f89')

prepare() {
    cd ProtonWebClients

    local _electronver=$(jq -r '.devDependencies.electron | ltrimstr("^")' applications/inbox-desktop/package.json)
    if [[ -z "$_electronver" || "$_electronver" == "null" ]]; then
        echo "Failed to read electron version from source" >&2
        exit 1
    fi
    if [[ "electron${_electronver%%.*}" != "$_electron" ]]; then
        echo "Electron version mismatch: source requires electron${_electronver%%.*} but PKGBUILD specifies $_electron" >&2
        exit 1
    fi

    # Change electron binary name to the target electron
    sed "s|/usr/bin/electron|/usr/bin/$_electron|" -i "$srcdir/proton-mail.sh"

    # Limit workspace applications to inbox-desktop
    sed -i 's/"applications\/\*",/"applications\/inbox-desktop",/' package.json
}

build() {
    cd ProtonWebClients
    export YARN_CACHE_FOLDER="$srcdir/.yarn-cache"
    yarn install
    yarn workspace proton-inbox-desktop package
}

check() {
    cd ProtonWebClients
    yarn workspace proton-inbox-desktop test
}

package() {
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

    cd ProtonWebClients/applications/inbox-desktop

    # Find the output directory (supports any architecture)
    local _outdir=$(find out -maxdepth 1 -type d -name "Proton Mail-linux-*" | head -1)
    if [[ -z "$_outdir" ]]; then
        echo "Error: Could not find Proton Mail output directory" >&2
        return 1
    fi

    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -r "$_outdir/resources"/* "$pkgdir/usr/share/$pkgname/"

    cd assets
    install -Dm644 icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 icons/icon@2x.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png"
    install -Dm644 linux/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
