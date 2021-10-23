# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=tzdata
pkgname=mingw-w64-${_pkgname}
pkgver=2021a
pkgrel=1
pkgdesc="Sources for time zone and daylight saving time data (mingw-w64)"
arch=('any')
url="https://www.iana.org/time-zones"
license=('custom: public domain')
options=('!emptydirs')
makedepends=('tzdata')
source=(https://www.iana.org/time-zones/repository/releases/${_pkgname}${pkgver}.tar.gz{,.asc})
sha512sums=('7cdd762ec90ce12a30fa36b1d66d1ea82d9fa21e514e2b9c7fcbe2541514ee0fadf30843ff352c65512fb270857b51d1517b45e1232b89c6f954ba9ff1833bb3'
            'SKIP')
validpgpkeys=('7E3792A9D8ACF7D633BC1588ED97E90E62AA7E34') # Paul Eggert <eggert@cs.ucla.edu>

timezones=('africa' 'antarctica' 'asia' 'australasia'
           'europe' 'northamerica' 'southamerica'
           'etcetera' 'backward' 'factory')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  cd "${srcdir}"

  for _arch in ${_architectures}; do
    # install tzdata stuff
    zic -b fat -d "${pkgdir}"/usr/${_arch}/share/zoneinfo ${timezones[@]}
    zic -b fat -d "${pkgdir}"/usr/${_arch}/share/zoneinfo/posix ${timezones[@]}
    zic -b fat -d "${pkgdir}"/usr/${_arch}/share/zoneinfo/right -L leapseconds ${timezones[@]}
    # This creates the posixrules file. We use New York because POSIX requires the daylight savings time rules to be in accordance with US rules.
    zic -b fat -d "${pkgdir}"/usr/${_arch}/share/zoneinfo -p America/New_York
    install -m444 -t "${pkgdir}/usr/${_arch}"/share/zoneinfo iso3166.tab zone1970.tab zone.tab # zone.tab is depricated and will go soon

    # install license
    install -Dm644 LICENSE "${pkgdir}/usr/${_arch}"/share/licenses/${_pkgname}/LICENSE
  done
}
