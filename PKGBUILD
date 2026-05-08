# Maintainer: Butui Hu <hot123tea123@gmail.com>
#
# build 3dslicer with qt6, still in testing, use at your risk
#
_pkgname=3dslicer
pkgname=3dslicer-qt6-git
pkgver=5.10.0.r291.9b1f832706
pkgrel=1
pkgdesc='A free, open source and multi-platform software package widely used for medical, biomedical, and related imaging research, qt6 version'
arch=('x86_64')
url='https://www.slicer.org'
license=('BSD-3-Clause')
depends=(
  bzip2
  curl
  dcmtk
  fftw
  glibc
  hwloc
  libarchive
  libffi
  libglvnd
  libice
  libpng
  libsm
  libx11
  libxcrypt
  libxcursor
  libxext
  libxfixes
  libxrender
  openssl
  qt6-base
  qt6-declarative
  qt6-location
  qt6-multimedia
  qt6-svg
  qt6-webchannel
  qt6-webengine
  qt6-scxml
  qt6-5compat
  teem
  util-linux-libs
  xz
  zlib
)
makedepends=(
  clang
  cmake
  gendesk
  git
  ninja
  qt6-tools
  subversion
)
options=(!emptydirs !strip)
provides=(3dslicer=${pkgver})
conflicts=(3dslicer)
source=("${_pkgname}::git+https://github.com/Slicer/Slicer.git"
        "${_pkgname}.svg::https://www.slicer.org/assets/img/3D-Slicer-Mark.svg"
        "0001-fix-building-with-ctk.patch"
        "0002-fix-undefined-reference-error-when-building-with-qt6.patch"
)
sha512sums=('SKIP'
            '3422d244f819a7ec4c475d3d8a90c79fcb73738920c0830b100c6342ca24d5be607ba60ee3d91892402036a0adf31d5ab7c8fc83f451121a7b537f7de5306014'
            'a47374858ad5d89d23bddf18948ac0fda4de22e03a960a44935251f6fe297f571c6e6abe5e0023eab62c61b9377dbb3245b44588e3239987c4caf946a9dd2f8e'
            '5b6a8850fba98074d5cc624355b1fd73ced04371ab417ef60fd919d96327629fdcaa84290a0ec9cdfab2e12b7a6efb6971d87f940ad8e2bc4c4bbc18c4f8086e')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _max_tag=$(git tag --sort=-v:refname | head -n1)
  _commit_count=$(git rev-list --count "${_max_tag}"..HEAD)
  _commit_hash=$(git rev-parse --short HEAD)
  _max_tag=$(echo "$_max_tag" | sed 's/^v//')
  _full_version="${_max_tag}.r${_commit_count}.${_commit_hash}"
  printf "%s" "${_full_version}"
}

prepare() {
  patch -p1 -d ${srcdir}/${_pkgname} -i ${srcdir}/0001-fix-building-with-ctk.patch
  echo "Creating desktop file"
  gendesk -f -n --pkgname ${_pkgname} \
    --categories "Graphics;MedicalSoftware;Science;" \
    --exec "Slicer" \
    --icon "${_pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --startupnotify \
    --custom="StartupWMClass=Slicer"
}

build() {
  export CC=clang
  export CXX=clang++
  cmake \
    -B "${srcdir}/build" \
    -DBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSlicer_BUILD_DOCUMENTATION=OFF \
    -DSlicer_BUILD_I18N_SUPPORT=ON \
    -DSlicer_BUILD_PARAMETERSERIALIZER_SUPPORT=OFF \
    -DSlicer_REQUIRED_QT_VERSION=6 \
    -DSlicer_STORE_SETTINGS_IN_APPLICATION_HOME_DIR=OFF \
    -DSlicer_USE_GIT_PROTOCOL=OFF \
    -DSlicer_USE_PYTHONQT=ON \
    -DSlicer_USE_SimpleITK_SHARED=ON \
    -DSlicer_USE_SimpleITK=ON \
    -DSlicer_USE_SYSTEM_bzip2=ON \
    -DSlicer_USE_SYSTEM_CTK=OFF \
    -DSlicer_USE_SYSTEM_CTKAPPLAUNCHER=OFF \
    -DSlicer_USE_SYSTEM_CTKAppLauncherLib=OFF \
    -DSlicer_USE_SYSTEM_curl=ON \
    -DSlicer_USE_SYSTEM_DCMTK=ON \
    -DSlicer_USE_SYSTEM_ITK=OFF \
    -DSlicer_USE_SYSTEM_JsonCpp=OFF \
    -DSlicer_USE_SYSTEM_LibArchive=ON \
    -DSlicer_USE_SYSTEM_LibFFI=ON \
    -DSlicer_USE_SYSTEM_LZMA=ON \
    -DSlicer_USE_SYSTEM_OpenSSL=ON \
    -DSlicer_USE_SYSTEM_ParameterSerializer=OFF \
    -DSlicer_USE_SYSTEM_python=OFF \
    -DSlicer_USE_SYSTEM_qRestAPI=OFF \
    -DSlicer_USE_SYSTEM_QT=ON \
    -DSlicer_USE_SYSTEM_RapidJSON=OFF \
    -DSlicer_USE_SYSTEM_SlicerExecutionModel=OFF \
    -DSlicer_USE_SYSTEM_sqlite=OFF \
    -DSlicer_USE_SYSTEM_tbb=OFF \
    -DSlicer_USE_SYSTEM_teem=ON \
    -DSlicer_USE_SYSTEM_VTK=OFF \
    -DSlicer_USE_SYSTEM_zlib=ON \
    -GNinja \
    -S "${srcdir}/${_pkgname}" \
    -Wno-dev
  cmake --build "${srcdir}/build"
}

package() {
  cmake --build "${srcdir}/build/Slicer-build" --target package
  install -d "${pkgdir}/opt/${_pkgname}" "${pkgdir}/usr/bin"
  tar xvf "${srcdir}/build/Slicer-build/"*.tar.gz -C "${pkgdir}/opt/${_pkgname}" --strip-components 1
  ln -s /opt/${_pkgname}/Slicer "${pkgdir}/usr/bin/Slicer"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
}
# vim:set ts=2 sw=2 et:
