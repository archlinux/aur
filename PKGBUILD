# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Martin Rys <rys.rs/contact>
# Contributor: Brian Li <brian14708@gmail.com>
# Contributor: Denys Zariaiev <denys.zariaiev@gmail.com>

pkgname=chitubox-free-beta-bin
pkgver=2.2.0
pkgrel=1
pkgdesc='All-in-one SLA/DLP/LCD Slicer, Beta version'
arch=('x86_64')
url='https://www.chitubox.com/download.html'
license=('LicenseRef-CHITUBOX')
depends=(
  'bash'
  'dbus'
  'expat'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'java-runtime'
  'krb5'
  'libdrm'
  'libglvnd'
  'libx11'
  'libxcb'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxshmfence'
  'nspr'
  'nss'
  'qt6-base'
  'qt6-declarative'
  'wayland'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
  'zlib'
)
makedepends=('icoutils')
options=('!debug' '!strip')

_pkgver_major_minor="$(cut -d . -f -2 <<< "${pkgver}")"

source=(
  "${pkgname}-${pkgver}.tar.gz::https://sac.chitubox.com/software/download.do?softwareId=17839&softwareVersionId=v${pkgver}&fileName=CHITUBOX_Basic_Linux_Installer_V${_pkgver_major_minor}_Beta.tar.gz"
  'chitubox-basic-beta.desktop'
  'chitubox-basic-beta.xml'
)

sha512sums=(
  'bacbbddff6d1c5ca8e8d26e633050523360285880276d21b6b93c88c6458d20874c1cbfa6c7c25197d79cc6951af1f3df9d45079ecc839fb6e95088dedcd68fe'
  'b9127c965f503ac256c0faa9761035996aa259b66248d9c6dd3ce4b3df9cb5fea129b68d84b8e3f256b47daa0cb5db6f86127d5bea410e6bffd0f2b924e73819'
  '658997d9569f9fa4b2d4d33867e925dc4542b69e1a2cb362fe1ad5598600f4853053777649790a89e452646fbacb245ca3a584924b89f6d2dbd89a16c8f45b19'
)

package() {
  # Use a path close to the default in the installer
  INSTALL_ROOT="${srcdir}/opt/CHITUBOX_Basic_Beta"
  OPT_DIR="${pkgdir}/opt"
  APP_DIR="${OPT_DIR}/CHITUBOX_Basic_Beta"

  # Run installer, which unfortunately doesn't run without root privileges. So it's not possible to put the install in build().
  echo >&2 'Running the installer'
  "${srcdir}/CHITUBOX_Basic_Linux_Installer_V${_pkgver_major_minor}_Beta.run" \
    --root "${INSTALL_ROOT}" --accept-licenses --no-size-checking \
    --accept-messages --confirm-command install

  echo >&2 'Cleaning up'
  rm "${INSTALL_ROOT}/Uninstall"*
  rm "${INSTALL_ROOT}/InstallationLog.txt"
  rm "${INSTALL_ROOT}"/bin/Resources/DependentSoftware/recordOrShot/*.exe

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${INSTALL_ROOT}/Licenses/LICENSE.txt"

  echo >&2 'Packaging binary data'
  install -d "${pkgdir}"/opt
  mv "${INSTALL_ROOT}" "${OPT_DIR}/"

  echo >&2 'Packaging the launcher'
  install -d "${pkgdir}"/usr/bin
  ln -s /opt/CHITUBOX_Basic_Beta/CHITUBOX_Basic.sh \
    "${pkgdir}/usr/bin/chitubox-basic-beta"

  echo >&2 'Packaging the desktop file'
  install -D -m 644 -t "${pkgdir}/usr/share/applications" \
    chitubox-basic-beta.desktop

  echo >&2 'Extracting and packaging the icon'
  icotool --extract \
    "${APP_DIR}/bin/Resources/Image/SoftwareIcon/freeIcon.ico" \
    --output .
  install -D -m 644 freeIcon_1_256x256x32.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/chitubox-basic-beta.png"

  echo >&2 'Packaging the MIME associations'
  install -D -m 644 -t "${pkgdir}/usr/share/mime/packages" \
    chitubox-basic-beta.xml
}
