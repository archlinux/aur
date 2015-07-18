# Maintainer: Giovanni Santini "ItachiSan" <giovannisantini93@yahoo.it>

pkgname=eoloapp
_airName="EOLOapp.air"
pkgver=2.0.5
pkgrel=1
pkgdesc="Allows NGI S.P.A EOLO clients to see their avaible high-bandwidth traffic usage."
url="https://github.com/EOLOlab/EOLOapp"
arch=('any')
license=('unknown')
depends=('adobe-air')
makedepends=('unzip') # For extracting the app
source=(
	https://www.eolo.it/docroot/media/eoloApp/$_airName
	${pkgname}.desktop
	${pkgname}.sh
	)
sha1sums=('dc22911f1259e0260bc8a4857d2e2098a53bb0e7'
          'a128f54dfd0a9032900fffdc7c79553727f246f9'
          '2f151b095bb0e926672030edfcd86094a299ef8a')

# bsdtar gives errors, so let's handle it manually
noextract=($_airName)
prepare() {
	unzip "$_airName" -d "$srcdir/$pkgname-$pkgver"
}

package() {
	# Installing files from the AIR archive
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/opt/airapps/EOLOapp/"
	cp -r . "$pkgdir/opt/airapps/EOLOapp/"

	# Installing icons
	cd assets
	for image in $(ls)
	do
		# Getting image size (using Bash variables substitutions)
		size=${image#icon}	# Removing 'icon' from start, then '.png' from end
		size=${size%.png}	# Here we have the number
		size=${size##*[!0-9]*}	# Save only numbers
		if [ ! -z $size ]
		then
			install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
			install $image "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
		fi
	done

	# Installing the desktop file
	install -D "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	# And the executable wrapper
	install -D "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
