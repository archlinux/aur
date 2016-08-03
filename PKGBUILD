# Maintainer:	M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor:	Bjoern Franke <bjo at nord-west.org>
# Contributor:	flan_suse

pkgname=xfce-theme-greybird
pkgver=3.18.0
pkgrel=2
pkgdesc="A grey and blue Xfce theme."
arch=('any')
url="https://github.com/shimmerproject/Greybird"
license=('CCPL:by-sa-3.0' 'GPL')
groups=('xfce-themes-shimmer-collection')
conflicts=("$pkgname-git")
depends=('gtk-engine-murrine')
makedepends=('git')
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme'
	    'gtk3: required for CSS/GTK3 theme'
	    'lightdm-gtk-greeter: required for the LightDM GTK theme'
	    'lightdm-unity-greeter: required for the LightDM Unity theme'
	    'shimmer-wallpapers: contains the Greybird wallpaper, among others'
	    'lib32-gtk-engine-murrine: required for multilib')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/shimmerproject/Greybird/archive/v$pkgver.tar.gz"
	'Greybird-GTK+3.20.patch::https://bugzilla.redhat.com/attachment.cgi?id=1167162')
sha256sums=('85a2d6bb73c32fb1caba2e5881dcf604af5b394bb8818058df874398e6dfe96f'
	    '72843b8c0e8d57d0341620656c15143e036036bddc763398b39654d78f7d2e22')

prepare() {
	cd "$srcdir/Greybird-$pkgver"
	git apply "$srcdir/Greybird-GTK+3.20.patch" || echo "0" > /dev/null
}

package() {
	cd "$srcdir/Greybird-$pkgver"

	# install emerald theme
	install -d -m 755 "$pkgdir/usr/share/emerald/themes/Greybird"
	tar zxf Greybird.emerald -C "$pkgdir/usr/share/emerald/themes/Greybird/"

	# create theme dirs
	install -d -m 755 "$pkgdir/usr/share/themes/"Greybird{,-compact/xfwm4,-a11y/xfwm4,-bright/xfce-notify-4.0}

	# install compact theme
	install -m 644 "$srcdir/Greybird-$pkgver/xfwm4-compact/"* \
	"$pkgdir/usr/share/themes/Greybird-compact/xfwm4/"

	# install accessivility theme
	install -m 644 "$srcdir/Greybird-$pkgver/xfwm4-a11y/"* \
	"$pkgdir/usr/share/themes/Greybird-a11y/xfwm4/"

	# install xfce-notify bright
	install -m 644 "$srcdir/Greybird-$pkgver/xfce-notify-4.0_bright/"* \
	"$pkgdir/usr/share/themes/Greybird-bright/xfce-notify-4.0/"

	# clean up
	rm -rf {.git,.gitignore,Greybird.emerald,LICENSE.{CC,GPL},README,xfwm4_compact,xfce4_ally,xfce-notify-4.0_bright}

	# install theme
	cp -r . "$pkgdir/usr/share/themes/Greybird/"
}
