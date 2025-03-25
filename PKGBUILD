# Maintainer: Bink <B-Interactive@users.noreply.github.com>

pkgname=air-sdk
pkgver=51.1.3.8
pkgrel=2
epoch=1
pkgdesc="A multi-operating system, multi-screen runtime that allows you to leverage your web development skills to build and deploy rich Internet applications to the desktop and mobile devices."
arch=('x86_64' 'i686')
url="https://airsdk.harman.com/"
license=('custom:Harman Connected Services, Inc. (“Harman”) SDK License Agreement')
depends=('jdk11-openjdk' 'gtk2' 'gnome-themes-extra')
makedepends=('unzip')
source=()
_sha256sum='84a8e0c8e241e7e1f54c5dd4d12c8b12ecc6d92b99f2aeeac785ed7ccb161f88'
install="$pkgname.install"

package() {
	_sourcefile='../AIRSDK_Linux.zip'

	if [ ! -f $_sourcefile ]; then
		echo ""
		echo "	The AIR SDK source file was not found and needs to be downloaded manually due to license restriction."
		echo "	Download the 'Full AIR SDK with new ActionScript Compiler' ($pkgver) from:"
		echo ""
		echo "	https://airsdk.harman.com/download"
		echo ""
		return 1
	elif echo "$_sha256sum $_sourcefile" | sha256sum -c --status; then
		echo "Source checksum passed."
	else
		echo ""
		echo "	Source file failed checksum."
		echo "	Ensure you've downloaded AIR SDK $pkgver to this directory."
		echo ""
		return 1
	fi

	mkdir -p "$pkgdir/opt/$pkgname/$pkgver"
	unzip -d "$pkgdir/opt/$pkgname/$pkgver" $_sourcefile
	install -Dm644 "$pkgdir/opt/$pkgname/$pkgver/AIR SDK license.pdf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"

	mkdir -p "$pkgdir/etc/profile.d"
	echo "export AIR_HOME=/opt/$pkgname/AIRSDK" > "$pkgdir/etc/profile.d/$pkgname.sh"
	echo "export PATH=\$PATH':/opt/$pkgname/AIRSDK/bin'" >> "$pkgdir/etc/profile.d/$pkgname.sh"
	echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk" >> "$pkgdir/etc/profile.d/$pkgname.sh"
	echo "export AIR_DISTRO=debian" >> "$pkgdir/etc/profile.d/$pkgname.sh"

	cd "$pkgdir/opt/$pkgname" || exit
	ln -s "$pkgver" "AIRSDK"
}
