# Maintainer: Dimitris Lampridis <dlampridis@gmail.com>
# Contributor: Nicolas Lorin <androw95220@gmail.com>
# Contributor: Daniel McLarty <info@savagedevs.com>
pkgname='rose-pine-gtk-theme-full-git'
pkgver=2.2.0.r6.g598be13
pkgrel=1
pkgdesc="A GTK theme with the Rose Pine colour palette. Includes Icons. (git version)"
arch=(any)
url="https://github.com/rose-pine/gtk"
license=('MIT')
makedepends=('git')
provides=("rose-pine-gtk-theme-full=$pkgver" "rose-pine-gtk-theme=$pkgver")
conflicts=("rose-pine-gtk-theme-full" "rose-pine-gtk-theme")
options=(!strip !debug)
source=("$pkgname::git+https://github.com/rose-pine/gtk.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_build() {
	local _name="$1"
	mkdir -p "gtk3/$_name-gtk/gtk-4.0"
	cp "gtk4/$_name.css" "gtk3/$_name-gtk/gtk-4.0/gtk.css"
}

build() {
    cd "$pkgname"
    _build "rose-pine"
    _build "rose-pine-dawn"
    _build "rose-pine-moon"
}

_package() {
	local _name="$1"
	install -d "$pkgdir/usr/share/themes/$_name/"
	cp -a --no-preserve=ownership "$_name"/ "$pkgdir/usr/share/themes/"
}

_package_icons() {
    local _icon_name="$1"
    install -d "$pkgdir/usr/share/icons/$_icon_name/"
    cp -a --no-preserve=ownership "icons/$_icon_name/" "$pkgdir/usr/share/icons/"
}

package() {
    cd "$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd gtk3
    _package "rose-pine-gtk"
    _package "rose-pine-moon-gtk"
    _package "rose-pine-dawn-gtk"
    cd ..
    _package_icons "rose-pine-icons"
    _package_icons "rose-pine-dawn-icons"
    _package_icons "rose-pine-moon-icons"
}
