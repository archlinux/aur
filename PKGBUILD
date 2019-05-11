# Maintainer: Steven De Bondt <egnappah at gmail dot com>

pkgbase=geoipdatabase_reloaded
pkgver=0.9.2
pkgrel=1
arch=('x86_64')
url="https://dev.maxmind.com/geoip/geoip2/geolite2/"
license=('Creative Commons Attribution-ShareAlike 4.0 International License')
checkdepends=('python2' 'geoip')

# We all love colors. Stop pretending you don't.
BRED="\033[1;31m"
BYELLOW='\033[1;93m'
BORANGE='\033[01;38;5;214m'
BGREEN='\033[1;92m'
NOCOLOR='\033[0m'


		#the deprecated package for parsing the geoip data
source=('http://nhameh.ovh/varia/python2-pygeoip-0.3.2-4-any.pkg.tar.xz'
        # the main kernel config files
        'git+https://github.com/sherpya/geolite2legacy/')
sha256sums=('SKIP'
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

	if [ "$(pacman -Q python2-pygeoip)" == "" ]; then
	echo -e "${BYELLOW}Now installing a ${BRED}(missing in the arch repo??) ${BORANGE}package${BYELLOW} to parse the geoipfiles..."
	echo -e "${BORANGE}python2-pygeoip${BYELLOW} got completely deprecated for undisclosed ${BRED}(as usual)${BYELLOW} reasons, so we need to install this here from an external source.${NOCOLOR}"
		sudo pacman --noconfirm -U ../python2-pygeoip-0.3.2-4-any.pkg.tar.xz
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
	pkgdesc="Compiles the newest geoip databases for counties and cities from maxmind and installs them on your system"
	echo -e "${BYELLOW}Installing the GeoIP Databases files in the right location${NOCOLOR}"
	mkdir -p ../pkg/$pkgbase/usr/share/GeoIP
	cp output/* ../pkg/$pkgbase/usr/share/GeoIP/
	
}

pkgname=("${pkgbase}")
