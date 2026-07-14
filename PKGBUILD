# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=journey-cloud
pkgver=5.2.3
pkgrel=1
pkgdesc="Your private diary, journal & companion (Journey Desktop)."
arch=('x86_64')
url='https://journey.cloud/'
provides=('journey')
conflicts=('journey' 'journey-bin' 'journey-git')
license=('LicenseRef-proprietary')
depends=('nss' 'gtk3' 'libxss' 'libnotify' 'libxtst' 'xdg-utils' 'libsecret')
optdepends=('libappindicator-gtk3: tray icon support')
makedepends=('squashfs-tools')
options=('!strip' '!emptydirs')
# Snap package name is journey-desktop (legacy snap "journey" stopped at 2.14.6)
_snapid="Uu8rnbebv24ri4ypRpKBRNBnrvWMOOhr"
_snaprev="62"
source=("${pkgname}-${pkgver}.snap::https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap")
sha256sums=('04758ee465351007d50b2fdda6bff6b9e2ea0a64278aab579b3136147bd64248')

prepare() {
  echo "Extracting snap file..."
  unsquashfs -q -f -d "${srcdir}/${pkgname}" "${pkgname}-${pkgver}.snap"
}

package() {
  # Install application payload
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/${pkgname}/." "${pkgdir}/opt/${pkgname}"

  # Desktop Entry
  sed -i \
    -e 's|${SNAP}/meta/gui/icon.png|journey-cloud|g' \
    -e "s|^Exec=journey-desktop|Exec=/usr/bin/journey-desktop|g" \
    "${pkgdir}/opt/${pkgname}/meta/gui/journey-desktop.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/journey-desktop.desktop" \
    "${pkgdir}/usr/share/applications/journey-desktop.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/icon.png" \
    "${pkgdir}/usr/share/pixmaps/journey-cloud.png"

  # Drop snap-only scaffolding (keep Electron app + bundled libs)
  rm -rf "${pkgdir}/opt/${pkgname}"/{data-dir,gnome-platform,meta,scripts,usr,*.sh}

  # Symlink binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/journey-desktop" "${pkgdir}/usr/bin/journey-desktop"
  # Compat name used by older package
  ln -s "/opt/${pkgname}/journey-desktop" "${pkgdir}/usr/bin/journey"
}
