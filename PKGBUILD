# Maintainer: korimitsu <korimitsu_aur.wackiness926@passinbox.com>
# Based on PKGBUILD by:
# Maintainer:
# Contributor: Olaf Bauer <hydro@freenet.de>

_pkgname='dtv-scan-tables-patched'
pkgname="dtv-scan-tables-patched"
pkgver=r1309.caca23f
pkgrel=5
pkgdesc="Digital TV scan tables (pinned to good commit to avoid current dvbv3 breakage)"
url="https://git.linuxtv.org/dtv-scan-tables.git"
license=('GPL-2.0-only' 'LGPL-2.0-only')
arch=('any')

makedepends=('git' 'v4l-utils')

conflicts=('dtv-scan-tables' 'dtv-scan-tables-git' 'dtv-scan-tables-dvbv3' 'dtv-scan-tables-dvbv5')

_pkgsrc="$_pkgname"
# Pin to last good commit that compiles: caca23fb546620433763a3ec04f65e62855b1dbc
source=("$_pkgsrc"::"git+$url#commit=caca23fb546620433763a3ec04f65e62855b1dbc")
sha256sums=('72bafd8e940735be28206797327a59e466d7c6e2a3c68c5bd4a8ee99dfc21912')

pkgver() {
  cd "$_pkgsrc"
  # Standard VCS-style versioning; with the pinned commit this resolves to r1309.caca23f
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgsrc"
  make dvbv3
}

package() {
  cd "$_pkgsrc"
  make PREFIX="$pkgdir/usr" DVBV5DIR=dvb install
  make PREFIX="$pkgdir/usr" install_v3
}
