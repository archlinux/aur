# Maintainer: Damglador <vse.stopchanskyi@gmail.com>
# Contributor: dillard
# Thanks krunner-vscodeprojects-git for the base for this PKGBUILD

_pkgname=krunner-steam
pkgname=$_pkgname-git
pkgver=r17.b86af5d
pkgrel=2
pkgdesc="Launch Steam games from Krunner"
arch=("any")
url="https://github.com/xTibor/krunner-steam.git"
license=("LGPL-2.0-or-later")
depends=("python-gobject" "krunner" "kservice")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
install="${_pkgname}.install"
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    install_path="$pkgdir/usr/lib/$_pkgname"

    # Install the python source files
    install -d "$install_path"
    install -m644 src/*             "$install_path/"
    install -m755 src/main.py       "$install_path/"

    # Install the license
    install -Dm644 LICENSE -t       "$pkgdir/usr/share/licenses/$_pkgname/"

    # Install the KRunner plugin metadata
    install -Dm644 krunnersteam.desktop "$pkgdir/usr/share/krunner/dbusplugins/krunnersteam.desktop"

    # Install and create the D-Bus service file
    install -d "$pkgdir/usr/share/dbus-1/services"
    cat <<EOF > "$pkgdir/usr/share/dbus-1/services/com.github.xtibor.krunnersteam.service"
[D-BUS Service]
Name=com.github.xtibor.krunnersteam
Exec=/usr/lib/$_pkgname/main.py
EOF
}
