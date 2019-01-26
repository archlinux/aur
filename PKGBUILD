# Contributor: Raffaele Zamorano
# Contributor: Jose Riha <jose1711 gmail com>
# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=tumic0
_pkgname=GPXSee
_branch=master
_use_gh_api=true
wl_project=${_pkgname}
wl_dl="https://hosted.weblate.org/download/${wl_project}"
pkgname=${_pkgname,,}-git
pkgver=7.1.r1378.ab9e40d4
pkgrel=1
pkgdesc='GPS log file viewer and analyzer'
arch=('i686' 'x86_64')
url='https://www.gpxsee.org/'
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
if [ "${_use_gh_api}" = true ]; then
  makedepends+=('python')
else
  makedepends+=('git')
fi
optdepends=('qt5-imageformats: Support for GeoTIFF images'
            'qt5-pbfimageplugin: Support for PBF vector maps')
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
    base='928e259d'
    head=$(curl -s "${api_url}/git/refs/heads/${_branch}" | \
      python -c "import sys, json; print(json.load(sys.stdin)['object']['sha'][:8])")
    count=$(curl -s "${api_url}/compare/${base}...${head}" | \
      python -c "import sys, json; print(json.load(sys.stdin)['total_commits'] + 1)")
    release=$(curl -s "${api_url}/tags" | \
      python -c "import sys, json; r = json.load(sys.stdin)[0]; print(r['name'])")
  else
    release="$(git describe --tags $(git rev-list --tags --max-count=1))"
    count="$(git rev-list --count HEAD)"
    head="$(git rev-parse --short HEAD)"
  fi

  release=${release//-/.} # pkgver is not allowed to contain hyphens
  printf "%s.r%s.%s" "${release}" "${count}" "${head}"
}

wl_update() {
  find . -name "${2}*.ts" -a ! -name "*template*" | \
    xargs basename -s .ts | \
    xargs -P 0 -I{} sh -c "curl -so \$1.ts $wl_dl/${1}/\${1#${2}}/" -- {}
}

prepare() {
  cd ${_pkgname}-${_branch}

  sed -i "s/\(VERSION = \).*/\1${pkgver}/" gpxsee.pro

  cd lang
  rename nb nb_NO *_nb.ts
  wl_update Translations ${_pkgname,,}_
  rename nb_NO nb *_nb_NO.ts
}

build() {
  cd ${_pkgname}-${_branch}

  lrelease gpxsee.pro
  qmake gpxsee.pro
  make
}

package() {
  cd ${_pkgname}-${_branch}

  install -Dm755 gpxsee ${pkgdir}/usr/bin/${pkgname//-git}
  install -Dm644 pkg/csv/* -t ${pkgdir}/usr/share/${pkgname//-git}/csv
  install -Dm644 pkg/maps/* -t ${pkgdir}/usr/share/${pkgname//-git}/maps
  install -Dm644 lang/*.qm -t ${pkgdir}/usr/share/${pkgname//-git}/translations
  install -Dm644 icons/gpxsee.png ${pkgdir}/usr/share/pixmaps/${pkgname//-git}.png
  install -Dm644 pkg/gpxsee.desktop ${pkgdir}/usr/share/applications/${pkgname//-git}.desktop
  install -Dm644 pkg/gpxsee.xml ${pkgdir}/usr/share/mime/packages/${pkgname//-git}.xml
  install -Dm644 pkg/appdata.xml ${pkgdir}/usr/share/metainfo/${pkgname//-git}.appdata.xml
}
