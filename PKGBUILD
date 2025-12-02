# Maintainer: Hristo Voyvodov <hristo.voyvodov@hotmail.com>
# Contributor: Carson Mullins <SeptemAUR@pm.me>
_snapinfo=$(curl -sH 'Snap-Device-Series: 16' http://api.snapcraft.io/v2/snaps/info/nordpass)
_snapdownloadurl=$(sed -E 's/.*"download":?[^}]*"url":"?([^,"]*)"?.*/\1/' <<< "${_snapinfo}" | xargs)
pkgname='nordpass-bin'
pkgver=$(sed -E 's/.*"version":"?([^,"]*)"?.*/\1/' <<< "${_snapinfo}" | xargs)
pkgrel=2
pkgdesc="NordPass password manager (Snap release)"
arch=('x86_64')
url='https://nordpass.com'
license=('custom')
depends=('gtk3' 'libsecret' 'alsa-lib' 'nss')
makedepends=('squashfs-tools' )
options=('!strip')
provides=('nordpass')

source=('LICENSE'
        "${_snapdownloadurl}")
sha256sums=('88798af2f6f88ea827870c47cc7bdcac61a4a39a32cd7ed0b2682a6150369e4c'
            'SKIP')

prepare ()
{
  unsquashfs -force -quiet -dest "${srcdir}/${pkgname}" "${_snapdownloadurl##*/}"
}

package ()
{
  # Install files
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}/." "${pkgdir}/opt/${pkgname}"

  # Desktop Entry
  sed -i 's|${SNAP}/meta/gui/icon.png|nordpass|g' \
	  "${pkgdir}/opt/${pkgname}/meta/gui/nordpass.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/nordpass.desktop" \
	  -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/icon.png" \
	  "${pkgdir}/usr/share/pixmaps/nordpass.png"

  # Clean up unnecessary files
  rm -rf "${pkgdir}/opt/${pkgname}"/{data-dir,gnome-platform,lib,meta,scripts,usr,*.sh}

  # Symlink binary to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/nordpass" "${pkgdir}/usr/bin"

  # Install license
  # https://my.nordaccount.com/legal/terms-of-service/
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
