# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=BourgeoisLab
_pkgname=GPXLab
_branch=master
_use_gh_api=true
_gh_api_url="https://api.github.com/repos/${_orgname}/${_pkgname}"
pkgname=${_pkgname,,}-git
pkgver=0.5.0.r9.ge087cf4
pkgrel=1
pkgdesc='Program to show and manipulate GPS tracks'
arch=(x86_64)
url='https://bourgeoislab.wordpress.com/gpxlab/'
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
if [ "${_use_gh_api}" = true ]; then
  makedepends+=('jq')
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
sha256sums=('SKIP')

pkgver() {
  if [ "${_use_gh_api}" = true ]; then
    read -r tag_name tag_sha <<<$(curl -s "${_gh_api_url}/tags" | \
      jq -r '.[0]|[.name,.commit.sha]|@sh' | sed "s/'//g")
    head=$(curl -s "${_gh_api_url}/git/refs/heads/${_branch}" | \
      jq -r '.object.sha')
    count=$(curl -s "${_gh_api_url}/compare/${tag_sha}...${head}" | \
      jq -r '.total_commits')

    tag_name=${tag_name//-/.} # pkgver is not allowed to contain hyphens
    printf "%s.r%s.g%.7s" "${tag_name#?}" "${count}" "${head}"
  else
    cd ${_pkgname}-${_branch}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  fi
}

build() {
  cd ${_pkgname}-${_branch}

  sed -i "s/\(VERSION = \).*/\1${pkgver}/" GPXLab/GPXLab.pro

  lrelease GPXLab/GPXLab.pro
  qmake GPXLab.pro
  make
}

package() {
  cd ${_pkgname}-${_branch}

  install -Dm755 bin/GPXLab ${pkgdir}/usr/bin/${pkgname//-git}
  install -Dm644 GPXLab/locale/*.qm -t ${pkgdir}/usr/share/${pkgname//-git}/translations
  install -Dm644 doc/gpxlab.png ${pkgdir}/usr/share/pixmaps/${pkgname//-git}.png
  install -Dm644 pkg/gpxlab.desktop ${pkgdir}/usr/share/applications/${pkgname//-git}.desktop
  install -Dm644 pkg/gpxlab.xml ${pkgdir}/usr/share/mime/packages/${pkgname//-git}.xml
  install -Dm644 pkg/appdata.xml ${pkgdir}/usr/share/metainfo/${pkgname//-git}.appdata.xml
}
