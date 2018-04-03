# Maintainer: Rolf van Kleef <aur@rolfvankleef.nl>
# Contributor: Gregory Goijaerts <crecketgaming@gmail.com>
# Contributor: Dennis Snijder <dennissnijder97@gmail.com>
# Contributor: Nick Duijvelshoff <nick@duijvelshoff.com>
# Contributor: basst85 <bastiaan85@gmail.com>
# Contributor: Kees Kluskens
# Contributor: TimZ99
# Contributor: Emile Bons

pkgname="bunq-desktop-src"
pkgver="0.8.1"
pkgrel=3
pkgdesc="A desktop implementation for the bunq API"
url="https://github.com/BunqCommunity/BunqDesktop"
provides=('bunq-desktop')
conflicts=(
	'bunq-desktop-git'
	'bunq-desktop-bin'
)

arch=(
	'x86_64'
)

license=(
	'MIT'
)

depends=(
	'nodejs'
)

makedepens=(
	'git'
	'yarn'
)

source=(
	"https://github.com/BunqCommunity/BunqDesktop/archive/${pkgver}.tar.gz"
	"bunq-desktop-src.desktop"
)

sha256sums=(
	"d89fad53a2b8dda0bd02bfc1a1bdd3edb3f1513215b7954970cec91fe024908d"
	"1d84f185830733bb38928fcaa33ffc0ba46140f7f116b4d5ad24c93a585a0ffa"
)

build() {
	cd BunqDesktop-$pkgver

	# Generate release files
	yarn && yarn release
}

package() {
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	mkdir $pkgdir/usr/share
	mkdir $pkgdir/usr/share/pixmaps
	mkdir $pkgdir/opt

	cp -R\
		BunqDesktop-$pkgver/dist/linux-unpacked\
		$pkgdir/opt/$pkgname

	cp -R\
		BunqDesktop-$pkgver/LICENSE\
		$pkgdir

	cp\
		BunqDesktop-$pkgver/build/icons/512x512.png\
		$pkgdir/usr/share/pixmaps/bunq.png
	
	pushd $pkgdir/usr/bin

	ln -s\
		../../opt/$pkgname/bunqdesktop\
		bunq-desktop-src

	popd

	desktop-file-install\
		$pkgname.desktop\
		--dir $pkgdir/usr/share/applications/
}

