# Maintainer: Im Trisha <imtrisha2324@gmail.com>


pkgname=my-dystopian-robot-girlfriend-bin
_binname="My Dystopian Robot Girlfriend.x86_64"
_gamename=my-dystopian-robot-girlfriend
_usi=io.itch.incontinentcell.my_dystopian_robot_girlfriend
_zipname=game-9678113.zip 
pkgver=0.96.5
pkgrel=1
epoch=
pkgdesc="18+ game developed by IncontinentCell"
arch=('x86_64')
url="https://incontinentcell.itch.io/factorial-omega"
license=('unknown')
depends=(gcc-libs glibc libgcc cairo pango glib2 dbus wayland libdecor bash)
makedepends=(itchio-downloader)
install=
source=("$_usi.desktop" "$_usi.metainfo.xml")
noextract=()
sha256sums=(
	3cc2cbf2253ed3b3d3ef50f58b332551825e1c61ff46aab7973cbf42182c39f4
	717ccb378dbb7d5988a2c39774c620a279599f5bcd7f9ad4f9e466e665faec4a
)
validpgpkeys=(7EE33A206D00744E04E335E62C06E71FC9A95C07)


prepare() {
    cd "$srcdir"

    itchio-downloader --url https://incontinentcell.itch.io/factorial-omega --platform linux --noCookieCache --downloadDirectory "$srcdir"

	echo "8bfee08017ac9c287607ed7e1bc634ca23ad1685cb3536832e83e09aef40feda  $srcdir/$_zipname" | sha256sum -c -

    bsdtar -xf "$srcdir/$_zipname"
}

# Took inspiration from photoqt-bin, many thanks!
package() {
	# install game data into /opt/my-dystopian-robot-girlfriend
	install -dm755 "$pkgdir/opt/$_gamename"
    cp -r "$srcdir/"* "$pkgdir/opt/$_gamename/"
	rm -f "$pkgdir/opt/$_gamename/$_usi.desktop" "$pkgdir/opt/$_gamename/$_usi.metainfo.xml" "$pkgdir/opt/$_gamename/$_zipname"

    install -Dm0755 /dev/stdin "$pkgdir/usr/bin/$_gamename" << EOF
#!/bin/sh
exec "/opt/$_gamename/$_binname" "$@"
EOF

	# install desktop file
	install -Dm0644 -t "$pkgdir/usr/share/applications/" $_usi.desktop

	# install metainfo
	install -Dm0644 -t "$pkgdir/usr/share/metainfo/" $_usi.metainfo.xml

	# install icon
	install -Dm0644 "$srcdir/My Dystopian Robot Girlfriend_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/icons/$_gamename.png"
}
