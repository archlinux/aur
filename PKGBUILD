# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=BourgeoisLab
_pkgname=GPXLab
_branch=master
_use_gh_api=true
_gh_api_url="https://api.github.com/repos/${_orgname}/${_pkgname}"
pkgname=${_pkgname,,}-git
pkgver=0.6.0.r23.gc2f3630
pkgrel=1
pkgdesc='Program to show and manipulate GPS tracks'
arch=(x86_64)
url='https://github.com/BourgeoisLab/GPXLab'
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
optdepends=('qt5-translations: for Qt5 dialog translations')
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
  qmake PREFIX=/usr GPXLab.pro
  make
}

package() {
  cd ${_pkgname}-${_branch}

  make INSTALL_ROOT="${pkgdir}" install
}
