# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=OpenOrienteering
_pkgname=mapper
_branch=master
_use_gh_api=true
_gh_api_url="https://api.github.com/repos/${_orgname}/${_pkgname}"
_wl_project=${_orgname}
_wl_hz="https://hosted.weblate.org/healthz/"
_wl_dl="https://hosted.weblate.org/download/${_wl_project}"
pkgname=${_orgname,,}-${_pkgname}-git
pkgver=0.9.2.r6.g4cdcc0ec
pkgrel=1
pkgdesc='Map drawing program from OpenOrienteering'
arch=(x86_64)
url='https://www.openorienteering.org/apps/mapper/'
license=('GPL3')
depends=('qt5-base>=5.6' 'polyclipping>=6.1.3a' 'proj>=4.9.2' 'gdal')
makedepends=('cmake>=3.2' 'qt5-tools>=5.6' 'doxygen' 'libcups')
checkdepends=('qt5-imageformats')
if [ "${_use_gh_api}" = true ]; then
  makedepends+=('jq')
else
  makedepends+=('git')
fi
optdepends=('qt5-imageformats: Support for TIFF etc.'
            'qt5-translations: for Qt5 dialog translations')
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
  if [ "${_use_gh_api}" = true ]; then
    read -r tag_name tag_sha <<<$(curl -s "${_gh_api_url}/releases" | \
      jq -r '.[0]|[.tag_name,.target_commitish]|@sh' | sed "s/'//g;s/master-//")
    head=$(curl -s "${_gh_api_url}/git/refs/heads/${_branch}" | \
      jq -r '.object.sha')
    count=$(curl -s "${_gh_api_url}/compare/${tag_sha}...${head}" | \
      jq -r '.behind_by')

    tag_name=${tag_name//-/.} # pkgver is not allowed to contain hyphens
    printf "%s.r%s.g%.8s" "${tag_name#?}" "${count}" "${head}"
  else
    cd ${_pkgname}-${_branch}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  fi
}

wl_update() {
  find . -name "${2}*.ts" -a ! -name "*template*" | \
    xargs basename -s .ts | \
    xargs -P 0 -I{} sh -c "curl -so \$1.ts ${_wl_dl}/${1}/\${1#${2}}/" -- {}
}

prepare() {
  cd ${_pkgname}-${_branch}/translations

  if [ "`curl ${_wl_hz}`" = "ok" ]; then
    rename nb nb_NO *_nb.ts
    rename CN Hans OpenOrienteering_zh_CN.ts

    wl_update ${_pkgname} ${_orgname}_
    wl_update map-symbols map_symbols_
    wl_update qt qt_

    rename nb_NO nb *_nb_NO.ts
    rename Hans CN OpenOrienteering_zh_Hans.ts
  fi
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
