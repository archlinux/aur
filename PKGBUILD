# Maintainer: Paulo Fino <somepaulo@duck.com>

pkgname=adwaita-colors-icon-theme-git
_reponame=Adwaita-colors
pkgver=2.6.r0.g7d838af

pkgrel=2
pkgdesc="Adwaita Colors enhances the Adwaita icon theme by integrating GNOME’s accent color feature. It ensures that your Adwaita icons reflect the same accent color as your GNOME theme."
arch=(any)
url="https://github.com/dpejoh/$_reponame"
license=(GPL3)
depends=("adwaita-icon-theme" "adwaita-icon-theme-legacy")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/$_reponame"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "$srcdir/$_reponame"
    ./setup -i -f -p "$srcdir/generated-icons"
}

package() {
    install -dm755 "$pkgdir/usr/share/icons"

    cp -a "$srcdir/generated-icons"/Adwaita-* \
          "$pkgdir/usr/share/icons/"

    find "$pkgdir/usr/share/icons" \
        -name index.theme \
        -exec sed -i \
            's/Inherits=Adwaita,/Inherits=MoreWaita,Adwaita,/g' \
            {} +
}
