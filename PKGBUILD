# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=kinoklip-bin
pkgver=1.7.0
pkgrel=1
pkgdesc='Kinoklip — video editor: cut, arrange, add effects and export'
arch=('x86_64')
url='https://github.com/SeniorMatt/kinoklip'
license=('GPL3')
options=(!strip)
_appimage="Kinoklip-${pkgver}-x86_64.AppImage"

source=("${_appimage}::https://github.com/SeniorMatt/kinoklip/releases/download/v${pkgver}/Kinoklip-x86_64.AppImage")
sha256sums=('75b232c85dca13863e7736cefd63be78ff9f42a6eddac8cb90d9241dbc7f1a9a')

prepare() {
  cd "${srcdir}"
  chmod +x "${_appimage}"
  "./${_appimage}" --appimage-extract >/dev/null 2>&1
}

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a squashfs-root/. "${pkgdir}/opt/${pkgname}/"
  chmod -R a+rX "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/kinoklip" <<'EOF'
#!/bin/sh
exec /opt/kinoklip-bin/AppRun "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/kinoklip"

  install -Dm644 squashfs-root/org.kinoklip.Kinoklip.desktop \
    "${pkgdir}/usr/share/applications/org.kinoklip.Kinoklip.desktop"

  # icons
  if [[ -d squashfs-root/usr/share/icons/hicolor ]]; then
    install -d "${pkgdir}/usr/share/icons/hicolor"
    cp -a squashfs-root/usr/share/icons/hicolor/. "${pkgdir}/usr/share/icons/hicolor/"
    chmod -R a+rX "${pkgdir}/usr/share/icons/hicolor"
  fi

  # metainfo + mime
  if [[ -f squashfs-root/usr/share/metainfo/org.kinoklip.Kinoklip.appdata.xml ]]; then
    install -Dm644 squashfs-root/usr/share/metainfo/org.kinoklip.Kinoklip.appdata.xml \
      "${pkgdir}/usr/share/metainfo/org.kinoklip.Kinoklip.appdata.xml"
  fi
  if [[ -f squashfs-root/usr/share/mime/packages/org.kinoklip.Kinoklip.xml ]]; then
    install -Dm644 squashfs-root/usr/share/mime/packages/org.kinoklip.Kinoklip.xml \
      "${pkgdir}/usr/share/mime/packages/org.kinoklip.Kinoklip.xml"
  fi

  install -Dm644 squashfs-root/usr/share/doc/kinoklip/license.md \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
