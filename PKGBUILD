pkgname=footage-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Trim, flip, rotate and crop videos using native Arch Linux libraries"
arch=('x86_64')
url="https://gitlab.com/adhami3310/Footage"
license=('GPL-3.0-only')
depends=(
  'dconf'
  'glib2'
  'glibc'
  'graphene'
  'gst-editing-services'
  'gst-libav'
  'gst-plugin-gtk4'
  'gst-plugins-bad'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gstreamer'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'libgcc'
)
makedepends=('ostree' 'perl')
provides=("footage=${pkgver}")
conflicts=('footage')
options=('!debug')
install=footage-bin.install

# Update both commits when pkgver changes.
# Pin the application and its matching translations to the Flathub 1.4.0 build.
_commit='0aabb7e5bb04f9a4109c0826bddabeca0d36d0c02acc52889f24ca7a3ab26177'
_locale_commit='2ac0c248c1371a510fc141b621c4ea59ad33050a8c80eb8e362bc436dcfe5316'

prepare() {
  local repo="${srcdir}/footage-repo"
  local binary="${srcdir}/footage-flatpak/files/bin/footage"
  local original_size
  local version

  ostree --repo="${repo}" init --mode=bare-user-only
  ostree --repo="${repo}" remote add --force --no-gpg-verify \
    flathub https://dl.flathub.org/repo/
  ostree --repo="${repo}" pull --http-header='User-Agent=curl/8.20.0' \
    flathub "${_commit}" "${_locale_commit}"
  # Replace previous checkouts so prepare() can run again without stale files.
  rm -rf "${srcdir}/footage-flatpak" "${srcdir}/footage-locale"
  ostree --repo="${repo}" checkout --user-mode "${_commit}" "${srcdir}/footage-flatpak"
  ostree --repo="${repo}" checkout --user-mode "${_locale_commit}" "${srcdir}/footage-locale"

  version="$(sed -n 's/.*<release version="\([^"]*\)".*/\1/p' \
    "${srcdir}/footage-flatpak/files/share/metainfo/io.gitlab.adhami3310.Footage.metainfo.xml" | head -n1)"
  if [[ "${version}" != "${pkgver}" ]]; then
    error 'Update the Flathub commits to match pkgver'
    return 1
  fi
  if [[ "$(grep -aoF '/app/share/' "${binary}" | wc -l)" -ne 4 ]]; then
    error 'Unexpected Footage resource path count'
    return 1
  fi
  original_size="$(stat -c %s "${binary}")"
  # Rust strings contain explicit lengths. Keep each replacement the same size.
  perl -pi -e 's{/app/share/}{/usr/share/}g' "${binary}"
  if [[ "$(stat -c %s "${binary}")" -ne "${original_size}" ]]; then
    error 'The Footage path change modified the binary size'
    return 1
  fi
}

check() {
  local appdir="${srcdir}/footage-flatpak/files"
  local log="${srcdir}/footage-ldd.log"

  if ! ldd -r "${appdir}/bin/footage" > "${log}"; then
    cat "${log}"
    return 1
  fi
  if grep -Eq 'not found|undefined symbol' "${log}"; then
    cat "${log}"
    return 1
  fi
  if grep -aFq '/app/' "${appdir}/bin/footage" || \
    readelf -d "${appdir}/bin/footage" | grep -Eq '\((RPATH|RUNPATH)\)'; then
    error 'Footage still contains a Flatpak path'
    return 1
  fi
  glib-compile-schemas --strict --dry-run "${appdir}/share/glib-2.0/schemas"
}

package() {
  local appdir="${srcdir}/footage-flatpak/files"
  local directory
  local translation
  local language

  install -Dm755 "${appdir}/bin/footage" "${pkgdir}/usr/bin/footage"
  install -d "${pkgdir}/usr/share"
  for directory in applications dbus-1 footage glib-2.0 icons metainfo; do
    cp -a "${appdir}/share/${directory}" "${pkgdir}/usr/share/"
  done
  rm "${pkgdir}/usr/share/applications/mimeinfo.cache" \
    "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled" \
    "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
  sed -i 's#/app/bin/footage#/usr/bin/footage#' \
    "${pkgdir}/usr/share/dbus-1/services/io.gitlab.adhami3310.Footage.service"

  for translation in "${srcdir}/footage-locale/files/"*/share/*/LC_MESSAGES/footage.mo; do
    language="${translation%/LC_MESSAGES/footage.mo}"
    language="${language##*/}"
    install -Dm644 "${translation}" \
      "${pkgdir}/usr/share/locale/${language}/LC_MESSAGES/footage.mo"
  done
  install -Dm644 "${appdir}/share/licenses/io.gitlab.adhami3310.Footage/footage/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
