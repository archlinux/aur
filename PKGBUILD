# Maintainer: SaultDon <sault.don gmail>
pkgname=whitebox
pkgver=3.2.3
pkgrel=1
_pkgname="Whitebox_${pkgver//./_}"
pkgdesc="A Geographic information system (GIS) and remote sensing package intended for advanced geospatial analysis and data visualization."
arch=('any')
url="http://www.uoguelph.ca/~hydrogeo/Whitebox/index.html"
license=('GPL3')
depends=('jre8-openjdk' 'bash')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname-svn")
install=$pkgname.install
changelog=$pkgname.changelog
source=("$pkgname-$pkgver.zip::http://www.uoguelph.ca/~hydrogeo/Whitebox/WhiteboxGAT.zip"
	"$pkgname.sh"
	"$pkgname.desktop")
noextract=($pkgname-$pkgver.zip)
sha1sums=('15da81206c850e7b88c34fc602d5576912383d24'
          'a5864fbbc835f91b210281a6cdddea3c8572faae'
          '293d4fe730407a8d743467580d234a8f7b3ba9b8')

package(){

	msg2 "Installing desktop entry..."
	install -Dm644 $srcdir/$pkgname.desktop \
	  "$pkgdir/usr/share/applications/$pkgname.desktop"

	msg2 "Installing package..."
	install -d $pkgdir/opt

	install -D $srcdir/$pkgname.sh \
	  "$pkgdir/opt/$pkgname/$pkgname.sh"

	bsdtar --no-same-owner \
	       -s /$_pkgname/$pkgname/ \
	       --exclude .DS_Store \
           --exclude __MACOSX \
	       --directory $pkgdir/opt \
	       -xf $pkgname-$pkgver.zip $_pkgname

	msg2 "Installing license..."
	install -d "$pkgdir/usr/share/licenses/$pkgname"
    sed -n '/GNU GENERAL PUBLIC LICENSE/,/why-not-lgpl.html>./p' "$pkgdir/opt/$pkgname/ReleaseNotes.txt" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    msg2 "Installing icon..."
    install -Dm644 $pkgdir/opt/$pkgname/resources/Images/wbGAT.png \
      "$pkgdir/usr/share/pixmaps/$pkgname.png"
	
	msg2 "Making required folders/files writeable..."
    find $pkgdir/opt/$pkgname -exec chmod 777 '{}' \;
	find $pkgdir/opt/$pkgname -type f -name '*.jar' -exec chmod go-w '{}' \;
	find $pkgdir/opt/$pkgname -type f -name '*.java' -exec chmod go-w '{}' \;
	find $pkgdir/opt/$pkgname/resources/Images -exec chmod go-w '{}' \;
}
