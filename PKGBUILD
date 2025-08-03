# Maintainer: Damglador <vse.stopchanskyi@gmail.com>
# Thanks krunner-vscodeprojects-git for the base for this PKGBUILD

_pkgname=krunner-steam
pkgname=$_pkgname-git
pkgver=r16.da5747c
pkgrel=2
pkgdesc="Launch Steam games from Krunner"
arch=('any')
url="https://github.com/xTibor/krunner-steam.git"
depends=(python-gobject krunner kservice)
makedepends=(git)
provides=("$_pkgname")
conflicts=("$_pkgname")
install="${_pkgname}.install"
license=(LGPL-2.0-or-later)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $_pkgname
    site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

    install -dm0755 "$pkgdir/usr/share/dbus-1/services"
    install -dm0755 "$pkgdir/$site_packages"
    mv src "$pkgdir/$site_packages/$_pkgname"

    install -Dm0644 krunnersteam.desktop "$pkgdir/usr/share/krunner/dbusplugins/krunnersteam.desktop"
    cat <<EOF > "$pkgdir/usr/share/dbus-1/services/com.github.xtibor.krunnersteam.service"
[D-BUS Service]
Name=com.github.xtibor.krunnersteam
Exec="$site_packages/$_pkgname/main.py"
EOF
}
