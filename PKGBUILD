# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Nick Østergaard <oe.nick@gmail.com>
# Contributor: Jonny Gerold <jonny@fsk141.com>
_orgname=viking-gps
_pkgname=viking
_branch=master
_use_gh_api=true
pkgname=${_pkgname}-git
pkgver=1.6.2.r3307.2a5bafd2
pkgrel=1
pkgdesc="GTK+2 application to manage GPS data"
arch=('i686' 'x86_64')
url="http://viking-gps.github.io/"
license=('GPL2')
depends=('curl' 'file' 'gpsd' 'gtk2' 'libgexiv2' 'mapnik' 'liboauth')
makedepends=('boost' 'gnome-doc-utils' 'intltool')
if [ "${_use_gh_api}" = true ]; then
  makedepends+=('python')
else
  makedepends+=('git')
fi
optdepends=('gpsbabel: import and export GPS tracks from various formats')
provides=("${pkgname//-git}=${pkgver}")
conflicts=(${pkgname//-git})
if [ "${_use_gh_api}" = true ]; then
  source=("https://github.com/${_orgname}/${_pkgname}/archive/${_branch}.tar.gz")
else
  source=("${_pkgname}-${_branch}::git://github.com/${_orgname}/${_pkgname}.git#branch=${_branch}")
fi
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}-${_branch}

  if [ "${_use_gh_api}" = true ]; then
    api_url="https://api.github.com/repos/${_orgname}/${_pkgname}"
    base="029f2f53"
    head=$(curl -s "$api_url/git/refs/heads/${_branch}" | \
      python -c "import sys, json; print(json.load(sys.stdin)['object']['sha'][:8])")
    count=$(curl -s "$api_url/compare/${base}...${head}" | \
      python -c "import sys, json; print(json.load(sys.stdin)['total_commits'] + 1)")
    release=$(curl -s "$api_url/tags" | \
      python -c "import sys, json; r = json.load(sys.stdin)[0]; print(r['name'])")
  else
    release="$(git describe --tags $(git rev-list --tags --max-count=1))"
    count="$(git rev-list --count HEAD)"
    head="$(git rev-parse --short HEAD)"
  fi

  release=${release#viking-}
  release=${release//-/.} # pkgver is not allowed to contain hyphens
  printf "%s.r%s.%s" "${release}" "${count}" "${head}"
}

prepare() {
  cd ${_pkgname}-${_branch}

  export NOCONFIGURE=yes
  ./autogen.sh
}

build() {
  cd ${_pkgname}-${_branch}

  export CXXFLAGS="$CXXFLAGS -I/usr/include/mapnik"
  ./configure \
    --prefix=/usr \
    --enable-expedia \
    --enable-geocaches
  make
}

package(){
  cd ${_pkgname}-${_branch}

  make DESTDIR="${pkgdir}" install
}
