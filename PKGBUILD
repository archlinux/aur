# Maintainer: Darvin Delgado <dnmodder@gmail.com>
_pkgbase=rom-properties
pkgbase=rom-properties-all
pkgver=1.4.3
pkgrel=7
pkgdesc="ROM Properties Page shell extension meta package"
arch=('x86_64')
url="https://github.com/GerbilSoft/rom-properties"
license=('GPL2')
depends=('zlib' 'tinyxml2' 'nettle' 'libpng' 'curl' 'libjpeg-turbo' 'glibc')
makedepends=('cmake')
source=("$_pkgbase-$pkgver.tar.gz::https://github.com/GerbilSoft/rom-properties/archive/v$pkgver.tar.gz")
sha256sums=('21e2ac5e4f90a8b64837f8aaeac401e4a14ad1a6a8ba604c16f10182f3617655')

prepare() {
	cd "$_pkgbase-$pkgver"
	mkdir build
}

build() {
	cd "$_pkgbase-$pkgver/build"
	cmake -DUSE_INTERNAL_XML=False -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

_package-all() {
	depends=('rom-properties-docs' 'rom-properties-cli' 'rom-properties-stub' 'rom-properties-gtk3-common' 'rom-properties-thumbnailer-dbus' 'rom-properties-xfce' 'rom-properties-xdg' 'rom-properties-mate' 'rom-properties-gnome' 'rom-properties-kde5' 'rom-properties-lang')
}

_package-docs() {
	pkgdesc="ROM Properties Page shell extension documentation"

	cd "$_pkgbase-$pkgver/build/doc"

	make DESTDIR="$pkgdir" install
}

_package-cli() {
	pkgdesc="ROM Properties Page shell extension (command line version)"
	depends=('rom-properties-docs' 'zlib' 'tinyxml2' 'nettle' 'libpng' 'curl' 'libjpeg-turbo' 'glibc')
	optdepends=("rom-properties-lang: localization")

	cd "$_pkgbase-$pkgver/build/src/rpcli"

	make DESTDIR="$pkgdir" install
}

_package-gnome() {
	pkgdesc="ROM Properties Page shell extension for GNOME"
	depends=('rom-properties-docs' 'rom-properties-gtk3-common' 'rom-properties-stub' 'libnautilus-extension' 'cairo' 'gtk3' 'glib2' 'zlib' 'tinyxml2' 'nettle' 'libpng' 'curl' 'libjpeg-turbo' 'glibc')
	optdepends=('rom-properties-lang: localization')

	cd "$_pkgbase-$pkgver/build/src/gtk/gnome"

	make DESTDIR="$pkgdir" install
}

_package-gtk3-common() {
	pkgdesc="ROM Properties Page shell extension (common files for GNOME and MATE)"
	depends=('rom-properties-stub')
	optdepends=('rom-properties-lang: localization')

	cd "$_pkgbase-$pkgver/build/src/gtk"

	make DESTDIR="$pkgdir" install/local
}

_package-kde5() {
	pkgdesc="ROM Properties Page shell extension for KDE 5"
	depends=('kio' 'kfilemetadata' 'kwidgetsaddons' 'qt5-base' 'kcoreaddons' 'zlib' 'tinyxml2' 'nettle' 'libpng' 'curl' 'libjpeg-turbo' 'glibc')
	optdepends=('rom-properties-lang: localization')

	cd "$_pkgbase-$pkgver/build/src/kde"

	make DESTDIR="$pkgdir" install
}

_package-lang() {
	pkgdesc="ROM Properties Page shell extension language files"

	cd "$_pkgbase-$pkgver/build/locale"

	make DESTDIR="$pkgdir" install
}

_package-mate() {
	pkgdesc="ROM Properties Page shell extension for GNOME"
	depends=('rom-properties-docs' 'rom-properties-gtk3-common' 'rom-properties-stub' 'caja' 'cairo' 'gtk3' 'glib2' 'zlib' 'tinyxml2' 'nettle' 'libpng' 'curl' 'libjpeg-turbo' 'glibc')
	optdepends=('rom-properties-lang: localization')

	cd "$_pkgbase-$pkgver/build/src/gtk/mate"

	make DESTDIR="$pkgdir" install
}

_package-stub() {
	pkgdesc="ROM Properties Page shell extension (stub executable)"
	optdepends=('rom-properties-lang: localization')

	cd "$_pkgbase-$pkgver/build/src/rp-stub"

	make DESTDIR="$pkgdir" install
}

_package-thumbnailer-dbus() {
	pkgdesc="ROM Properties Page shell extension (D-Bus Thumbnailer service for XFCE)"
	depends=('rom-properties-docs' 'thunar' 'glib2')
	optdepends=("rom-properties-lang: localization")

	cd "$_pkgbase-$pkgver/build/src/gtk/thumbnailer-dbus"

	make DESTDIR="$pkgdir" install
}

_package-xdg() {
	pkgdesc="ROM Properties Page shell extension MIME files"
	depends=('rom-properties-xfce')

	cd "$_pkgbase-$pkgver/build/xdg"

	make DESTDIR="$pkgdir" install
}

_package-xfce() {
	pkgdesc="ROM Properties Page shell extension for XFCE (GTK+ 3.x)"
	depends=('rom-properties-docs' 'rom-properties-thumbnailer-dbus' 'thunar' 'cairo' 'gtk3' 'glib2' 'zlib' 'tinyxml2' 'nettle' 'libpng' 'curl' 'libjpeg-turbo' 'glibc')
	optdepends=("rom-properties-lang: localization")

	cd "$_pkgbase-$pkgver/build/src/gtk/xfce3"

	make DESTDIR="$pkgdir" install
}

pkgname=("$_pkgbase-all" "$_pkgbase-docs" "$_pkgbase-cli" "$_pkgbase-gnome" "$_pkgbase-gtk3-common" "$_pkgbase-kde5" "$_pkgbase-lang" "$_pkgbase-mate" "$_pkgbase-stub" "$_pkgbase-thumbnailer-dbus" "$_pkgbase-xdg" "$_pkgbase-xfce")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$_pkgbase}")
    _package${_p#$_pkgbase}
  }"
done
