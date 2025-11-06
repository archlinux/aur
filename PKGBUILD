# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=elephant-all-git
pkgver=r405.bfd423d
pkgrel=5
pkgdesc='elephant + all official elephant providers'
url='https://github.com/abenz1267/elephant'
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('libqalculate' 'wl-clipboard' 'imagemagick' 'fd' 'wtype' 'sqlite3' 'jq')
makedepends=('go' 'git')
conflicts=('elephant' 'elephant-1password' 'elephant-bookmarks' 'elephant-archlinuxpkgs' 'elephant-bluetooth' 'elephant-calc' 'elephant-clipboard' 'elephant-desktopapplications' 'elephant-files' 'elephant-menus' 'elephant-nirisessions' 'elephant-providerlist' 'elephant-runner' 'elephant-snippets' 'elephant-symbols' 'elephant-todo' 'elephant-unicode' 'elephant-websearch' 'elephant-windows')
provides=('elephant' 'elephant-1password' 'elephant-bookmarks' 'elephant-archlinuxpkgs' 'elephant-bluetooth' 'elephant-calc' 'elephant-clipboard' 'elephant-desktopapplications' 'elephant-files' 'elephant-menus' 'elephant-nirisessions' 'elephant-providerlist' 'elephant-runner' 'elephant-snippets' 'elephant-symbols' 'elephant-todo' 'elephant-unicode' 'elephant-websearch' 'elephant-windows')
source=("${pkgname%-git}::git+${url}.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    # Build main elephant binary
    cd "${pkgname%-git}/cmd/elephant"
    go build -buildvcs=false -x -o elephant -trimpath

    # Build all provider plugins
    cd ../../internal/providers

    # Build each provider
    for provider in archlinuxpkgs bookmarks 1password bluetooth calc clipboard desktopapplications files menus nirisessions providerlist runner snippets symbols todo unicode websearch windows; do
        cd $provider
        go build -buildvcs=false -buildmode=plugin -trimpath
        cd ..
    done
}

package() {
    # Install main elephant binary
    cd "${pkgname%-git}/cmd/elephant"
    install -Dm 755 elephant -t "${pkgdir}/usr/bin"

    # Install all provider plugins
    cd ../../internal/providers
    for provider in archlinuxpkgs 1password bookmarks bluetooth calc clipboard desktopapplications files menus nirisessions providerlist runner snippets symbols todo unicode websearch windows; do
        install -Dm 755 $provider/$provider.so -t "${pkgdir}/etc/xdg/elephant/providers"
    done

    # Install license
    cd ../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
