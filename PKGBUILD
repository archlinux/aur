# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Marcus Andersson <m.andersson0602 at gmail.com>

_pkgname=icons-in-terminal
pkgname=${_pkgname}-git
pkgver=r93.b12286d
pkgrel=1
pkgdesc="Icon fonts in terminal without a need for replacing or patching existing"
url="https://github.com/sebastiencs/$_pkgname"
arch=('any')
license=('custom:MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('bash')
makedepends=('git' 'xmlstarlet' 'fontconfig')
source=(
    "$_pkgname::git+${url}.git"
    "$_pkgname-PR50.patch::${url}/pull/50.patch")
sha256sums=('SKIP'
            'd22635d1c6e936d7cb0ffa76448cc301a10ae48fbc29b23b0f8eab6dbd066c6e')

_srcdir="$_pkgname"

pkgver() {
    cd "$_srcdir"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_srcdir"
    
    patch -p1 -i "../$_pkgname-PR50.patch"

    sed -i 's filename="./build/mapping.txt" filename="/usr/share/icons-in-terminal/mapping.txt" ' print_icons.sh
    ./scripts/generate_fontconfig.sh > "30-$_pkgname.conf"
}

package() {
    cd "$_srcdir"

    if [ ! -f "/usr/share/fontconfig/conf.avail/30-$_pkgname.conf" ]; then
        install -dm755 "$pkgdir/etc/fonts/conf.d"
        install -Dm644 "30-$_pkgname.conf"       "$pkgdir/usr/share/fontconfig/conf.avail/30-$_pkgname.conf"
        ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir/etc/fonts/conf.d/"
    fi

    install -Dm755 "print_icons.sh"         "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "README.md"              "$pkgdir/usr/share/$_pkgname/README.md"
    install -Dm644 "LICENSE"                "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "build/$_pkgname.ttf"     "$pkgdir/usr/share/fonts/TTF/$_pkgname.ttf"

    find build/ -type f ! -name "*.ttf" -exec install -m644 {} "$pkgdir/usr/share/$_pkgname/" \;

    install='icons-in-terminal.install'
}
