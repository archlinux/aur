# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jay Garcia <morbidj at gmail dot com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Robert Orzanna <orschiro at gmail dot com>

set -u

#_ubver='1.7.2~174~ubuntu14.04.1'; _libgee='libgee06' # This won't build with vala=0.12 or vala=0.28.0
#_ubver='1.7.3~177~ubuntu15.10.1' # not found
#_ubver='1.7.3~177~ubuntu15.04.1' # not found
#_ubver='1.7.3~177~ubuntu14.04.1'; _libgee='libgee>=0.18.0'
#_ubver='1.7.5~180~ubuntu14.04.1'; _libgee='libgee>=0.18.0'
#_ubver='1.7.6~184~ubuntu14.04.1'; _libgee='libgee>=0.18.0'
#_ubver='17.2'; _ubrel='429'; _libgee='libgee>=0.18.0'
#_ubver='17.11'; _libgee='libgee>=0.18.0'
#_ubver='18.1'; _libgee='libgee>=0.18.0'
#_ubver='18.1.1'; _libgee='libgee>=0.18.0'
_ubver='18.4'; _libgee='libgee>=0.18.0'
pkgname='timeshift'
pkgver="${_ubver}"
pkgrel='1'
pkgdesc='A system restore utility for Linux'
arch=('i686' 'x86_64')
#url='https://launchpad.net/~teejee2008/+archive/ubuntu/ppa'
#url='https://code.launchpad.net/~teejee2008/timeshift'
#url='https://launchpad.net/timeshift'
url='https://github.com/teejee2008/timeshift'
license=('GPL')
_arch_depends=('rsync' 'libgee06' 'json-glib') # from installer/install.sh
_arch_depends[1]="${_libgee}"
depends=('gtk3' 'libsoup' 'desktop-file-utils' "${_arch_depends[@]}" 'cron')
unset _arch_depends
optdepends=('gksu: run timeshift from a menu')
makedepends=('vala' 'diffutils' 'coreutils' 'vte3')
options=('!emptydirs')
#_verwatch=("${url//code/bazaar}/trunk/changes" 'v\([0-9\.]\+\)' 't')
#source=("${url}/+files/${_srcdir}.tar.gz")
#_srcdir='~teejee2008/timeshift/trunk'
#source=("timeshift_v${_ubver}_r${_ubrel}.tgz::${url//code/bazaar}/trunk/tarball/${_ubrel}")
_github='teejee2008'
_verwatch=("https://github.com/${_github}/${pkgname}/releases.atom" '\s\+<title>Timeshift v\([0-9\.]\+\)</title>.*' 'f')
_srcdir="${pkgname}-${pkgver}"
source=("${pkgname}_v${pkgver}.tgz::https://github.com/${_github}/${pkgname}/archive/v${pkgver}.tar.gz")
source+=('0000-string-vte3-052-string-char.patch')
sha256sums=('5f180ba2ed66531b10e6cc9b1966e60be1c646ebe304dd0a29b4215318892feb'
            '9a6fa9a20122e275f8f13cbd35d151c8f5a76c1c2d16ae99fb676a0c06a7f420')
#sha256sums[0]='SKIP'

prepare() {
  set -u
  cd "${_srcdir}"
  # (cd ../../..; diff -pNau5 'src/Utility/Gtk/TerminalWindow.vala'{.orig,} > '0000-string-vte3-052-string-char.patch')
  patch -Nbup0 -i "${srcdir}/0000-string-vte3-052-string-char.patch"
  set +u
}

build() {
  set -u
  make -C "${_srcdir}" -s -j1
  set +u
}

package() {
  set -u
  make -C "${_srcdir}" -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u
