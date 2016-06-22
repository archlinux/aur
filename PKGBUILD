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
_ubver='16.3'; _ubrel='186'; _libgee='libgee>=0.18.0'
pkgname='timeshift'
pkgver="${_ubver}"
pkgrel='2'
pkgdesc='A system restore utility for Linux'
arch=('i686' 'x86_64')
#url='https://launchpad.net/~teejee2008/+archive/ubuntu/ppa'
url='https://code.launchpad.net/~teejee2008/timeshift'
license=('GPL')
_arch_depends=('rsync' 'libgee06' 'json-glib') # from installer/install.sh
_arch_depends[1]="${_libgee}"
depends=('gtk3' 'libsoup' 'desktop-file-utils' "${_arch_depends[@]}")
unset _arch_depends
optdepends=('gksu: run timeshift from a menu')
makedepends=('vala' 'diffutils' 'coreutils')
options=('!emptydirs')
_verwatch=("${url//code/bazaar}/trunk/changes" 'v\([0-9\.]\+\)' 't')
#source=("${url}/+files/${_srcdir}.tar.gz")
_srcdir='~teejee2008/timeshift/trunk'
source=("timeshift_v${_ubver}_r${_ubrel}.tgz::${url//code/bazaar}/trunk/tarball/${_ubrel}" 'sha256sums.txt')
sha256sums=('SKIP' 'SKIP') # bazaar generates the tarball live. It is different every time so we'll check the contents in prepare()

prepare_disable() {
  set -u
  cd "${_srcdir}"
  shopt -s globstar
  sha256sum ** > "${srcdir}/sha256sums.test" 2>/dev/null || :
  shopt -u globstar
  cd "${srcdir}"
  set +u
  diff -q sha256sums.{txt,test}
  rm 'sha256sums.test'
}

build() {
  set -u
  cd "${_srcdir}"

  make -s -j1
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
