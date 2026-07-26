pkgname=orion-beta
pkgver=0.3.0
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
  'pango'
  'vulkan-icd-loader'
  'webkitgtk-6.0'
  'xz'
)
makedepends=('ostree' 'patchelf')
provides=("orion-browser=${pkgver}")
options=('!debug')
source=(
  "oriongtk.${pkgver}.flatpak::https://orionbrowser.com/download/oriongtk.${pkgver}.flatpak"
  'LICENSE'
)
noextract=("oriongtk.${pkgver}.flatpak")
sha256sums=(
  'd0d3963d2d98bf93699d3c6ab2232fb211c5c93c83a2d3e2f7ae3fda883f6c2c'
  '18fd7c419da08efe8ef55acb05f411704ee6b4622879a98209416eb4b9f49e40'
)

_commit='e75518d4754e0b72d3e99906cb00b8eb8d2d8d7177e587c1c19250bc421beb5c'

prepare() {
  ostree --repo=orion-repo init --mode=bare-user-only
  ostree --repo=orion-repo static-delta apply-offline "oriongtk.${pkgver}.flatpak"
  ostree --repo=orion-repo checkout --user-mode --union "${_commit}" orion-flatpak
}

check() {
  local appdir="${srcdir}/orion-flatpak/files"
  local libdir="${srcdir}/orion-native-libs"

  mkdir -p "${libdir}"
  ln -sf "${appdir}/lib64/liborion_common.so" "${libdir}/liborion_common.so"
  ln -sf "${appdir}/lib64/liborion_core.so" "${libdir}/liborion_core.so"
  ln -sf "${appdir}/lib64/liborion_sync.so" "${libdir}/liborion_sync.so"

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
  for lib in liborion_common.so liborion_core.so liborion_sync.so; do
    install -Dm755 "${appdir}/lib64/${lib}" "${pkgdir}/usr/lib/orion-beta/${lib}"
  done
  patchelf --set-rpath '$ORIGIN/../lib/orion-beta' "${pkgdir}/usr/bin/orion-beta"
  for lib in liborion_common.so liborion_core.so liborion_sync.so; do
    patchelf --set-rpath '$ORIGIN' "${pkgdir}/usr/lib/orion-beta/${lib}"
  done
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${appdir}/share/applications/com.kagi.OrionGtk.desktop" "${pkgdir}/usr/share/applications/com.kagi.OrionGtk.desktop"
  sed -i 's/^Exec=.*/Exec=orion-beta/' "${pkgdir}/usr/share/applications/com.kagi.OrionGtk.desktop"

  install -Dm644 "${appdir}/share/metainfo/com.kagi.OrionGtk.metainfo.xml" "${pkgdir}/usr/share/metainfo/com.kagi.OrionGtk.metainfo.xml"
  sed -i -e 's#<project_license>Commercial - Third party EULA</project_license>#<project_license>LicenseRef-proprietary</project_license>#' -e '0,/<screenshot>/{s/<screenshot>/<screenshot type="default">/}' "${pkgdir}/usr/share/metainfo/com.kagi.OrionGtk.metainfo.xml"

  for size in 16 32 64 128 256; do
    install -Dm644 "${appdir}/share/icons/hicolor/${size}x${size}/apps/com.kagi.OrionGtk.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/com.kagi.OrionGtk.png"
  done
}
