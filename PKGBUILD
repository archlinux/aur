# Maintainer: Jannick Kremer (jannick dot kremer at mailbox dot org)
# Contributor: Max le Fou (buttbadger at gmail dot com)

pkgname=ultrastar-creator
pkgver=1.3.1
pkgrel=2
pkgdesc="Qt program used to generate USDX songs from scratch"
url=https://github.com/UltraStar-Deluxe/UltraStar-Creator
license=('GPL2')
arch=('x86_64')

depends=('qt6-base' 'qt6-tools' 'git' 'libbass' 'taglib' 'cld2-git')

source=("git+${url}#tag=${pkgver}"
		"git+https://github.com/CLD2Owners/cld2.git#commit=b56fa78"
		"ultrastar-creator.desktop"
		"ultrastar-creator")

md5sums=('4a7a95b4cf9ba6e396931957b174c854'
         '8991b1b292b95e79f8e808dea494a4a4'
         '6d4f4343af476267d3219eb7d9bcc7cf'
         'f5ff1a7eb66be5ee58c3dcec1d6f3f54')
	
prepare()
{
	cd "${srcdir}/UltraStar-Creator"
	git submodule init
	git config submodule.include/cld2.url "$srcdir/cld2"
	git -c protocol.file.allow=always submodule update
}

build()
{
	cd "$srcdir/UltraStar-Creator/src/"
	qmake6 UltraStar-Creator.pro
	make
}
	
package()
{
	cd ..
	install -Dm644 "ultrastar-creator.desktop" "${pkgdir}/usr/share/applications/ultrastar-creator.desktop"
	install -Dm755 "ultrastar-creator" "${pkgdir}/usr/bin/ultrastar-creator"
	install -Dm644 "$srcdir/UltraStar-Creator/setup/unix/UltraStar-Creator.png" "${pkgdir}/usr/share/pixmaps/UltraStar-Creator.png"
	
	cd "$srcdir/UltraStar-Creator/bin/release"
	install -Dm755 "UltraStar-Creator" "$pkgdir/opt/$pkgname/UltraStar-Creator"
	
	cd "$srcdir/UltraStar-Creator/bin/release/lib"
	install -Dm644 "libbass.so" "$pkgdir/opt/$pkgname/lib/libbass.so"
	install -Dm644 "libbass_fx.so" "$pkgdir/opt/$pkgname/lib/libbass_fx.so"
}
