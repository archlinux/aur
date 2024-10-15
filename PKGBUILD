# Maintainer: Bink <B-Interactive@users.noreply.github.com>

pkgname=air-sdk
pkgver=51.1.2.1
pkgrel=1
epoch=1
pkgdesc="A multi-operating system, multi-screen runtime that allows you to leverage your web development skills to build and deploy rich Internet applications to the desktop and mobile devices."
arch=('x86_64' 'i686')
url="https://airsdk.harman.com/"
license=('custom:Harman Connected Services, Inc. (“Harman”) SDK License Agreement')
depends=('jdk11-openjdk')
makedepends=('wget' 'unzip')
source=()
_sha256sum='edc5a613a31ed2effc1025059d499358b20376e38763abb8ef2a70086d70d22a'
install="$pkgname.install"

package() {
	if [ ! -f "AIRSDK_Linux.zip" ]; then
		echo "Source file needs to be downloaded."
		while true; do
			echo ""
			echo "Harman AIR SDK License Agreement"
			echo "${url}assets/pdfs/HARMAN%20AIR%20SDK%20License%20Agreement.pdf"
			echo ""
			read -n1 -p "I accept the terms of the AIR SDK License Agreement [y/n] " yn
			case $yn in
				[Yy]* ) break;;
				[Nn]* ) return 1;;
				* ) echo "Please answer [y]es or [n]o.";;
			esac
		done
		wget "${url}api/versions/$pkgver/sdks/AIRSDK_Linux.zip?license=accepted" -O "AIRSDK_Linux.zip"
	fi

	if echo "$_sha256sum AIRSDK_Linux.zip" | sha256sum -c --status; then
		echo "Source checksum passed"
	else
		echo "Source file failed checksum. Aborting."
		return 1
	fi

	mkdir -p "$pkgdir/opt/$pkgname/$pkgver"
	unzip -d "$pkgdir/opt/$pkgname/$pkgver" "AIRSDK_Linux.zip"
	install -Dm644 "$pkgdir/opt/$pkgname/$pkgver/AIR SDK license.pdf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"

	mkdir -p "$pkgdir/etc/profile.d"
	echo "export AIR_HOME=/opt/$pkgname/AIRSDK" > "$pkgdir/etc/profile.d/$pkgname.sh"
	echo "export PATH='${PATH}':'/opt/$pkgname/AIRSDK/bin'" >> "$pkgdir/etc/profile.d/$pkgname.sh"
	echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk" >> "$pkgdir/etc/profile.d/$pkgname.sh"
	echo "export AIR_DISTRO=debian" > "$pkgdir/etc/profile.d/$pkgname.sh"

	cd "$pkgdir/opt/$pkgname"
	ln -s "$pkgver" "AIRSDK"
}
