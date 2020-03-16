# Contributor: Raffaele Zamorano
# Contributor: Jose Riha <jose1711 gmail com>
# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=tumic0
_pkgname=GPXSee
_branch=master
_use_gh_api=true
_gh_api_url="https://api.github.com/repos/${_orgname}/${_pkgname}"
_wl_project=${_pkgname}
_wl_hz="https://hosted.weblate.org/healthz/"
_wl_dl="https://hosted.weblate.org/download/${_wl_project}"
pkgname=${_pkgname,,}-git
pkgver=7.25.r19.g9ce6e16
pkgrel=1
pkgdesc='GPS log file viewer and analyzer'
arch=(x86_64)
url='https://www.gpxsee.org/'
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
if [ "${_use_gh_api}" = true ]; then
  makedepends+=('jq')
else
  makedepends+=('git')
fi
optdepends=('qt5-imageformats: Support for GeoTIFF images'
            'qt5-pbfimageplugin: Support for PBF vector maps'
            'qt5-translations: for Qt5 dialog translations')
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

    printf "%s.r%s.g%.7s" "${tag_name}" "${count}" "${head}"
  else
    cd ${_pkgname}-${_branch}
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  fi
}

wl_update() {
  find . -name "${2}*.ts" -a ! -name "*_en.ts" | \
    xargs basename -s .ts | \
    xargs -P 0 -I{} sh -c "curl -so \$1.ts ${_wl_dl}/${1}/\${1#${2}}/" -- {}
}

prepare() {
  cd ${_pkgname}-${_branch}/lang

  if [ "`curl ${_wl_hz}`" = "ok" ]; then
    rename nb nb_NO *_nb.ts
    wl_update Translations ${_pkgname,,}_
    rename nb_NO nb *_nb_NO.ts
  fi
}

build() {
  cd ${_pkgname}-${_branch}

  sed -i "s/\(VERSION = \).*/\1${pkgver}/" gpxsee.pro

  find lang -name "*.ts" -exec sh -c 'touch ${0//.ts/.qm}' {} \;
  qmake CONFIG+=lrelease LRELEASE_DIR=lang PREFIX=/usr gpxsee.pro
  rm -f lang/*.qm
  make
}

package() {
  cd ${_pkgname}-${_branch}

  make INSTALL_ROOT="${pkgdir}" install
}
