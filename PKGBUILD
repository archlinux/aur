# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=porta-gui-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Open-source SSH client with an encrypted local vault and zero-trust sync (desktop GUI)"
arch=('x86_64')
url="https://gitlab.com/porta-ssh/porta"
license=('AGPL-3.0-only')
# porta-gui's ELF dependencies (Wails on GTK3 + WebKit2GTK 4.1).
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libsoup3' 'libx11' 'webkit2gtk-4.1')
provides=('porta-gui')
conflicts=('porta-gui')
# Prebuilt binary: a -debug package would have no sources to go with it.
options=('!debug')
# Upstream's release links (/-/jobs/artifacts/<tag>/raw/...?job=build) redirect
# to the latest successful build job for the tag, so a retried pipeline would
# silently serve a rebuilt binary and break the checksum. Pin the job instead
# (artifacts are kept forever, expire_in: never). On update, read the new id from:
#   curl -sI "${url}/-/jobs/artifacts/v${pkgver}/raw/gui/build/bin/porta-gui?job=build" | grep -i location
_job=17916099027
source=("${pkgname}-${pkgver}::${url}/-/jobs/${_job}/artifacts/raw/gui/build/bin/porta-gui"
        "${pkgname}-${pkgver}.png::${url}/-/raw/v${pkgver}/gui/build/appicon.png"
        'porta-gui.desktop')
sha256sums=('c31b16005e33b0bcbeda861a8deccf0ed52545b5889bb0d60ea46651354709c6'
            'd47a61ad7c5d78265ac9f4b9c858705a134239e47e1e811d2602ff2408c75d95'
            'c456f215581b1d380c669a1c2f36422c250ea0a1ac3f05f8eaf711c00ee5ef17')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/porta-gui"
  # Wails leaves the program name at the executable name, so the window's
  # Wayland app_id and X11 WM_CLASS are both "porta-gui", matching this file.
  install -Dm644 porta-gui.desktop "${pkgdir}/usr/share/applications/porta-gui.desktop"
  # Upstream ships only a 1024x1024 icon; hicolor has no 1024x1024/apps directory.
  install -Dm644 "${pkgname}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/porta.png"
}
