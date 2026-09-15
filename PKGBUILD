pkgname=folio-bin
pkgver=26.01
pkgrel=1
pkgdesc="Markdown note-taking application for GNOME using native Arch Linux libraries"
arch=('x86_64')
url="https://github.com/toolstack/Folio"
license=('GPL-3.0-or-later')
depends=(
  'dconf'
  'glib2'
  'glibc'
  'gtk4'
  'gtksourceview5'
  'libadwaita'
  'libgee'
  'pango'
)
makedepends=('perl')
provides=("folio=${pkgver}")
conflicts=('folio')
options=('!debug')
source=("${url}/releases/download/${pkgver}/Folio-${pkgver}-x86_64.AppImage")
noextract=("Folio-${pkgver}-x86_64.AppImage")
sha256sums=('1ada0025ec3fdbe79511b52d9db7025d0ef30e0eaed738b0d297d3268e524364')

prepare() {
  local appimage="${srcdir}/Folio-${pkgver}-x86_64.AppImage"
  local binary="${srcdir}/squashfs-root/usr/local/bin/com.toolstack.Folio"
  local original_size

  chmod +x "${appimage}"
  cd "${srcdir}"
  "${appimage}" --appimage-extract >/dev/null

  if [[ "$(grep -aoF '/usr/local/share/locale' "${binary}" | wc -l)" -ne 1 ]]; then
    error 'Unexpected Folio locale path count'
    return 1
  fi

  original_size="$(stat -c %s "${binary}")"
  perl -pi -e 's{/usr/local/share/locale}{/usr/share/locale\x00\x00\x00\x00\x00\x00}' "${binary}"
  if [[ "$(stat -c %s "${binary}")" -ne "${original_size}" ]]; then
    error 'Patching the Folio locale path changed the binary size'
    return 1
  fi
}

check() {
  local appdir="${srcdir}/squashfs-root/usr/local"
  local binary
  local log

  for binary in com.toolstack.Folio folio-search-provider; do
    log="${srcdir}/${binary}.ldd.log"
    if ! ldd -r "${appdir}/bin/${binary}" > "${log}"; then
      cat "${log}"
      return 1
    fi
    if grep -Eq 'not found|undefined symbol' "${log}"; then
      cat "${log}"
      return 1
    fi
    if readelf -d "${appdir}/bin/${binary}" | grep -Eq '\((RPATH|RUNPATH)\)'; then
      error "${binary} contains an AppImage library search path"
      return 1
    fi
  done

  if grep -aFq '/usr/local/' "${appdir}/bin/com.toolstack.Folio"; then
    error 'Folio still contains an /usr/local path'
    return 1
  fi

  glib-compile-schemas --strict --dry-run "${appdir}/share/glib-2.0/schemas"
}

package() {
  local appdir="${srcdir}/squashfs-root/usr/local"

  install -Dm755 "${appdir}/bin/com.toolstack.Folio" \
    "${pkgdir}/usr/bin/com.toolstack.Folio"
  install -Dm755 "${appdir}/bin/folio-search-provider" \
    "${pkgdir}/usr/bin/folio-search-provider"

  install -d "${pkgdir}/usr/share"
  cp -r "${appdir}/share/." "${pkgdir}/usr/share/"
  rm "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"

  sed -i 's#/usr/local/bin/#/usr/bin/#g' \
    "${pkgdir}/usr/share/applications/com.toolstack.Folio.desktop" \
    "${pkgdir}/usr/share/applications/com.toolstack.Folio-editor.desktop" \
    "${pkgdir}/usr/share/dbus-1/services/com.toolstack.Folio.service"
}
