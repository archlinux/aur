# Maintainer: Ismet Togay <ismet.togay at gmail dot com>
# Contributor: robertfoster <morf3089 at gmail dot com>
pkgname=codenomad-bin
pkgver=0.20.1
pkgrel=1
pkgdesc='A fast, multi-instance workspace for running OpenCode sessions'
arch=('x86_64') # upstream publishes no Linux arm64 build (Electron or Tauri) since 0.16
url='https://github.com/NeuralNomadsAI/CodeNomad'
license=('MIT')
# Direct first-level deps of the shipped binaries. gdk-pixbuf2, libdrm and
# hicolor-icon-theme are kept explicit because the runtime loads pixbuf
# loaders, libgbm/libdrm and an icon theme beyond the linked sonames.
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs' # libudev.so.1 is a direct NEEDED of the CodeNomad binary
)
optdepends=(
  'opencode: OpenCode V2 CLI (>= 2.0.7) that drives the coding sessions'
  'git: repository and worktree features'
)
provides=("codenomad=$pkgver")
conflicts=('codenomad' 'codenomad-git' 'codenomad-tauri-bin')
options=('!strip' '!debug') # the shipped Electron runtime must not be stripped

_pkgname='CodeNomad'
_distname="${_pkgname}-Electron-linux-x64-${pkgver}"

source=("codenomad.desktop"
        "${pkgname}.LICENSE::${url}/raw/v${pkgver}/LICENSE"
        "${_distname}.tar.gz::${url}/releases/download/v${pkgver}/${_distname}.tar.gz")
sha256sums=('2157689d529c07fb4c88629e8dee8b028e36a77388359dce30d3ccb1dbcc54d9'
            '998529c4a806714b31c7445bd514ad3627350ae2381c8e070ec922460a9785e6'
            '40fb620c639b09da533b6c6d4b9136ad515a54918f9eb28038301a4c64794d00')

package() {
  install -dm755 "$pkgdir/opt/$pkgname"
  cp -a "$srcdir/$_distname/." "$pkgdir/opt/$pkgname/"

  # Chromium's setuid sandbox helper: what upstream's Linux packages configure
  # at install time, done here at package time.
  chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"

  # Launcher (the shipped executable is CodeNomad)
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/codenomad" <<'EOF'
#!/bin/sh
exec /opt/codenomad-bin/CodeNomad "$@"
EOF

  install -Dm644 "$srcdir/codenomad.desktop" \
    "$pkgdir/usr/share/applications/codenomad.desktop"
  install -Dm644 "$srcdir/$_distname/resources/icon.png" \
    "$pkgdir/usr/share/pixmaps/codenomad.png"

  # License files: MIT is a BSD/MIT-family license, so the instance's own text
  # ships as well; the other two come with the bundled Electron/Chromium runtime
  install -Dm644 "$srcdir/${pkgname}.LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_distname/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  install -Dm644 "$srcdir/$_distname/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
# Node.js and npm are bundled in the archive (resources/node/linux-x64), so
# namcap's "dependency nodejs detected and not included" is a false positive.
