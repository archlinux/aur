# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Ryan Owens <RyanOwens[at]linux[dot]com>

_Name="KISS"
pkgname="${_Name,,}"
_commit="9a886c0987b7a9d6ab938d3dc909191e583a8c9d" # 5.2.2
pkgver=5.2.2
pkgrel=1
pkgdesc="An IDE for the KIPR's Instructional Software System platform"
arch=('x86_64')
url="https://github.com/kipr/${pkgname}"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'libkar' 'libkovanserial' 'pcompiler'
         'qscintilla-qt5' 'qt5-base' 'qt5-quick1')
makedepends=('cmake>=2.8.12' 'gendesk' 'qt5-tools')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('804534e38bd5b8debfdf8809b3d13813617ae4e37c8181a3ce52a52e4681e397cb99e1f6908b502eb02b676b36ca2b26446a1b70bdac6a17ae0ba823573d480f')

prepare() {
  cd "${srcdir}"
  gendesk -f -n \
    --name "${_Name}" \
    --exec "${_Name}" \
    --icon "${pkgname}" \
    --comment "${pkgdesc}" \
    --categories "Development" \
    "${pkgname}"

  cd "${_pkgsrc}"
  # respect build flags
  # adjust for qscintilla-qt5 naming changes
  sed -e '/^add_definitions(/d' \
      -e 's/ qscintilla2 / qscintilla2_qt5 /g' \
      -i 'CMakeLists.txt'
}

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -Wno-dev
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  install -vDm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"
  cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "Readme.markdown" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -vDm644 "rc/logos/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  cd "deploy"
  install -vDm755 "${_Name}" "${pkgdir}/opt/${pkgname}/${_Name}"

  find "docs" "locale" -type f ! -name 'CMakeLists.txt' -exec \
    install -vDm644 "{}" "${pkgdir}/opt/${pkgname}/{}" \;
  # find "template_packs" -type f ! -name 'CMakeLists.txt' -exec \
  #   install -vDm644 "{}" "${pkgdir}/opt/${pkgname}/{}" \;
  find "template_packs" -type f ! -name 'CMakeLists.txt' -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/${pkgname}/{}" \;

  install -vd "${pkgdir}/usr/bin"
  ln -vsf "/opt/${pkgname}/${_Name}" "${pkgdir}/usr/bin/${_Name}"
}
