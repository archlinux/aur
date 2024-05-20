# Maintainer: Tricia, `creyon` <gtcreyon@gmail.com>
# Contributor: Giancarlo Grasso <gianniesoft at gmail dot com>

_pkgname=whatsdesk
pkgname=whatsdesk-git
pkgver=0.3.9.r31.366e49c
pkgrel=1
pkgdesc="unofficial client of whatsapp"
arch=('x86_64')
url="https://zerkc.gitlab.io/whatsdesk"
license=('MIT')
provides=('whatsdesk')
conflicts=('whatsdesk-bin')
depends=('libxss'
         'nss'
         'libxtst'
         'libnotify'
         'libappindicator-gtk3')
makedepends=('git'
             'nodejs'
             'npm'
             'jq')
source=('git+https://gitlab.com/zerkc/whatsdesk.git'
        'no-page.patch')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd $_pkgname
    # Get the version from `package.json` because the repo doesn't have tags.
    printf "%s.r%s.%s" "$(cat package.json | jq -r '.version')" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd $_pkgname

    # Don't build the Gitlab Pages page, because we don't need it.
    patch -p1 -d . < ../no-page.patch

    mv package.json package.json.tmp
    jq ".build.linux.target={\"target\": \"dir\",\"arch\":[\"x64\"]}" package.json.tmp > package.json
}

build() {
    cd $_pkgname
    npm install

    # Had to remove these because they were causing build to fail.
    # Don't know what they do... Hope that's not a problem.
    rm -rf node_modules/@types/yargs
    rm -rf node_modules/@types/babel__traverse

    npm run build
}

package() {
    cd $_pkgname
    install -d "$pkgdir/opt/whatsdesk"
    install -d "$pkgdir/usr/bin"
    cp -r "dist/linux-unpacked/." "$pkgdir/opt/whatsdesk/"
    install -Dm755 "dist/linux-unpacked/whatsdesk" "$pkgdir/opt/whatsdesk/whatsdesk"
    ln -s "/opt/whatsdesk/whatsdesk" "$pkgdir/usr/bin/whatsdesk"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
