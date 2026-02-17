# Maintainer: AlienFromDia <zacharias@4zellen.se>
options=('!strip')
pkgname=mtg-forge-bin
pkgver=2.0.09
pkgrel=2
pkgdesc="An unofficial rules engine for the world's greatest card game."
arch=("any")
url="https://github.com/Card-Forge/forge/"
license=('GPL3')
depends=('java-runtime>=17')
conflicts=()
source=("https://github.com/Card-Forge/forge/releases/download/forge-${pkgver}/forge-installer-${pkgver}.tar.bz2"
    "forge.sh"
	"forge.desktop"
	"Forge.png")

# Upstream tarball lacks a top-level directory; extract directly to /opt
noextract=("forge-installer-${pkgver}.tar.bz2")

package() {
	# Creating target directory for unpacked upstream tarball
	install -d "$pkgdir/opt/Forge"

	# Extracts the tarball
	tar -xjf "$srcdir/forge-installer-${pkgver}.tar.bz2" -C "$pkgdir/opt/Forge/"

	# Copying launch wrapper script
	install -Dm755 "$srcdir/forge.sh" "$pkgdir/usr/bin/forge"

	# Replace the PKGVER placeholder in the script
	sed -i "s/__PKGVER__/$pkgver/g" "$pkgdir/usr/bin/forge"

	# Copying files related to .desktop
	install -Dm644 "$srcdir/forge.desktop" "$pkgdir/usr/share/applications/forge.desktop"
	install -Dm644 "$srcdir/Forge.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/Forge.png"

	# Copying License
	install -Dm644 "$pkgdir/opt/Forge/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Creating docs directory
	install -d "$pkgdir/usr/share/doc/$pkgname"

	# Copying docs
	cp -r "$pkgdir/opt/Forge/docs/." "$pkgdir/usr/share/doc/$pkgname/"

	# Cleaning up windows binaries and scripts from pkg
	rm "$pkgdir"/opt/Forge/*.{exe,command,cmd}
}

sha256sums=('431bf7eae230e191406431ee06bfb9d9d76f2c3ee58751ac3d0c3e06a97ad44d'
            '37a09e0299034f88a6c677d4924a34c51f447d4acf92580af46fb9eafbb7692e'
            '3c9d08534c6c8e5d6aa70d01f70ff2f3a8120e96fdd59bf74cd71678771976bf'
            '37b5b8ae063f816fb9d9723614412685fab0265154163febba0531c0ace0cb11')
