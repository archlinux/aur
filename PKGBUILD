# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgbase="infekt"
pkgbase="${_pkgbase}-git"
pkgname=("${_pkgbase}-cli-git" "${_pkgbase}-gtk-git")
pkgver=1.3.0.r1.gcc99c16
pkgrel=2
pkgdesc="The ultimate best NFO viewer, ever!"
arch=('x86_64')
url="https://infekt.ws"
_url="https://github.com/syndicodefront/${_pkgbase}"
license=('GPL-2.0-or-later')
makedepends=('cmake>=3.2' 'dos2unix' 'gendesk' 'git' 'gtk2>=2.16' 'gtkmm>=2.4'
             'zlib')
depends=('cairo' 'gcc-libs' 'glibc')
_pkgsrc="${_pkgbase}"
source=("${_pkgsrc}::git+${_url}.git"
        "infekt_fix_cmake_gtk_source_list.patch"
        "infekt_fix_cmake_build_type.patch"
        "infekt_fix_includes.patch"
        "infekt_fix_forgiving_utf8.patch"
        "infekt_fix_nfo_view_ctrl.patch")
b2sums=('SKIP'
        '5693b424f7803cac656617f0723a74fb9786128a488fa2aed8749d1aa57b05bc19fbf20a29f77977135cecd7c53083857524c6482eb1a5e1b491cea49a61fdb1'
        'ea1df9339fbd1273dc98aa73616512308b5430d7f8927ecf6235894259bac514ed2e9bf0dfd62cc0cda32f4cfceeb011b273b31705491e428e397286f6c1efc3'
        'f213d1a32948d0cff57f66922143f4310a4272b24429387ed6788404d057db769c763b6a1f5035a370bfb6122684aaec5b7237e35185e5e60691ff7e69624d61'
        '31ac6b483ec42e824149a4bdfbd78cc06f9f802cc5fa970b3941a0dcb4be3894a012c9d322e40a4742e4135cb3bfec178317971af0b1c163c823bb74c4f628e2'
        '7ff7a5f54dd4003fbd299973d4a20e59440211a04cd129bae4df2aa09f09bdc037d8d8f9bf8232f1efe1aeb90aab17a847c063215791bcafed80bdfe25a510fc')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"
   gendesk -f \
    --pkgname="${_pkgbase}-gtk" \
    --pkgdesc="${pkgdesc}" \
    --exec="${_pkgbase}-gtk %U" \
    --icon="${_pkgbase}-gtk" \
    --categories="Utility;Graphics;GTK" \
    --name="iNFekt GTK" \
    --comment="${pkgdesc}" \
    --mimetypes="text/x-nfo"

  cd "${_pkgsrc}"
  find "src" -type f \( -name "*.h" -o -name "*.cpp" -o -name "*.txt" \) -exec dos2unix {} \;

  for _patch in "${srcdir}/${_pkgbase}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DOPTION_GTK=TRUE \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

package_infekt-cli-git() {
  local _pkgname="${pkgname%-git}"

  depends+=('libpng')
  provides=("${pkgname%-git}=${pkgver%%.r*}")
  conflicts=("${pkgname%-git}")

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgbase}/README.md"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"

  cd "${pkgdir}/usr"
  rm -rf "share/${_pkgbase}"

  cd "bin"
  rm -f "${_pkgbase}-gtk"
}

package_infekt-gtk-git() {
  local _pkgname="${pkgname%-git}"

  pkgdesc+=" - GTK2 GUI"
  depends+=('atkmm' 'cairomm' 'glib2' 'glibmm' 'gnome-themes-extra'
            'gtkmm>=2.4' 'hicolor-icon-theme' 'infekt-cli' 'libsigc++')
  provides=("${pkgname%-git}=${pkgver%%.r*}")
  conflicts=("${pkgname%-git}")

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  cd "${_pkgsrc}/release/PortableApps/App/AppInfo"
  for _icon in 16 32 128; do
    install -Dm644 "appicon_${_icon}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${_pkgname}.png"
  done

  cd "${pkgdir}/usr/bin"
  rm -f "${_pkgbase}-cli"
}
