# Maintainer: Sorin-Mihai Vârgolici <sorin-mihai@vargolici.com>
_pkgname=acct
pkgname=${_pkgname}-svn
pkgver=r103
pkgrel=1
pkgdesc="Utilities for monitoring process activities"
arch=(x86_64)
url="https://www.gnu.org/software/${_pkgname}"
license=('GPL3')
depends=('glibc')
makedepends=('subversion')
provides=('acct' 'psacct')
conflicts=('acct' 'psacct')
backup=(etc/logrotate.d/acct)
source=("svn+https://svn.savannah.gnu.org/svn/${_pkgname}/trunk"
	"${_pkgname}"
	"${_pkgname}on-create"
	"${_pkgname}.service")
md5sums=('SKIP'
         '4a980513fcb4ebf104d85897be052e73'
         '285408e0d50c2b14768020be00b3f0e4'
         'e838c53be7be5b7498f88ed4efca4091')
sha256sums=('SKIP'
            '75155d0795bf001938519c108b747708c4508f532fc7f185c0d1c5d4a48f1c6d'
            '4a3fc2603ef35b839431a0c4e81d80928d01c75ecfd10692953e9f7baf6b2b71'
            '9f899b4b3ea05de6e6125779d96f8b83e4be341f255fa4c9c3cd7f34ccb56d67')

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
