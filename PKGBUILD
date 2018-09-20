# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=BourgeoisLab
_pkgname=GPXLab
_branch=master
_use_gh_api=true
pkgname=${_pkgname,,}-git
pkgver=0.4.0.r17.6c69ea7b
pkgrel=1
pkgdesc='Program to show and manipulate GPS tracks'
arch=('i686' 'x86_64')
url="https://bourgeoislab.wordpress.com/gpxlab/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
if [ "${_use_gh_api}" = true ]; then
  makedepends+=('python')
else
  makedepends+=('git')
fi
provides=("${pkgname//-git}=${pkgver}")
conflicts=(${pkgname//-git})
if [ "${_use_gh_api}" = true ]; then
  source=("https://github.com/${_orgname}/${_pkgname}/archive/${_branch}.tar.gz")
else
  source=("${_pkgname}-${_branch}::git://github.com/${_orgname}/${_pkgname}.git#branch=${_branch}")
fi
source+=("gpxlab.desktop"
         "gpxlab.xml")
sha256sums=('SKIP'
            'df674c3baa689b5441c81447fa999f418029c1edc5ac1933cdb26202049d2b58'
            '5e35029c0cf26cbe82c3fbe1f839688f99406c2e054b1311e7912d0468df7c38')

pkgver() {
  cd ${_pkgname}-${_branch}

  if [ "${_use_gh_api}" = true ]; then
    api_url="https://api.github.com/repos/${_orgname}/${_pkgname}"
    base="30fb6d1"
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

  release=${release//-/.} # pkgver is not allowed to contain hyphens
  printf "%s.r%s.%s" "${release#?}" "${count}" "${head}"
}

prepare() {
  cd ${_pkgname}-${_branch}

  sed -i "s/\(VERSION = \).*/\1${pkgver}/" GPXLab/GPXLab.pro
}

build() {
  cd ${_pkgname}-${_branch}

  qmake GPXLab.pro
  make
}

package() {
  cd ${_pkgname}-${_branch}

  install -d 755 ${pkgdir}/usr/bin
  install -d 755 ${pkgdir}/usr/share/applications
  install -d 755 ${pkgdir}/usr/share/pixmaps
  install -d 755 ${pkgdir}/usr/share/mime/packages

  install -m 755 bin/GPXLab ${pkgdir}/usr/bin/${pkgname//-git}
  install -m 644 doc/gpxlab.png ${pkgdir}/usr/share/pixmaps/${pkgname//-git}.png
  install -m 644 ../gpxlab.desktop ${pkgdir}/usr/share/applications/${pkgname//-git}.desktop
  install -m 644 ../gpxlab.xml ${pkgdir}/usr/share/mime/packages/${pkgname//-git}.xml
}
