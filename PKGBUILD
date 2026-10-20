# Maintainer: Soot
# Packaged by Scuffed QA. Installs the prebuilt release tarball as is (no compile).

pkgname=scuffed-stat-tracker-bin
_tag=stat-tracker-v0.5.0-rc.3
pkgver=0.5.0rc3
pkgrel=1
pkgdesc="Overwatch personal stats tracker for Scuffed Crew (capture daemon and desktop app)"
arch=('x86_64')
url="https://github.com/FrozenTear/scuffed-crew"
license=('MIT' 'Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++' 'zlib' 'bash' 'openssl' 'mesa' 'wayland' 'gtk3' 'glib2' 'gdk-pixbuf2'
         'libx11' 'libxtst' 'libxinerama' 'libxkbcommon' 'xdg-desktop-portal')
optdepends=(
  'wl-clipboard: Copy buttons on Wayland'
  'xclip: Copy buttons on X11'
  'libayatana-appindicator: tray icon'
  'xdg-desktop-portal-kde: screen capture on KDE Wayland'
  'xdg-desktop-portal-gnome: screen capture on niri and GNOME'
)
provides=('scuffed-stat-tracker')
conflicts=('scuffed-stat-tracker')
options=('!strip' '!debug')
install=scuffed-stat-tracker.install
source=("scuffed-stat-tracker-seed-tessdata"
        "LICENSE-MIT::https://raw.githubusercontent.com/FrozenTear/scuffed-crew/${_tag}/LICENSE-MIT"
        "LICENSE-APACHE::https://raw.githubusercontent.com/FrozenTear/scuffed-crew/${_tag}/LICENSE-APACHE")
source_x86_64=("scuffed-stat-tracker-${pkgver}.tar.gz::${url}/releases/download/${_tag}/scuffed-stat-tracker-linux-${CARCH}.tar.gz")
sha256sums=('976824c0c583ba2066d72eb1d5215961e7066cfc61dd7e09b700a6b446c49c15'
            'f06096d72781572a2e19344e81d3a235f99b495480d2f2f8b3be703bb286dfef'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('5287304e5ed7e873fd622ea9045a558ac716a7eef5a381d104c6fb512254c8d9')

package() {
  cd "${srcdir}/scuffed-stat-tracker-linux-${CARCH}"

  # Binaries. Their RUNPATH is $ORIGIN/../lib/scuffed-stat-tracker/{ocr,gui},
  # so the bundled libs must sit at /usr/lib/scuffed-stat-tracker.
  install -Dm755 bin/scuffed-stat-tracker "${pkgdir}/usr/bin/scuffed-stat-tracker"
  install -Dm755 bin/stat-tracker-gui     "${pkgdir}/usr/bin/stat-tracker-gui"

  # Bundled Tesseract and its libs (ocr/), plus libxdo for the app (gui/).
  local f
  for f in lib/scuffed-stat-tracker/ocr/* lib/scuffed-stat-tracker/gui/*; do
    install -Dm755 "$f" "${pkgdir}/usr/${f}"
  done

  # Helpers the units and the app read.
  install -Dm755 import-session-env.sh "${pkgdir}/usr/lib/scuffed-stat-tracker/import-session-env.sh"
  install -Dm644 install-paths.sh      "${pkgdir}/usr/lib/scuffed-stat-tracker/install-paths.sh"
  install -Dm755 "${srcdir}/scuffed-stat-tracker-seed-tessdata" \
    "${pkgdir}/usr/lib/scuffed-stat-tracker/seed-tessdata"

  # OCR models. The tracker only uses koverwatch from
  # ~/.local/share/scuffed-stat-tracker/tessdata, so the service copies
  # them there on start (seed-tessdata) when they are missing or old.
  install -Dm644 tessdata/eng.traineddata        "${pkgdir}/usr/share/scuffed-stat-tracker/tessdata/eng.traineddata"
  install -Dm644 tessdata/koverwatch.traineddata "${pkgdir}/usr/share/scuffed-stat-tracker/tessdata/koverwatch.traineddata"

  # systemd user units with absolute /usr paths. Not enabled by the package.
  sed -e 's|^ExecStart=.*|ExecStart=/usr/bin/scuffed-stat-tracker|' \
      -e '/^\[Service\]/a ExecStartPre=+/usr/lib/scuffed-stat-tracker/seed-tessdata' \
      assets/scuffed-stat-tracker.service > scuffed-stat-tracker.service
  sed -e 's|^ExecStart=.*|ExecStart=/usr/lib/scuffed-stat-tracker/import-session-env.sh|' \
      assets/scuffed-stat-tracker-session.service > scuffed-stat-tracker-session.service
  install -Dm644 scuffed-stat-tracker.service         "${pkgdir}/usr/lib/systemd/user/scuffed-stat-tracker.service"
  install -Dm644 scuffed-stat-tracker-session.service "${pkgdir}/usr/lib/systemd/user/scuffed-stat-tracker-session.service"

  # Menu entry with absolute paths.
  sed -e 's|^Exec=.*|Exec=/usr/bin/stat-tracker-gui|' \
      -e 's|^TryExec=.*|TryExec=/usr/bin/stat-tracker-gui|' \
      assets/scuffed-stat-tracker.desktop > scuffed-stat-tracker.desktop
  install -Dm644 scuffed-stat-tracker.desktop "${pkgdir}/usr/share/applications/scuffed-stat-tracker.desktop"

  install -Dm644 VERSION "${pkgdir}/usr/share/scuffed-stat-tracker/VERSION"
  install -Dm644 "${srcdir}/LICENSE-MIT" "${srcdir}/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
