# Maintainer: Adam Nielsen <malvineous@shikadi.net>
#
# Example use:
#
# To try ALL MIBs:
#   snmpwalk -v1 -c public -m ALL mydrac 1
#
# To use just the DRAC MIBs:
#   snmpwalk -v1 -c public -m +DELLRAC-MIB:IDRAC-MIB-SMIv2 mydrac 1.3.6.1.4.1
#
# To get a single value:
#   snmpget -v1 -c public -m +IDRAC-MIB-SMIv2 mydrac IDRAC-MIB-SMIv2::systemServiceTag.0
#

pkgname=('dell-drac-mibs')
pkgver=10.1.0.0
pkgrel=1
pkgdesc='SNMP MIBs for Dell iDRAC remote management controllers'
arch=('any')
url='https://www.dell.com/support/home/en-au/drivers/driversdetails?driverid=96cdj'
license=('custom:dell')
depends=('net-snmp')
makedepends=('unzip')
source=('https://dl.dell.com/FOLDER07456510M/1/Dell-OM-MIBS-10100_A00.zip')
md5sums=('ef7c4fe0507fa2cd15ce64a3f752cdec')
sha256sums=('67d6e52172867bffef9f5163d24dd2037a28b025233007b9a77ed4218a95a984')

# Dell blocks the curl default user agent so we need to override it.[6~
DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --user-agent Arch/makepkg --retry-delay 3 -o %o %u')

package() {
	numfiles=(Dell*.zip)
	numfiles=${#numfiles[@]}
	if [ "$numfiles" -gt 1 ]; then
		error "Please remove the src/ folder left over from a previous build"
		exit 1
	fi
	unzip -jo Dell*.zip
	install -Dm0644 *.mib *.txt -t "$pkgdir/usr/share/snmp/mibs/"
	rm "$pkgdir/usr/share/snmp/mibs/"*readme*
	install -Dm0644 *readme* -t "$pkgdir/usr/share/doc/dell-drac-mibs/"
}
