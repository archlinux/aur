# Maintainer  : Grey Christoforo <first name at last name dot net>

pkgname=hdfview-git
_pkgname=HDFView
pkgver=r346.d6a3bf6
_pkgver="99.99.99"
pkgrel=2
pkgdesc="a GUI browser for reading hdf5 files from dev git repo"
arch=('x86_64')
url="https://www.hdfgroup.org/downloads/hdfview/"
license=('custom')
depends=('hdf5' 'hdf4')
replaces=('hdfview-beta')
conflicts=('hdfview-beta' 'hdfview')
provides=('hdfview')
makedepends=('ant' 'java-environment')
options=(!strip)
source=("git+https://bitbucket.hdfgroup.org/scm/hdfview/hdfview.git"
        license
        ${_pkgname}.desktop
        ${_pkgname}.ico)
sha512sums=(
    'SKIP'
    'd831e3211c67480728488e1e2df2596d41381c5ba7b8451ea0f5174d9a34f224133d9cbaa81728cb68560328054663e8940de86db4777de8b46b65f080de9674'
    '42cbf32c91c4bfd3984d2ef130d8357c28269660117ad210039d9599904688853674f6626a7663c17cf0927895e5cbbede719b6766ff19ace43a5447421a4709'
    'bc2bb9ffa22140c1b6b5448ed310a8dbb839ddcf802ec327f32f904f0e77e0034bb26fabeb5d9e4e8ce8d334333327a2bd08b8e07f0313e85ef50afe0be41cfe')

pkgver() {
  cd hdfview
  printf "r%s.%s" "$(git rev-list HEAD --count --first-parent)" "$(git rev-parse --short HEAD)"
}


prepare() {
    cd hdfview
}

build() {
  # workaround for java exception thrown @ build.xml:838
  # [...] error=7 chmod  [...] argument list too long
  # when building with java 10
  ulimit -s unlimited

  cd hdfview
  HDFLIBS=/opt/hdf4 HDF5LIBS=/usr ant package
}

package() {
  cd hdfview
  mkdir "${pkgdir}/opt"
  cp -a "build/dist/${_pkgname}-${_pkgver}-Linux.sh" "${pkgdir}/opt"
  cd "${pkgdir}/opt"

  # Make extraction non interactive
  sed -i 's/interactive=TRUE/interactive=FALSE/' ${_pkgname}-${_pkgver}-Linux.sh
  sed -i 's/cpack_skip_license=FALSE/cpack_skip_license=TRUE/' ${_pkgname}-${_pkgver}-Linux.sh

  ./*-Linux.sh
  rm "${_pkgname}-${_pkgver}-Linux.sh"
  mkdir -p "${pkgdir}/usr/bin"

  # Desktop files, icons, wrappers and license
  echo "#!/usr/bin/env bash" > "${pkgdir}/usr/bin/hdfview.sh"
  echo "/opt/HDFView/${_pkgver}/hdfview.sh "'$@' >> "${pkgdir}/usr/bin/hdfview.sh"
  chmod 755 "${pkgdir}/usr/bin/hdfview.sh"
  install -D -m 644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D -m 644 "${srcdir}/${_pkgname}.ico" "${pkgdir}/usr/share/pixmaps/${_pkgname}.ico"
  install -D -m 644 "${srcdir}/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
