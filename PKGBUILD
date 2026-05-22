pkgname=hpe-scripting-toolkit
pkgver=11.60
pkgrel=5
pkgdesc="Command-line tools for scripting HP ProLiant BIOS configuration"
arch=(x86_64)
url='https://downloads.linux.hpe.com/SDR/project/stk/'
depends=(
	dmidecode	# according to .deb/control
	pciutils	# according to .deb/control
	libgcc		# libgcc_s.so.1
	libxml2-legacy	# libxml2.so.2
	libstdc++	# libstdc++.so.6
)
provides=(hp-scripting-tools=$pkgver)

# Standalone (mkiso.sh) version published at:
#   https://support.hpe.com/connect/s/softwaredetails?language=en_US&collectionId=MTX-UNITY_C8779&tab=releaseNotes
#source=("https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p774106952/v201708/hpe-scripting-toolkit-linux-11.60-60.tar.gz"
#        "https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p774106952/v201708/hpe-scripting-toolkit-linux-11.60-60.tar.gz.sig")
#sha256sums=('a6d5bf7b97537cd2d3e35a1c14ebc23ffd9f32b2161725134954dceb109a3717'
#            '8e28eb1746d9dfdcac4c2e5d770979e4736fc04b2fee25685b901546faa2d705')
# PGP keys published at:
#   https://support.hpe.com/connect/s/softwaredetails?language=en_US&collectionId=MTX-5e49ea6151b1451e&tab=releaseNotes
#validpgpkeys=('57446EFDE098E5C934B69C7DC208ADDE26C2B797')

# Debian/Ubuntu/RedHat packages published at:
#   https://downloads.linux.hpe.com/SDR/project/stk/
source=("https://downloads.linux.hpe.com/SDR/repo/stk/debian/pool/non-free/hp-scripting-tools_11.60-20_amd64.deb"
	"https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1472592088/v95853/conrep_rmrds.xml")
sha256sums=('db7104997c3f07fbdf834a85b1a431db5e15358f356067c02807c7866df5159c'
            '1d4c6198ba6515cc6596e38bd13e6b53ecc2e6d4f4b11914185d203b435ca2fd')

prepare() {
	mkdir -p $pkgname-$pkgver
	bsdtar -C $pkgname-$pkgver -xvf data.tar.xz
}

package() {
	cp -av $pkgname-$pkgver/. "$pkgdir"/
	mv -Tv "$pkgdir"/sbin "$pkgdir"/usr/bin
	# Remove thoroughly obsolete tool without manual page
	rm -v "$pkgdir"/usr/bin/lo100cfg
	# Rename with a hp-* prefix to match the manual pages
	for x in "$pkgdir"/usr/bin/*; do
		case ${x##*/} in
		hp-*)	;;
		hp*)	mv -v "$x" "$pkgdir"/usr/bin/hp-"${x##*/hp}";;
		*)	mv -v "$x" "$pkgdir"/usr/bin/hp-"${x##*/}";;
		esac
	done
	# Add extra file
	install -m 0644 conrep_rmrds.xml "$pkgdir"/opt/hp/hp-scripting-tools/etc/
}
