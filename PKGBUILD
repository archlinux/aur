# Maintainer: Mehad <mehad605@example.com>
pkgname=dev-type
pkgver=1.0.1
pkgrel=1
pkgdesc="Master touch typing while coding"
arch=('x86_64')
url="https://github.com/mehad605/dev_type"
license=('CC-BY-NC-SA-4.0')

depends=('glibc' 'gcc-libs')
# uv is in Arch's extra repo; only needed at build time, not runtime.
# python-pyinstaller is needed to bundle the app.
# execstack is needed to clear the executable-stack flag from bundled .so files.
makedepends=('uv' 'python' 'execstack')
provides=('dev-type')
conflicts=('dev-type-bin' 'dev-type-git')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/mehad605/dev_type/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('328d83da498280febae8de6c6cbb8230e1f27c37874477f276736075ea312d8b')

build() {
  cd "dev_type-${pkgver}"

  # Install all Python dependencies (into an isolated .venv managed by uv)
  uv sync

  # Run PyInstaller in onedir mode so that bundled .so files are real files
  # on disk (not embedded in a single blob) — required for execstack patching.
  uv run pyinstaller \
    --name=dev_type \
    --onedir \
    --icon=assets/icon.png \
    --add-data="assets/icon.svg:assets" \
    --add-data="assets/icon.png:assets" \
    --add-data="assets/sounds:assets/sounds" \
    --add-data="assets/icon-theme.zip:assets" \
    --hidden-import=PySide6.QtSvg \
    --hidden-import=PySide6.QtSvgWidgets \
    --hidden-import=PySide6.QtMultimedia \
    --hidden-import=app.portable_data \
    --hidden-import=app.ghost_manager \
    --hidden-import=app.stats_db \
    --hidden-import=app.settings \
    --hidden-import=app.themes \
    --hidden-import=app.typing_engine \
    --hidden-import=app.typing_area \
    --hidden-import=app.sound_manager \
    --hidden-import=app.sound_profile_editor \
    --hidden-import=app.sound_volume_widget \
    --hidden-import=app.icon_manager \
    --hidden-import=app.language_cache \
    --hidden-import=app.file_scanner \
    --hidden-import=app.file_tree \
    --hidden-import=app.editor_tab \
    --hidden-import=app.history_tab \
    --hidden-import=app.languages_tab \
    --hidden-import=app.session_result_dialog \
    --hidden-import=app.ghost_replay_widget \
    --hidden-import=app.stats_display \
    --hidden-import=app.progress_bar_widget \
    --hidden-import=app.instant_splash \
    --hidden-import=_tkinter \
    --hidden-import=tkinter \
    --hidden-import=tkinter.font \
    --hidden-import=tkinter.ttk \
    --noupx \
    --clean \
    main.py

  # Clear the executable-stack flag from all bundled ELF files.
  # libpython and several Qt .so files are compiled with this flag set, which
  # modern kernels refuse to load. execstack -c clears it safely.
  find dist/dev_type -type f -exec execstack -c {} \; 2>/dev/null || true
}

package() {
  cd "dev_type-${pkgver}"

  # Install the onedir bundle into /usr/lib/dev_type/
  # (binary + _internal/ with all bundled .so files)
  install -d "${pkgdir}/usr/lib/dev_type"
  cp -a dist/dev_type/. "${pkgdir}/usr/lib/dev_type/"
  chmod 755 "${pkgdir}/usr/lib/dev_type/dev_type"

  # Launcher wrapper in /usr/bin
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/dev_type" << 'EOF'
#!/bin/sh
exec /usr/lib/dev_type/dev_type "$@"
EOF

  # Icon
  install -Dm644 assets/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/dev_type.png"

  # Desktop entry (inlined — packaging/ files may not exist in older tags)
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/dev_type.desktop" << 'EOF'
[Desktop Entry]
Name=Dev Type
Exec=dev_type
Icon=dev_type
Type=Application
Categories=Education;
Comment=Master touch typing while coding
Terminal=false
EOF

  # License
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
