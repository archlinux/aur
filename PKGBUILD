# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Cory Sanin <corysanin@artixlinux.org>
# Contributor: Nafis <mnabid.25@outlook.com>
# Contributor: David P. <megver83@parabola.nu>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=kate
pkgname="${_pkgname}-root"
pkgver=24.02.0
pkgrel=1
arch=(
  'x86_64'
  'i686'
  'armv7h'
  'armv6h'
  'aarch64'
  'pentium4'
  'riscv64'
)
license=(
  'CC0-1.0'
  'GFDL-1.3-or-later'  # Documentation is under "FDL" but I could not find out which version.
  'GPL-2.0-or-later'
  'LGPL-2.0-or-later'
  'LGPL-3.0-or-later'
  'MIT'
)
pkgdesc='Advanced Text Editor from the KDE project, patched to be able to run as root.'
groups=(
  'kde-applications'
  'kde-utilities'
)
url='https://apps.kde.org/kate/'
# url='https://download.kde.org/stable/release-service/' # To see latest available versions.
depends=(
  'hicolor-icon-theme'
  'gcc-libs'
  'glibc'
  # 'kactivities5>=5.90.0'
  'kcompletion>=6'
  'ki18n>=6'
  'kconfig>=6'
  'kconfigwidgets>=6'
  'kcoreaddons>=6'
  'kdbusaddons>=6'
  'kguiaddons>=6'
  'kio>=6'
  'kbookmarks>=6'
  'kcrash>=6'
  'kiconthemes>=6'
  # 'kjobwidgets>=6'
  'knewstuff>=6'
  'kparts>=6'
  'kservice>=6'
  'ktextwidgets>=6'
  'ktexteditor>=6'
  'kxmlgui>=6'
  'kwidgetsaddons>=6'
  'kwindowsystem>=6'
  # 'libx11'
  'qt6-base>=6.5.0'
  'syntax-highlighting>=6'
)
optdepends=(
  'bash: For migration script from kate session applet to kde plasma addon.'
  'clang: C and C++ LSP support.'
  'git: git-blame plugin.'
  'konsole: open a terminal in Kate.'
  'kuserfeedback>=6'
  'kwallet>=6'
  'markdownpart: Markdown preview.'
  'pkgconf: To use the pkg-config files.'
  'python-lsp-server: Python LSP support.'
  'rust: Rust LSP support.'
  'svgpart: SVG preview.'
  'texlab: LaTeX LSP support.'
)
makedepends=(
  'appstream'
  'attica>=6'
  'cmake>=3.16'
  'extra-cmake-modules>=6'
  'fontconfig'
  'freetype2'
  'gettext'
  'intltool'
  'kdoctools>=6'
  'kuserfeedback>=6'
  'kwallet>=6'
  # 'plasma-framework5>=5.90.0'
  'pkgconf'
  # 'python>=3.7' # Needed if `-DBUILD_python=ON`.
  # 'pyside2'     # Needed if `-DBUILD_python=ON`.
  # 'shiboken2'   # Needed if `-DBUILD_python=ON`.
)
checkdepends=(
  'appstream'
)
conflicts=(
  'kate'
  'kwrite'
)
provides=(
  "kate=${pkgver}"
  "kwrite=${pkgver}"
  "kate-kf6=${pkgver}"
  "kwrite-kf6=${pkgver}"
  "kate-qt6=${pkgver}"
  "kwrite-qt6=${pkgver}"
)
replaces=(
  'kwrite'
  'kwrite-root'
)
source=(
  "https://download.kde.org/stable/release-service/${pkgver}/src/${_pkgname}-${pkgver}.tar.xz"{,.sig}
  "0001-Defuse-root-block.patch"
)
sha256sums=(
  '9b1efcccf4e36efcdbc2eada6399cd8128ce187a19182400313062f75ee35f48'  # ${_pkgname}-${pkgver}.tar.xz
  '87f291b7d75cd9db732eba60af5b355b3145b45fb9ce9d0cd194554988d4072a'  # ${_pkgname}-${pkgver}.tar.xz.sig
  'abc7a33c8e8cd3a79ea4699bca0086c4146a9a43771a10fc60b97dcf62faca44'  # 0001-Defuse-root-block.patch
)
validpgpkeys=(
  'CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7'  # Albert Astals Cid <aacid@kde.org>
  'F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87'  # Christoph Feck <cfeck@kde.org>
  'D81C0CB38EB725EF6691C385BB463350D6EF31EF'  # Heiko Becker <heiko.becker@kde.org>
)

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # root shall be allowed once again.
  for _patch in "${srcdir}/0001-Defuse-root-block.patch"; do
    msg2 "Applying patch $(basename "${_patch}") ..."
    patch -Np1 --follow-symlinks -i "${srcdir}/0001-Defuse-root-block.patch"
  done
}

