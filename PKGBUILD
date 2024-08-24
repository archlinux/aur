# Maintainer: SelfRef <arch@selfref.dev>

# NOTE: This package installs all theme components that can be installed system-wide
#       except Plus! Theme Conversion that's available in separate package `chicago95-plus[-git]`.
#       Manual steps are required to enable theme components as described in manual:
#       https://github.com/grassmunk/Chicago95/blob/master/INSTALL.md#config_theme
#       The Extras components are included in this package and are installed under `/usr/share/chicago95`.

_basename=chicago95
pkgname="${_basename}-theme"
pkgver=3.0.1
pkgrel=4
pkgdesc="A rendition of everyone's favorite 1995 Microsoft operating system for Linux (complete theme, stable version)"
arch=('any')
url="https://github.com/grassmunk/Chicago95"
license=('GPL')
makedepends=('git' 'zip')
optdepends=(
	'libcanberra: Sound theme'
	'qt5-styleplugins: QT theme'
	'ttf-ms-fonts: MS fonts'
	'lightdm-webkit2-greeter: LightDM theme'
	'chicago95-plus: Plus! theme generator'
)
provides=(
	'chicago95-theme'
	'chicago95-gtk-theme'
	'chicago95-icon-theme'
	'chicago95-cursor-theme'
	'chicago95-sound-theme'
	'chicago95-plymouth-theme'
	'chicago95-sddm-theme'
	'chicago95-lightdm-webkit-theme'
	'chicago95-libreoffice-theme'
)
conflicts=(
	'chicago95'
	'chicago95-gtk-theme'
	'chicago95-icon-theme'
	'xcursor-chicago95'
	'chicago95-sddm-theme-git'
)
source=("chicago95::git+https://github.com/grassmunk/Chicago95.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$_basename"
	if [ -d Extras/libreoffice-chicago95-iconset/iconsets/c95 ]; then
		cd Extras/libreoffice-chicago95-iconset/iconsets/c95
		zip -r images_chicago95.zip *
		cd -
	else
		echo '[W] LibreOffice theme not found, skipping'
	fi

	# Fix for current version where only archive is available
	if [ ! -d KDE/SDDM/Chicago95 ]; then
		tar -xzf KDE/SDDM/Chicago95.tar.gz -C KDE/SDDM
	fi
}

package() {
	cd "$_basename"

	# Components
	install -dm755 "$pkgdir"/usr/share/{themes,icons,fonts,sounds,backgrounds,plymouth/themes,lightdm-webkit/themes,sddm/themes,plasma/look-and-feel,xfce4/terminal/colorschemes,chicago95}
	cp -r Theme/*/ "$pkgdir/usr/share/themes"
	cp -r Icons/*/ "$pkgdir/usr/share/icons"
	cp -r Cursors/*/ "$pkgdir/usr/share/icons"
	cp -r sounds/*/ "$pkgdir/usr/share/sounds"
	cp -r Fonts/vga_font "$pkgdir/usr/share/fonts"
	cp -r Fonts/bitmap/cronyx-cyrillic "$pkgdir/usr/share/fonts"
	cp -r Lightdm/*/ "$pkgdir/usr/share/lightdm-webkit/themes"
	cp -r KDE/SDDM/*/ "$pkgdir/usr/share/sddm/themes"
	cp -r KDE/Splash/*/ "$pkgdir/usr/share/plasma/look-and-feel"
	cp -r Plymouth/*/ "$pkgdir/usr/share/plymouth/themes"

	# Extras
	cp -r Extras/* "$pkgdir/usr/share/chicago95"
	cp sounds/chicago95-startup.desktop "$pkgdir/usr/share/chicago95"
	mv "$pkgdir/usr/share/chicago95/Chicago95.theme" "$pkgdir/usr/share/xfce4/terminal/colorschemes/Chicago95.theme"
	mv "$pkgdir/usr/share/chicago95/Backgrounds" "$pkgdir/usr/share/backgrounds/chicago95"

	# LibreOffice theme
	LIBREOFFICETHEME=Extras/libreoffice-chicago95-iconset/iconsets/c95/images_chicago95.zip
	if [ -f "$LIBREOFFICETHEME" ]; then
		install -Dm644 "$LIBREOFFICETHEME" "$pkgdir/usr/lib/libreoffice/share/config/images_chicago95.zip"
	fi
}
