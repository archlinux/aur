# Maintainer: Rolf van Kleef <aur@rolfvankleef.nl>
# Contributor: Gregory Goijaerts <crecketgaming@gmail.com>
# Contributor: Dennis Snijder <dennissnijder97@gmail.com>
# Contributor: Nick Duijvelshoff <nick@duijvelshoff.com>
# Contributor: basst85 <bastiaan85@gmail.com>
# Contributor: Kees Kluskens
# Contributor: TimZ99
# Contributor: Emile Bons

pkgname="bunq-desktop-git"
pkgver=0.8.1.r53.g33c483b
pkgrel=1
pkgdesc="A desktop implementation for the bunq API"
url="https://github.com/BunqCommunity/BunqDesktop"
provides=('bunq-desktop')
conflicts=(
	'bunq-desktop-src'
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
	"$pkgname"::"git://github.com/BunqCommunity/BunqDesktop.git"
	"$pkgname.desktop"
)

sha256sums=(
	"SKIP"
	"34fd4c2b947cdd081e961b38d83582e27328b430a51580f78dd4c8769712cfd1"
)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
	cd $srcdir/$pkgname

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
		$srcdir/$pkgname/dist/linux-unpacked\
		$pkgdir/opt/$pkgname

	cp -R\
		$srcdir/$pkgname/LICENSE\
		$pkgdir

	cp\
		$srcdir/$pkgname/build/icons/512x512.png\
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

