# Maintainer: Triss Healy <th@trissyle.gs>
# Contributor: Alessandro Guido <alexguido@gmail.com>

# I backed up the original file to archive.org:
# https://archive.org/details/cnijfilter-mx720series-3.90-1-deb

pkgname=cnijfilter-mx720series
pkgver=3.90
pkgrel=1
pkgdesc="Canon InkJet printer driver (mx720 series, binary)"
arch=('i686' 'x86_64')
url="https://canon-print.com/canon-pixma-mx720-series-driver-windows-mac-linux/"
license=('custom')
depends=('popt')
optdepends=('gtk2: Canon maintenance GUI support')
provides=("cnijfilter-common=${pkgver}")
conflicts=("cnijfilter-common")
        
source=("https://gdlp01.c-wss.com/gds/8/0100005168/01/${pkgname}-${pkgver}-1-deb.tar.gz")
md5sums=('8da91443f0f3f06965676a33784499bb')

package() {
  local _pkgarch=$(echo -n "${CARCH}" | sed 's/x86_/amd/' | sed 's/i6/i3/')
  local _debdir="${srcdir}/${pkgname}-${pkgver}-1-deb/packages"
  
  cd $pkgdir
  ar -x "${_debdir}/cnijfilter-common_${pkgver}-1_${_pkgarch}.deb" "data.tar.gz"
  tar -xzf data.tar.gz && rm -f data.tar.gz

  ar -x "${_debdir}/${pkgname}_${pkgver}-1_${_pkgarch}.deb" \
        "data.tar.gz"
  tar -xzf data.tar.gz && rm -f data.tar.gz

  mkdir -p usr/share/licenses/${pkgname}
  mv usr/share/doc/cnijfilter-common/* usr/share/licenses/${pkgname}
  rmdir usr/share/doc/cnijfilter-common
  mv usr/share/doc/${pkgname}/* usr/share/licenses/${pkgname}
  rmdir usr/share/doc/${pkgname}
  rmdir usr/share/doc

  # Weird permissions error from namcap
  chown root usr/lib/bjlib/cnnet.ini
  chgrp root usr/lib/bjlib/cnnet.ini

  chmod 0755 $(find usr/bin -type f)
  chmod 0755 $(find usr/lib -type f)
  chmod 0644 $(find usr/share -type f)
  chmod 0644 $(find etc -type f)
}

