# Maintainer: envolution
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154
# ci|forcedep=flutter-target-linux flutter-target-android flutter-target-web|

pkgname=yubioath-desktop
_pkgname=yubioath-flutter
pkgdesc='Yubico Authenticator for Desktop'
pkgver=7.2.3
pkgrel=1
arch=('x86_64')
url='https://github.com/Yubico/yubioath-flutter'
license=('BSD-3-Clause')
makedepends=(
  'git'
  'python'
  'cmake'
  'clang'
  'ninja'
  'pkgconf'
  'flutter'
  'git'
  'python-poetry'
  'python-build'
  'python-installer'
  'libappindicator-gtk3'
  'libnotify'
)
depends=(
  'gtk3'
  'libx11'
  'hicolor-icon-theme'
  'libappindicator-gtk3'
  'libnotify'
  'pcsclite'
  'ccid'
  'yubikey-manager'
  'mpdecimal'
)
source=(
  "git+$url.git#tag=$pkgver?signed"
)
provides=(yubioath-authenticator)
validpgpkeys=(
  '59944611C823D88CEB7245B906FC004369E7D338' # Dag Heyman <dag@yubico.com> (Expires: 2021-05-07)
  '2D6753CFF0B0FB32F9EEBA485B9688125FF0B636' # Emil Lundberg (staff engineer) <emil@yubico.com> (Expires: Never)
  'D6919FBF48C484F3CB7B71CD870B88256690D8BC' # Dennis Fokin <dennis.fokin@yubico.com> (Expires: 2025-08-01)
  '5084E25301EDF4A1C9B1DF62C9B1E4A3CBBD2E10' # Adam Velebil <adam.velebil@yubico.com> (Expires: Never)
  '20EE325B86A81BCBD3E56798F04367096FBA95E8' # Dain Nilsson <dain@yubico.com> (Expires: 2026-04-30)
  'D6EAB59739E09A9F7C7771ACAC6D6B9D715FC084' # Adam Velebil <adam.velebil@yubico.com> (Expires: Never)
)
sha512sums=('43bcdf9e468b31ea255b2b898d5b9308a79697fdea9e2e9060c2f7f97b58100309cd4ff041bf72c96c1178db8ce79a03edcdbe2720b9fc29e7f557785a7fbd02')

prepare() {
  cd $_pkgname
  sed -i 's/intl: ^0.19.0/intl: ^0.20.2/' pubspec.yaml
# This forces prefix - TODO: there must be a better way
  sed -i '/if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)/, /endif()/ {
    /if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)/s/^/#/
    /endif()/s/^/#/
}' "linux/CMakeLists.txt"

  sed -i 's/-Wall -Werror/-Wall -Werror -Wno-error=deprecated-declarations/' linux/CMakeLists.txt
}

build() {
  cd "${srcdir}/${_pkgname}"

  echo "Building authenticator-helper for Linux..."
  cd helper
  poetry install --no-root
  rm -rf ../build/linux/helper
  poetry -n -q run pyinstaller authenticator-helper.spec --distpath ../build/linux

  echo "Building main Flutter application..."
  cd "${srcdir}/${_pkgname}"
  flutter build linux --release
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "build/linux/x64/release/bundle/"* "${pkgdir}/opt/${pkgname}/"

  # The compiled binary is named "authenticator". Rename it to match the package name.
  mv "${pkgdir}/opt/${pkgname}/authenticator" "${pkgdir}/opt/${pkgname}/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${pkgdir}/opt/${pkgname}/linux_support/com.yubico.yubioath.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/linux_support/com.yubico.yubioath.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  sed -i "s|Exec=.*|Exec=${pkgname}|" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i "s|Icon=.*|Icon=${pkgname}|" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
