# Maintainer: VenRoot <0ventox0@gmail.com>
pkgname=ffmpeg-ui
pkgver=1.0.1
pkgrel=1
pkgdesc='A modern, feature-rich FFmpeg GUI wrapper built with Electron + Vite'
arch=('x86_64' 'aarch64')
url='https://github.com/VenRoot/ffmpeg-ui'
license=('GPL-3.0-only')

# Arch Linux ships versioned electron packages (electron35, electron42, …).
# Change _electronpkg if a newer version is in [extra].
_electronpkg=electron42
_electronbin=/usr/lib/${_electronpkg}/electron

depends=(
  "${_electronpkg}"
  'ffmpeg'
)
optdepends=(
  'yt-dlp: resolve YouTube and social-media video URLs'
)
makedepends=(
  'git'
  'nodejs'
  'npm'
)

source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"

  npm ci --ignore-scripts --cache "${srcdir}/npm-cache"

  # Fix up the Electron binary pointer for electron-vite in-place.
  mkdir -p node_modules/electron/dist
  ln -sf "${_electronbin}" node_modules/electron/dist/electron
  printf '%s' 'electron' > node_modules/electron/path.txt
}

build() {
  cd "${srcdir}/${pkgname}"
  npm run build
}

package() {
  cd "${srcdir}/${pkgname}"

  # ── Application files ──────────────────────────────────────────────────────
  install -d "${pkgdir}/usr/lib/${pkgname}"
  cp -r out "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 package.json "${pkgdir}/usr/lib/${pkgname}/package.json"

  # electron-vite externalizes main/preload dependencies. Install the runtime
  # module(s) next to out/ so Node can resolve them from /usr/lib/${pkgname}.
  install -d "${pkgdir}/usr/lib/${pkgname}/node_modules/@electron-toolkit"
  cp -r node_modules/@electron-toolkit/utils \
    "${pkgdir}/usr/lib/${pkgname}/node_modules/@electron-toolkit/"

  # ── Launcher script ────────────────────────────────────────────────────────
  # Wraps the system Electron binary so no bundled copy is needed.
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<SCRIPT
#!/bin/sh
exec ${_electronbin} --ozone-platform=x11 /usr/lib/${pkgname}/out/main/index.js "\$@"
SCRIPT

  # ── Desktop entry ─────────────────────────────────────────────────────────
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<'DESKTOP'
[Desktop Entry]
Name=FFmpeg UI
GenericName=Media Converter
Comment=A modern, feature-rich FFmpeg GUI wrapper
Exec=ffmpeg-ui %U
Icon=ffmpeg-ui
Type=Application
Categories=AudioVideo;Video;Multimedia;
StartupNotify=true
MimeType=video/mp4;video/x-matroska;video/webm;video/avi;video/quicktime;audio/mpeg;audio/flac;audio/ogg;audio/opus;
Keywords=ffmpeg;video;audio;convert;transcode;
DESKTOP

  # ── Icon (replace with a real PNG when you have one) ──────────────────────
  # install -Dm644 build/icon.png \
  #   "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

  # ── License ───────────────────────────────────────────────────────────────
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
