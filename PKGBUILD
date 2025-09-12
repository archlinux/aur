# Maintainer: korimitsu <korimitsu_aur.wackiness926@passinbox.com>
# Based on PKGBUILD by:
# Maintainer:
# Contributor: Olaf Bauer <hydro@freenet.de>

# v5-only package, no legacy dvbv3 conversion.

: ${_commit=}   # optionally pin: pass _commit=HEAD~1 to makepkg/paru

_pkgname='dtv-scan-tables-dvbv5'
pkgname='dtv-scan-tables-dvbv5-git'
pkgver=r1310.15661aa
pkgrel=5
pkgdesc='Digital TV scan tables (DVBv5 only)'
url='https://git.linuxtv.org/dtv-scan-tables.git'
license=('GPL-2.0-only' 'LGPL-2.0-only')
arch=('any')

makedepends=('git')           # v4l-utils not needed when dvbv3 conversion is skipped
provides=('dtv-scan-tables-dvbv5')
# Conflict 'dtv-scan-tables-git' has to be removed, when the metapackage 'dtv-scan-tables' including "dtv-scan-tables-dvbv*-git" is created. Currently that package is already owned so it's incompatible.
conflicts=('dtv-scan-tables' 'dtv-scan-tables-git' 'dtv-scan-tables-patched')
optdepends=('dtv-scan-tables-dvbv3-git: legacy zap/channels.conf tables')

source=("$_pkgname::git+$url${_commit:+#commit=$_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  : # nothing to build for v5-only
}

package() {
  cd "$_pkgname"
  # Install DVBv5 tables to /usr/share/dvb/ only (the path NextPVR and others expect)
  make PREFIX="$pkgdir/usr" DVBV5DIR=dvb install
}
