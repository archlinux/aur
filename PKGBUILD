# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-all
pkgver=2.17.0
pkgrel=1
pkgdesc='elephant + all official elephant providers'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('libqalculate' 'wl-clipboard' 'imagemagick' 'fd' 'wtype' 'jq' 'sqlite3')
makedepends=('go')
conflicts=('elephant' 'elephant-1password' 'elephant-bookmarks' 'elephant-nirisessions' 'elephant-archlinuxpkgs' 'elephant-bluetooth' 'elephant-calc' 'elephant-clipboard' 'elephant-desktopapplications' 'elephant-files' 'elephant-menus' 'elephant-providerlist' 'elephant-runner' 'elephant-snippets' 'elephant-symbols' 'elephant-todo' 'elephant-unicode' 'elephant-websearch' 'elephant-windows')
provides=('elephant' 'elephant-nirisessions' 'elephant-archlinuxpkgs' 'elephant-bluetooth' 'elephant-calc' 'elephant-clipboard' 'elephant-desktopapplications' 'elephant-files' 'elephant-menus' 'elephant-providerlist' 'elephant-runner' 'elephant-snippets' 'elephant-symbols' 'elephant-todo' 'elephant-unicode' 'elephant-websearch' 'elephant-windows')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5f28a39d4eea2447d7fc5b2651ebd0cf91b3e141064690ec2cc259af1764459e')

build() {
    # Build main elephant binary
    cd elephant-${pkgver}/cmd/elephant
    go build -buildvcs=false -x -o elephant -trimpath

    # Build all provider plugins
    cd ../../internal/providers

    # Build each provider
    for provider in archlinuxpkgs 1password bookmarks bluetooth nirisessions calc clipboard desktopapplications files menus providerlist runner snippets symbols todo unicode websearch windows; do
        cd $provider
        go build -buildvcs=false -buildmode=plugin -trimpath
        cd ..
    done
}

package() {
    # Install main elephant binary
    cd elephant-${pkgver}/cmd/elephant
    install -Dm 755 elephant -t "${pkgdir}/usr/bin"

    # Install all provider plugins
    cd ../../internal/providers
    for provider in archlinuxpkgs bookmarks 1password nirisessions bluetooth calc clipboard desktopapplications files menus providerlist runner snippets symbols todo unicode websearch windows; do
        install -Dm 755 $provider/$provider.so -t "${pkgdir}/etc/xdg/elephant/providers"
    done

    # Install license
    cd ../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
