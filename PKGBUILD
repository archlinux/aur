# Maintainer: Nazar Vinnichuk <nazar.vinnichuk at tutanota dot com>
pkgname=pacwall-git
_pkgname=${pkgname%-git}
pkgver=2.2.r1.g045cbed
pkgrel=1
pkgdesc="A live wallpaper that shows the dependency graph and status of installed packages."
url="http://github.com/Kharacternyk/${_pkgname}"
arch=('any')
license=('GPL3')
depends=('graphviz' 'fakeroot' 'libconfig')
makedepends=('git')
conflicts=("${_pkgname}")
source=("$_pkgname::git+https://github.com/Kharacternyk/$_pkgname.git#branch=master")
sha256sums=(SKIP)

pkgver() {
    cd "$srcdir/$_pkgname"
    local _version="$(git describe --tags --match 'v*' | sed 's/-/.r/' | sed 's/-/./')"
    printf "${_version#v}"
}

build() {
    cd "$srcdir/$_pkgname/src"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 src/pacwall "$pkgdir/usr/bin/pacwall"

    install -Dm644 /dev/null "$pkgdir/var/lib/pacwall/systemd/trigger"
    install -Dm644 pacman/10-pacwall.hook "$pkgdir/usr/share/libalpm/hooks/10-pacwall.hook"
    install -Dm644 README.rst "$pkgdir/usr/share/doc/pacwall/README.rst"

    cd scripts/
    for _FILE in *; do
        install -Dm755 "$_FILE" "$pkgdir/usr/lib/pacwall/$_FILE"
    done
    cd ../examples/
    for _FILE in */*; do
        install -Dm644 "$_FILE" "$pkgdir/usr/share/pacwall/examples/$_FILE"
    done
    cd ../systemd/
    for _FILE in *; do
        install -Dm644 "$_FILE" "$pkgdir/usr/lib/systemd/user/$_FILE"
    done
}
