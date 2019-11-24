pkgname=raphnet-manager
pkgver=r364.62fecb4
pkgrel=1
pkgdesc="Raphnet USB adapter management tools"
arch=("x86_64")
license=("GPL3")
source=("git+https://github.com/raphnet/gcn64tools.git"
        "https://gist.githubusercontent.com/aconscious/45070a48fb6cb0bfa2f0287307f40202/raw/c961dcddb3f8018da38aba2d20d9bc5735cc3c72/raphnet%2520adapter%2520manager")
md5sums=("SKIP"
         "0ad61fc552c3d984fc9f23f3e0a46b65")
_upstreamrepo="gcn64tools"

pkgver() {
    cd "$_upstreamrepo/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_upstreamrepo/src/"
    make
}

prepare() {
    cd "$_upstreamrepo/src/"
    convert icon.ico icon.png
}

package() {
    cd "$_upstreamrepo/scripts/"
    install -dm 755 "$pkgdir/etc/udev/rules.d/"
    install -dm 755 "$pkgdir/usr/bin"
    install -dm 755 "$pkgdir/usr/share/pixmaps"
    install -dm 755 "$pkgdir/usr/share/applications"
    install -m 644 "10-raphnet.rules" "$pkgdir/etc/udev/rules.d/10-raphnet.rules"
    cd "../src/"
    install -m 644 icon-0.png "$pkgdir/usr/share/pixmaps/gcn64ctl_gui.png"
    make PREFIX="$pkgdir/usr" install
    cd "$srcdir"
    install -m 644 "raphnet%2520adapter%2520manager" "$pkgdir/usr/share/applications/gcn64ctl_gui.desktop"
}
