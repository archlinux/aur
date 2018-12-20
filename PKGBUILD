# Maintainer: Sorin-Mihai Vârgolici <sorin-mihai@vargolici.com>
_pkgname=acct
pkgname=${_pkgname}-svn
pkgver=r103
pkgrel=1
pkgdesc="Utilities for monitoring process activities"
arch=(x86_64)
url="https://savannah.gnu.org/projects/${_pkgname}"
license=('GPL3')
depends=('glibc')
makedepends=('subversion')
provides=('acct' 'psacct')
conflicts=('acct' 'psacct')
source=("svn+https://svn.savannah.gnu.org/svn/${_pkgname}/trunk"
	"${_pkgname}"
	"${_pkgname}on-create"
	"${_pkgname}.service")
md5sums=('SKIP'
         '4227583ee39255418ece1249ad4d7791'
         '3835033cdfbbe5b938d142099a44d35f'
         'd5397e070e68ebf3070e1f99deecbf11')
sha256sums=('SKIP'
            'b2d40354cc67efb104d09f491024b698585f7614166c266f2c80293236aaf835'
            '143c59b297117791e4f7a022f560317640dbc4fdd4c6bc15e9fe3a2971ba784b'
            'dc92a6365e45ce0c4a1087bf83e3f22c400f254baa55230feab70d967f993314')

pkgver() {
  cd "$srcdir/trunk"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/trunk"
  autoreconf -fi
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  make -C "$srcdir/trunk" DESTDIR="$pkgdir/" install
  rm "$pkgdir/usr/bin/last" "$pkgdir/usr/share/man/man1/last.1"
  install -Dm644 "${srcdir}/trunk/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -dm700 "${pkgdir}/var/log/account"
  install -Dm644 "${_pkgname}" "${pkgdir}/etc/logrotate.d/${_pkgname}"
  install -Dm755 "${_pkgname}on-create" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}on-create"
  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
