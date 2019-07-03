# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Nick Østergaard <oe.nick@gmail.com>
# Contributor: Jonny Gerold <jonny@fsk141.com>
_orgname=viking-gps
_pkgname=viking
_branch=master
_use_gh_api=true
_gh_api_url="https://api.github.com/repos/${_orgname}/${_pkgname}"
pkgname=${_pkgname}-git
pkgver=1.7.r46.gbdb31987
pkgrel=1
pkgdesc='GTK+2 application to manage GPS data'
arch=(x86_64)
url='https://viking-gps.github.io/'
license=('GPL2')
depends=('curl' 'file' 'gpsd' 'gtk2' 'libgexiv2' 'mapnik' 'liboauth')
makedepends=('boost' 'gnome-doc-utils' 'intltool' 'gtk-doc')
if [ "${_use_gh_api}" = true ]; then
  makedepends+=('jq')
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
  if [ "${_use_gh_api}" = true ]; then
    read -r tag_name tag_sha <<<$(curl -s "${_gh_api_url}/tags" | \
      jq -r '.[0]|[.name,.commit.sha]|@sh' | sed "s/'//g")
    head=$(curl -s "${_gh_api_url}/git/refs/heads/${_branch}" | \
      jq -r '.object.sha')
    count=$(curl -s "${_gh_api_url}/compare/${tag_sha}...${head}" | \
      jq -r '.total_commits')

    printf "%s.r%s.g%.8s" "${tag_name#viking-}" "${count}" "${head}"
  else
    cd ${_pkgname}-${_branch}
    git describe --long | sed 's/viking-//;s/\([^-]*-g\)/r\1/;s/-/./g'
  fi
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
