pkgname=orion-beta
pkgver=0.4.1
pkgrel=1
pkgdesc="Orion Beta web browser using native Arch Linux libraries"
arch=('x86_64')
url="https://kagi.com/orion/"
license=('LicenseRef-proprietary')
depends=(
  'bzip2'
  'cairo'
  'curl'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'graphene'
  'gtk4'
  'harfbuzz'
  'libadwaita'
  'libsecret'
  'libsoup3'
  'openssl'
  'pango'
  'vulkan-icd-loader'
  'webkitgtk-6.0'
  'xz'
)
makedepends=('ostree' 'patchelf')
provides=("orion-browser=${pkgver}")
options=('!debug')
source=(
  'LICENSE'
)
sha256sums=('18fd7c419da08efe8ef55acb05f411704ee6b4622879a98209416eb4b9f49e40')

_repo_url='https://flatpak.orionbrowser.com/repo/beta/'
_gpg_key='mDMEamlrPhYJKwYBBAHaRw8BAQdANemX0KA6cJmoaM6thz/NxXp2Sk4pmPSNQ0qqgFnnggy0LE9yaW9uIEJ1aWxkIFNpZ25pbmcgPGFkbWluQG9yaW9uYnJvd3Nlci5jb20+iJMEExYKADsWIQTQVPD7wkF2gvzpj+lP9wc8h8uRqgUCamlrPgIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRBP9wc8h8uRqnJSAQDjw2IwmD9Z/3EeWCjT9Wl43YXpK30mFC5cjFOLkRWWeAEAnBlLdTZFkaiuDSYy0ZMDyXFaMSnALyxiH09uX5167QG4OARqaWs+EgorBgEEAZdVAQUBAQdAF1JbWnW9U+TeeInPoMyybh7Mx59GdRZw93zQ33craR4DAQgHiHgEGBYKACAWIQTQVPD7wkF2gvzpj+lP9wc8h8uRqgUCamlrPgIbDAAKCRBP9wc8h8uRqovDAQC3LZfMfxsQ6zLrBVK0JCr7lxVhRqEtdS2fjZ8aOpiHEwD+NA7VEQcmDK42BSNRvtKYibPXJwmI6o2NYKoye3Soqgs='

prepare() {
  local repo="${srcdir}/orion-repo"

  ostree --repo="${repo}" init --mode=bare-user-only
  ostree --repo="${repo}" remote add --if-not-exists orion-beta "${_repo_url}"
  printf '%s' "${_gpg_key}" | base64 --decode | \
    ostree --repo="${repo}" remote gpg-import --stdin orion-beta
  ostree --repo="${repo}" pull orion-beta app/com.kagi.Orion/x86_64/beta
  ostree --repo="${repo}" checkout --user-mode --union \
    orion-beta:app/com.kagi.Orion/x86_64/beta orion-flatpak
}

check() {
  local appdir="${srcdir}/orion-flatpak/files"
  local libdir="${srcdir}/orion-native-libs"

  mkdir -p "${libdir}"
  local lib
  for lib in liborion_common.so liborion_core.so liborion_net.so liborion_sync.so; do
    ln -sf "${appdir}/lib64/${lib}" "${libdir}/${lib}"
  done

  LD_LIBRARY_PATH="${libdir}" ldd -r "${appdir}/bin/oriongtk" > orion-ldd.log
  if grep -Eq 'not found|undefined symbol' orion-ldd.log; then
    cat orion-ldd.log
    return 1
  fi
  if ! grep -q 'libwebkitgtk-6.0.so.4 => /usr/lib/' orion-ldd.log || ! grep -q 'libjavascriptcoregtk-6.0.so.1 => /usr/lib/' orion-ldd.log; then
    cat orion-ldd.log
    error "Orion did not resolve against Arch's native WebKitGTK libraries"
    return 1
  fi
}

package() {
  local appdir="${srcdir}/orion-flatpak/files"
  local lib
  local size

  install -Dm755 "${appdir}/bin/oriongtk" "${pkgdir}/usr/bin/orion-beta"
  for lib in liborion_common.so liborion_core.so liborion_net.so liborion_sync.so; do
    install -Dm755 "${appdir}/lib64/${lib}" "${pkgdir}/usr/lib/orion-beta/${lib}"
  done
  patchelf --set-rpath '$ORIGIN/../lib/orion-beta' "${pkgdir}/usr/bin/orion-beta"
  for lib in liborion_common.so liborion_core.so liborion_net.so liborion_sync.so; do
    patchelf --set-rpath '$ORIGIN' "${pkgdir}/usr/lib/orion-beta/${lib}"
  done
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${appdir}/share/applications/com.kagi.Orion.desktop" "${pkgdir}/usr/share/applications/com.kagi.Orion.desktop"
  sed -i 's/^Exec=.*/Exec=orion-beta/' "${pkgdir}/usr/share/applications/com.kagi.Orion.desktop"

  install -Dm644 "${appdir}/share/metainfo/com.kagi.Orion.metainfo.xml" "${pkgdir}/usr/share/metainfo/com.kagi.Orion.metainfo.xml"
  sed -i \
    -e 's#<project_license>Commercial - Third party EULA</project_license>#<project_license>LicenseRef-proprietary</project_license>#' \
    -e '/^        <ul>$/d' \
    -e '/^        <\/ul>$/d' \
    "${pkgdir}/usr/share/metainfo/com.kagi.Orion.metainfo.xml"

  for size in 16 32 64 128 256; do
    install -Dm644 "${appdir}/share/icons/hicolor/${size}x${size}/apps/com.kagi.Orion.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/com.kagi.Orion.png"
  done
}
