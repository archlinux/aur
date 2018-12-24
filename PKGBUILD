# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=OpenOrienteering
_pkgname=mapper
_branch=master
_use_gh_api=true
wl_project=${_orgname}
wl_dl="https://hosted.weblate.org/download/${wl_project}"
pkgname=${_orgname,,}-${_pkgname}-git
pkgver=0.8.4.r4767.7024a44e
pkgrel=1
pkgdesc='Map drawing program from OpenOrienteering'
arch=('i686' 'x86_64')
url='https://www.openorienteering.org/apps/mapper/'
license=('GPL3')
depends=('qt5-base>=5.6' 'polyclipping>=6.1.3a' 'proj>=4.9.2' 'gdal')
makedepends=('cmake>=3.2' 'qt5-tools>=5.6' 'doxygen' 'libcups')
if [ "${_use_gh_api}" = true ]; then
  makedepends+=('python')
else
  makedepends+=('git')
fi
optdepends=('qt5-imageformats: Support for TIFF etc.')
provides=("${pkgname//-git}=${pkgver}")
conflicts=(${pkgname//-git})
install=${pkgname//-git}.install
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
    base='8a8986ec'
    head=$(curl -s "$api_url/git/refs/heads/${_branch}" | \
      python -c "import sys, json; print(json.load(sys.stdin)['object']['sha'][:8])")
    count=$(curl -s "$api_url/compare/${base}...${head}" | \
      python -c "import sys, json; print(json.load(sys.stdin)['total_commits'] + 1)")
    release=$(curl -s "$api_url/releases" | \
      python -c "import sys, json; r = json.load(sys.stdin)[0]; print(r['tag_name'] + ('pre' if r['prerelease'] else ''))")
  else
    release="$(git describe --tags $(git rev-list --tags --max-count=1))"
    count="$(git rev-list --count HEAD)"
    head="$(git rev-parse --short HEAD)"
  fi

  release=${release//-/.} # pkgver is not allowed to contain hyphens
  printf "%s.r%s.%s" "${release#?}" "${count}" "${head}"
}

wl_update() {
  find . -name "${2}*.ts" -a ! -name "*template*" | \
    xargs basename -s .ts | \
    xargs -P 0 -I{} sh -c "curl -so \$1.ts $wl_dl/${1}/\${1#${2}}/" -- {}
}

prepare() {
  cd ${_pkgname}-${_branch}/translations

  rename nb nb_NO *_nb.ts
  rename CN Hans *_zh_CN.ts

  wl_update ${_pkgname} ${_orgname}_
  wl_update map-symbols map_symbols_
  wl_update qt qt_

  rename nb_NO nb *_nb_NO.ts
  rename Hans CN *_zh_Hans.ts
}

build() {
  cd ${_pkgname}-${_branch}

  rm -rf build
  mkdir -p build
  cd build

  cmake ..                      \
    -DCMAKE_BUILD_TYPE=Release  \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLICENSING_PROVIDER=arch   \
    -DMapper_PACKAGE_NAME=${pkgname//-git} \
    -DMapper_VERSION_DISPLAY=${pkgver} \
    -Wno-dev
  cmake --build .
}

check() {
  cd ${_pkgname}-${_branch}/build

  cmake --build . --target test
}

package() {
  cd ${_pkgname}-${_branch}/build

  DESTDIR=${pkgdir}/ cmake --build . --target install
}
