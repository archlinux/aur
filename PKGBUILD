# Maintainer: Steven De Bondt <egnappah at gmail dot com>

pkgbase=geoipdatabase_reloaded
pkgver=1.2019.12
pkgrel=1
arch=('x86_64')
url="https://dev.maxmind.com/geoip/geoip2/geolite2/"
license=('Creative Commons Attribution-ShareAlike 4.0 International License')
makedepends=('python2')
depends=('geoip')

# We all love colors. Stop pretending you don't.
BRED="\033[1;31m"
BYELLOW='\033[1;93m'
BORANGE='\033[01;38;5;214m'
BGREEN='\033[1;92m'
NOCOLOR='\033[0m'


	#the deprecated packages for parsing the geoip data
source=('http://nhameh.ovh/varia/python2-pygeoip-0.3.2-4-any.pkg.tar.xz'
	'http://nhameh.ovh/varia/python2-ipaddr-2.2.0-1-any.pkg.tar.xz'
        # the main kernel config files
        'git+https://github.com/sherpya/geolite2legacy/')
sha256sums=('c068bb67aa7b25c829e295c1a90cddbec3863968ab8551e3d3d3b4f72884c6ab'
		'65db23b9fb288b53978ae4593fb23ed59dee4de2ca2bac601da9e841de187ddf'
		'SKIP')

pkgver() {
  echo $pkgver
}

prepare() {

	echo -e "${BRED}This product includes GeoLite2 data created by MaxMind, available from https://www.maxmind.com${NOCOLOR}"
        echo -e "${BGREEN}Got it?${NOCOLOR}"
        sleep 1
        echo -n "3.."
        sleep 1
        echo -n "2.."
        sleep 1
        echo "1.."
        sleep 1

	if [ "$(pacman -Q python2-pygeoip)" == "" ] || [ "$(pacman -Q python2-ipaddr)" == "" ]; then
	echo -e "${BYELLOW}Now installing ${BRED}(missing in the arch repos) ${BORANGE}packages${BYELLOW} to parse the geoipfiles..."
	echo -e "${BORANGE}python2-pygeoip and python2-ipaddr ${BYELLOW} got completely deprecated, so we need to install this here from an external source.${NOCOLOR}"
		sudo pacman --noconfirm -U ../python2-pygeoip-0.3.2-4-any.pkg.tar.xz ../python2-ipaddr-2.2.0-1-any.pkg.tar.xz 
	fi
	if [ ! -d CSVzips ]; then
		mkdir CSVzips
	fi
	rm -rf CSVzips/* 2> /dev/null
	if [ ! -d output ]; then
		mkdir output
	fi
	rm -rf output/* 2> /dev/null
	echo -e "${BYELLOW}Downloading the ${BGREEN}newest${BYELLOW} GeoIP CSV files from maxmind...${NOCOLOR}"
	wget -P CSVzips/ https://geolite.maxmind.com/download/geoip/database/GeoLite2-City-CSV.zip
	wget -P CSVzips/ https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country-CSV.zip
	wget -P CSVzips/ https://geolite.maxmind.com/download/geoip/database/GeoLite2-ASN-CSV.zip
}

build() {
	echo -e "${BYELLOW}Now ${BGREEN}building${BYELLOW} the .DAT files for the geoip database.${NOCOLOR}"
	python2 geolite2legacy/geolite2legacy.py -i CSVzips/GeoLite2-Country-CSV.zip -f geolite2legacy/geoname2fips.csv -o output/GeoIP.dat
	python2 geolite2legacy/geolite2legacy.py -i CSVzips/GeoLite2-City-CSV.zip -f geolite2legacy/geoname2fips.csv -o output/GeoIPCity.dat
	python2 geolite2legacy/geolite2legacy.py -i CSVzips/GeoLite2-ASN-CSV.zip -f geolite2legacy/geoname2fips.csv -o output/GeoIPASNum.dat
}

package() {
	pkgdesc="Compiles the newest geoip databases for countries and cities from maxmind and installs them on your system"
	echo -e "${BYELLOW}Installing the GeoIP Databases files in the right location${NOCOLOR}"
	mkdir -p ../pkg/$pkgbase/usr/share/GeoIP
	cp output/* ../pkg/$pkgbase/usr/share/GeoIP/
}

pkgname=("${pkgbase}")
