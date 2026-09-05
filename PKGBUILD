# Maintainer:  dreieck

_pkgname=chameleonultragui
pkgname="${_pkgname}-bin-latest"
pkgver=r613.20260830.bd9356b
pkgrel=1
pkgdesc='Flutter GUI for the Chameleon Ultra RFID card cloning and emulation device. Automatic upstream binary build from latest upstream git commit.'
arch=('x86_64')
license=(
  'GPL-3.0-or-later'
  'BSD-3-Clause'
  'MIT'
  'LGPL-3.0-or-later'
)
url="https://chameleon.run/"
depends=(
  'glibc'
  'gtk3'
  'libatk-1.0.so'         # at-spi2-core
  'libcairo.so'           # cairo
  'libcairo-gobject.so'   # cairo
  'libepoxy.so'           # libepoxy
  'libfontconfig.so'      # fontconfig
  'libgcc_s.so'           # libgcc
  'libgdk_pixbuf-2.0.so'  # gdk-pixbuf2
  'libglib-2.0.so'        # glib2
  'libgobject-2.0.so'     # glib2
  'libgio-2.0.so'         # glib2
  'libpango-1.0.so'       # pango
  'libpangocairo-1.0.so'  # pango
  'libharfbuzz.so'        # harfbuzz
  'libstdc++.so'          # libstdc++
  'libz.so'               # zlib
  'zenity'
)
makedepends=(
  'git'
)
provides=(
  "${_pkgname}"
  "${_pkgname}-git=${pkgver}"
  "${_pkgname}-docs"
  "${_pkgname}-docs-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-git"  # This is here for now since package 'chameleonultragui-git' does _not_ have 'chameleonultragui' in it's provides nor conflicts array, as of 2026-06-17. See https://aur.archlinux.org/packages/chameleonultragui-git#comment-1075717.
  "${_pkgname}-docs"
)
replaces=()
source=(
  "${_pkgname}-linux.zip::https://github.com/GameTec-live/ChameleonUltraGUI/releases/download/dev/linux.zip"  # Precompiled binary.
  "${_pkgname}::git+https://github.com/GameTec-live/ChameleonUltraGUI.git"                                    # Use this to retrieve version information.
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi

}

package() {
  cd "${srcdir}/linux"

  # Create directories.
  install -dvm755 "${pkgdir}/usr/bin"
  install -dvm755 "${pkgdir}/usr/lib/${_pkgname}"

  # Copy files in place. Executable with executable permission. Keep relative directory structure so that libraries are found.
  install -Dvm755 -t "${pkgdir}/usr/lib/${_pkgname}"/ chameleonultragui
  cp -rv lib data "${pkgdir}/usr/lib/${_pkgname}"/

  # Symlink executable into '/usr/bin/'.
  ln -sv "/usr/lib/${_pkgname}"/chameleonultragui  "${pkgdir}/usr/bin"/chameleonultragui

  # Install third party license information.
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/thirdparty"  "data/flutter_assets/assets/licenses"/*

  cd "${srcdir}/${_pkgname}"

  # Install .desktop file and application icon.
  install -Dvm644 chameleonultragui/aur/chameleonultragui.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -dvm755 "${pkgdir}/usr/share/pixmaps"
  ln -sv /usr/lib/chameleonultragui/data/flutter_assets/assets/logo.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  # Install documentation and license.
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log CONTRIBUTING.md CODE_OF_CONDUCT.md README.md SECURITY.md
  cp -rv screenshots "${pkgdir}/usr/share/doc/${_pkgname}"/
  cp -rv docs "${pkgdir}/usr/share/doc/${_pkgname}"/
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSE
}
