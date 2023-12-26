# Maintainer: Bink <B-Interactive@users.noreply.github.com>

pkgname=air-sdk
pkgver=50.2.4.2
pkgrel=1
pkgdesc="A multi-operating system, multi-screen runtime that allows you to leverage your web development skills to build and deploy rich Internet applications to the desktop and mobile devices."
arch=('x86_64' 'i686')
url="https://airsdk.harman.com/"
license=('custom:Harman Connected Services, Inc. (“Harman”) SDK License Agreement')
depends=('jdk11-openjdk')
makedepends=('wget' 'unzip')
source=()
_sha256sum='cee12544db1ba12c8a6404ca7fe3b4c138add98cc01f35f07cbcd6ad09301d12'
install="$pkgname.install"

package() {
	if [ ! -f "AIRSDK_Linux.zip" ]; then
		echo "Source file needs to be downloaded."
		while true; do
			echo ""
			echo "Harman AIR SDK License Agreement"
			echo "https://airsdk.harman.com/assets/pdfs/HARMAN%20AIR%20SDK%20License%20Agreement.pdf"
			echo ""
			read -p "I accept the terms of the AIR SDK License Agreement [y/n] " yn
			case $yn in
				[Yy]* ) break;;
				[Nn]* ) return 1;;
				* ) echo "Please answer [y]es or [n]o.";;
			esac
		done
		wget "https://airsdk.harman.com/api/versions/$pkgver/sdks/AIRSDK_Linux.zip?license=accepted" -O "AIRSDK_Linux.zip"
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

	cd "$pkgdir/opt/$pkgname"
	ln -s "$pkgver" "AIRSDK"
}
