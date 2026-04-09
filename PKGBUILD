# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-all
pkgver=2.21.0
pkgrel=1
pkgdesc='elephant + all official elephant providers'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('libqalculate' 'wl-clipboard' 'imagemagick' 'fd' 'wtype' 'jq' 'sqlite3')
makedepends=('go')
conflicts=('elephant' 'elephant-playerctl' 'elephant-wireplumber' 'elephant-bitwarden' 'elephant-dnfpackages' 'elephant-1password' 'elephant-bookmarks' 'elephant-nirisessions' 'elephant-niriactions' 'elephant-archlinuxpkgs' 'elephant-bluetooth' 'elephant-calc' 'elephant-clipboard' 'elephant-desktopapplications' 'elephant-files' 'elephant-menus' 'elephant-providerlist' 'elephant-runner' 'elephant-snippets' 'elephant-symbols' 'elephant-todo' 'elephant-unicode' 'elephant-websearch' 'elephant-windows')
provides=('elephant' 'elephant-playerctl' 'elephant-wireplumber' 'elephant-nirisessions' 'elephant-niriactions' 'elephant-archlinuxpkgs' 'elephant-bluetooth' 'elephant-calc' 'elephant-clipboard' 'elephant-desktopapplications' 'elephant-files' 'elephant-menus' 'elephant-providerlist' 'elephant-runner' 'elephant-snippets' 'elephant-symbols' 'elephant-todo' 'elephant-unicode' 'elephant-websearch' 'elephant-windows')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7631900b656511ccd3e82e832c4feaab3796f4e074e7829d91dd1bd2402f5c16')

build() {
    # Build main elephant binary
    cd elephant-${pkgver}/cmd/elephant
    go build -ldflags="-s -w" -buildvcs=false -x -o elephant -trimpath

    # Build all provider plugins
    cd ../../internal/providers

    # Build each provider
    for provider in playerctl wireplumber archlinuxpkgs bitwarden dnfpackages 1password bookmarks bluetooth nirisessions niriactions calc clipboard desktopapplications files menus providerlist runner snippets symbols todo unicode websearch windows; do
        cd $provider
        go build -ldflags="-s -w" -buildvcs=false -buildmode=plugin -trimpath
        cd ..
    done
}

package() {
    # Install main elephant binary
    cd elephant-${pkgver}/cmd/elephant
    install -Dm 755 elephant -t "${pkgdir}/usr/bin"

    # Install all provider plugins
    cd ../../internal/providers
    for provider in playerctl wireplumber archlinuxpkgs bitwarden dnfpackages bookmarks 1password nirisessions niriactions bluetooth calc clipboard desktopapplications files menus providerlist runner snippets symbols todo unicode websearch windows; do
        install -Dm 755 $provider/$provider.so -t "${pkgdir}/usr/lib/elephant"
    done

    # Install license
    cd ../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