build() {
  cd "${srcdir}"

  # 2023-10-31, pkgver=23.08.2: -DBUILD_python=ON would result in the following build error:  
  # ```
  # In file included from /usr/include/shiboken2/sbkpython.h:104,
  #                  from /usr/include/shiboken2/shiboken.h:43,
  #                  from /tmp/makepkg/build/kate-root/src/build/addons/python/PyKate/Kate/ktexteditor_application_wrapper.cpp:6:
  # /usr/include/shiboken2/pep384impl.h:337:3: error: #error Please check the buffer compatibility for this python version!
  #   337 | # error Please check the buffer compatibility for this python version!
  #       |   ^~~~~
  # ```

  cmake -B build -S "${_pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_COVERAGE=OFF \
    -DBUILD_PCH=ON \
    -DBUILD_PYTHON_BINDINGS=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=ON \
    -DBUILD_WITH_QT6=OFF \
    -DBUILD_addons=ON \
    -DBUILD_apps=ON \
    -DBUILD_backtracebrowser=ON \
    -DBUILD_close-except-like=ON \
    -DBUILD_cmake-tools=ON \
    -DBUILD_colorpicker=ON \
    -DBUILD_compiler-explorer=ON \
    -DBUILD_doc=ON \
    -DBUILD_eslint=ON \
    -DBUILD_externaltools=ON \
    -DBUILD_filebrowser=ON \
    -DBUILD_filetree=ON \
    -DBUILD_format=ON \
    -DBUILD_gdbplugin=ON \
    -DBUILD_git-blame=ON \
    -DBUILD_kate=ON \
    -DBUILD_kate-ctags=ON \
    -DBUILD_katebuild-plugin=ON \
    -DBUILD_katesql=ON \
    -DBUILD_keyboardmacros=ON \
    -DBUILD_konsole=ON \
    -DBUILD_kwrite=ON \
    -DBUILD_latexunicodecompletion=ON \
    -DBUILD_lspclient=ON \
    -DBUILD_openlink=ON \
    -DBUILD_preview=ON \
    -DBUILD_project=ON \
    -DBUILD_python=OFF \
    -DBUILD_rainbow-parens=ON \
    -DBUILD_replicode=ON \
    -DBUILD_search=ON \
    -DBUILD_sessionapplet=ON \
    -DBUILD_snippets=ON \
    -DBUILD_symbolviewer=ON \
    -DBUILD_tabswitcher=ON \
    -DBUILD_textfilter=ON \
    -DBUILD_xmlcheck=ON \
    -DBUILD_xmltools=ON \
    -DENABLE_BSYMBOLICFUNCTIONS=ON \
    -DKDE_INSTALL_PREFIX_SCRIPT=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DKDE_SKIP_UNINSTALL_TARGET=ON

  cmake --build build
}

check() {
  cd "${srcdir}/build"

  make test
}

package() {
  cd "${srcdir}"

  DESTDIR="${pkgdir}" cmake --install build

  cd "${_pkgname}-${pkgver}"

  install -Dvm644   README.md "${pkgdir}/usr/share/${_pkgname}/README.md"
  install -dvm755   "${pkgdir}/usr/share/${_pkgname}/LICENSES"

  for _license in LICENSES/*; do
    install -Dvm644 "${_license}" \
                    "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_license}")"
    ln -srv "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_license}")" \
            "${pkgdir}/usr/share/${_pkgname}/LICENSES/$(basename "${_license}")"
  done
}
