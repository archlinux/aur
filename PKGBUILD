_pkgname=plasma-splash-catppuccin-mocha
pkgname=$_pkgname-git
pkgver=0.2.7.r0.g4e2f142
pkgrel=1
pkgdesc="Soothing pastel splash screens for KDE Plasma - Mocha"
arch=(any)
url="https://github.com/catppuccin/kde"
license=('MIT')
depends=('plasma-desktop')
makedepends=('git' 'sed')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
pkgver(){
	cd "$srcdir/$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}
build() {
	cd "$srcdir/$_pkgname"
	BuildSplashScreen(){
		MANTLECOLOR="#181825"
		ACCENTCOLOR="$1"
		ACCENTNAME="$2"
		FLAVOURNAME="Mocha"
		SPLASHSCREENNAME="Catppuccin-$FLAVOURNAME-$ACCENTNAME-splash"

		mkdir -p "./dist/$SPLASHSCREENNAME/contents/splash/images/"
		mkdir -p "./dist/$SPLASHSCREENNAME/contents/previews"


		# Hydrate Dummy colors according to Pallete
		FLAVOURNAME="Mocha" ./Installer/color-build.sh -s ./Resources/splash-screen/contents/splash/images/busywidget.svg -o ./dist/"$SPLASHSCREENNAME"/contents/splash/images/_busywidget.svg
		# Replace Accent in colors file
		sed "s/REPLACE--ACCENT/$ACCENTCOLOR/g" ./dist/"$SPLASHSCREENNAME"/contents/splash/images/_busywidget.svg > ./dist/"$SPLASHSCREENNAME"/contents/splash/images/busywidget.svg
		# Cleanup temporary file
		rm ./dist/"$SPLASHSCREENNAME"/contents/splash/images/_busywidget.svg

		# Hydrate Dummy colors according to Pallette (QML file)
		sed -e s/REPLACE--MANTLE/"$MANTLECOLOR"/g ./Resources/splash-screen/contents/splash/Splash.qml > ./dist/"$SPLASHSCREENNAME"/contents/splash/Splash.qml
		# Add CTP Logo
		cp ./Resources/splash-screen/contents/splash/images/Logo.png "./dist/$SPLASHSCREENNAME/contents/splash/images/Logo.png"
		sed "s/--accentName/$ACCENTNAME/g; s/--flavour/$FLAVOURNAME/g" ./Resources/splash-screen/metadata.json > ./dist/"$SPLASHSCREENNAME"/metadata.json
		cp ./Resources/splash-previews/"$FLAVOURNAME".png "./dist/$SPLASHSCREENNAME/contents/previews/splash.png"
		# cp ./Resources/splash-previews/"$FLAVOURNAME".png ./dist/"$SPLASHSCREENNAME"/contents/previews/preview.png
	}

	BuildSplashScreen "245,224,220" Rosewater
	BuildSplashScreen "242,205,205" Flamingo
	BuildSplashScreen "245,194,231" Pink
	BuildSplashScreen "203,166,247" Mauve
	BuildSplashScreen "243,139,168" Red
	BuildSplashScreen "235,160,172" Maroon
	BuildSplashScreen "250,179,135" Peach
	BuildSplashScreen "249,226,175" Yellow
	BuildSplashScreen "166,227,161" Green
	BuildSplashScreen "148,226,213" Teal
	BuildSplashScreen "137,220,235" Sky
	BuildSplashScreen "116,199,236" Sapphire
	BuildSplashScreen "137,180,250" Blue
	BuildSplashScreen "180, 190, 254" Lavender

}

package() {
	cd "$srcdir/$_pkgname"
	mkdir -p "$pkgdir/usr/share/plasma/look-and-feel"
	cp -r ./dist/* "$pkgdir/usr/share/plasma/look-and-feel"
}
