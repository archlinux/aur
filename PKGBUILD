# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="infekt"
pkgname=("${pkgbase}-"{'cli','gtk'})
_commit_rel="5c57cbea0efd720940feaf04ff3e05dee1074ab2" # 1.3.0
_commit="8ebd5a826f09c0dfe8cc664984969acca57f4d2d" # r4
pkgver="1.3.0+r4+g${_commit::7}"
pkgrel=1
pkgdesc="The ultimate best NFO viewer, ever!"
arch=('x86_64')
url="https://infekt.ws"
_url="https://github.com/syndicodefront/${pkgbase}"
license=('GPL-2.0-or-later')
depends=('cairo' 'gcc-libs' 'glibc')
makedepends=('atkmm' 'cairomm' 'cmake>=3.2' 'dos2unix' 'gendesk' 'glib2'
             'glibmm' 'gtkmm>=2.4' 'hicolor-icon-theme' 'libpng' 'libsigc++')
_pkgsrc="${pkgbase}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz"
        "${pkgbase}_cmake_build_type.patch"
        "${pkgbase}_cmake_gtk_source_list.patch"
        "${pkgbase}_missing_includes.patch"
        "${pkgbase}_forgiving_utf8.patch"
        "${pkgbase}_nfo_view_ctrl.patch")
b2sums=('2fa8388b49f91e295add61fc56e7244f697b24da9535601b98b5d1ab1406ad93887375b69b2f733b885bf6713d1f47ca3e643262e9c1f76e6d95a1dabd8018a9'
        'ea1df9339fbd1273dc98aa73616512308b5430d7f8927ecf6235894259bac514ed2e9bf0dfd62cc0cda32f4cfceeb011b273b31705491e428e397286f6c1efc3'
        '5693b424f7803cac656617f0723a74fb9786128a488fa2aed8749d1aa57b05bc19fbf20a29f77977135cecd7c53083857524c6482eb1a5e1b491cea49a61fdb1'
        '43bcdc378f02de60304c13967a5dc405e5bb6c1e6ac18e65b29b1c31af5e19c31ea99d42a2709e4c7dead9ac7300af6de6b0750941256a494fe828358e681395'
        '31ac6b483ec42e824149a4bdfbd78cc06f9f802cc5fa970b3941a0dcb4be3894a012c9d322e40a4742e4135cb3bfec178317971af0b1c163c823bb74c4f628e2'
        '7ff7a5f54dd4003fbd299973d4a20e59440211a04cd129bae4df2aa09f09bdc037d8d8f9bf8232f1efe1aeb90aab17a847c063215791bcafed80bdfe25a510fc')

prepare() {
  cd "${srcdir}"
  gendesk \
    -f \
    -n \
    --pkgname="${pkgbase}-gtk" \
    --pkgdesc="${pkgdesc}" \
    --exec="${pkgbase}-gtk %U" \
    --icon="${pkgbase}-gtk" \
    --categories="Utility;Graphics;GTK" \
    --name="iNFekt GTK" \
    --comment="${pkgdesc}" \
    --mimetypes="text/x-nfo"

  cd "${_pkgsrc}"
  find "src" -type f \( -name '*.h' -o -name '*.cpp' -o -name '*.txt' \) -exec dos2unix {} \;

  patch -Np1 -i "${srcdir}/${pkgbase}_cmake_build_type.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_cmake_gtk_source_list.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_missing_includes.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_forgiving_utf8.patch"
  patch -Np1 -i "${srcdir}/${pkgbase}_nfo_view_ctrl.patch"
}

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -DOPTION_GTK=TRUE
    -Wno-dev
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package_infekt-cli() {
  depends+=('libpng')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"

  cd "${pkgdir}/usr"
  rm -rf "share/${pkgbase}"

  cd "bin"
  rm -f "${pkgbase}-gtk"
}

package_infekt-gtk() {
  pkgdesc+=" - GTK2 GUI"
  depends+=('atkmm' 'cairomm' 'glib2' 'glibmm' 'gtkmm>=2.4'
            'hicolor-icon-theme' 'infekt-cli' 'libsigc++')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  install -vDm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${_pkgsrc}/release/PortableApps/App/AppInfo"
  for _icon in 16 32 128; do
    install -vDm644 "appicon_${_icon}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname}.png"
  done

  cd "${pkgdir}/usr/bin"
  rm -f "${pkgbase}-cli"
}
