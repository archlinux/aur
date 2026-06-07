# Maintainer: Merlin Glander <merlin@merlin-glander.de>

pkgname=pidscope-bin
_pkgname=PIDscope
pkgver=26.05.0
pkgrel=2
pkgdesc='GNU Octave graphical blackbox flight log analyzer for FPV drone PID tuning'
arch=('x86_64')
url='https://github.com/dzikus/PIDscope'
license=('GPL-3.0-or-later')
makedepends=(
  'squashfs-tools'
)
depends=(
  'hicolor-icon-theme'
  'ncurses'
  'readline'
)
provides=("pidscope=${pkgver}")
conflicts=(
  'pidscope'
  'pidscope-git'
)
options=('!strip')

source_x86_64=(
  "${pkgname}-${pkgver}.AppImage::https://github.com/dzikus/PIDscope/releases/download/v${pkgver}/PIDscope-${pkgver}-x86_64.AppImage"
)

sha256sums_x86_64=('2e4df9bf654e2bf6063b454157c1e5de97c39e96065749ec47fa9e4dc5263ef4')

prepare() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"

  cd "${srcdir}"
  rm -rf squashfs-root

  local offset

  while IFS=: read -r offset _; do
    if unsquashfs -s -o "${offset}" "./${pkgname}-${pkgver}.AppImage" >/dev/null 2>&1; then
      unsquashfs -q -no-progress -f -d squashfs-root -o "${offset}" \
        "./${pkgname}-${pkgver}.AppImage"
      return 0
    fi
  done < <(LC_ALL=C grep -abo $'\x68\x73\x71\x73' "./${pkgname}-${pkgver}.AppImage")

  echo "Failed to locate/extract embedded SquashFS image" >&2
  return 1
}

package() {
  install -dm755 "${pkgdir}/opt/pidscope"
  cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/pidscope/"

  # Do not let bundled terminal libraries break host /bin/sh when Octave runs
  # blackbox_decode via system()/popen().
  find "${pkgdir}/opt/pidscope" \
    \( -type f -o -type l \) \
    \( \
      -name 'libreadline.so*' -o \
      -name 'libhistory.so*' -o \
      -name 'libncurses.so*' -o \
      -name 'libncursesw.so*' -o \
      -name 'libtinfo.so*' \
    \) \
    -delete

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/pidscope" <<'EOF'
#!/bin/sh

unset QT_PLUGIN_PATH
unset QML2_IMPORT_PATH
unset QML_IMPORT_PATH
unset QT_QPA_PLATFORM_PLUGIN_PATH
unset QT_STYLE_OVERRIDE

export QT_QPA_PLATFORMTHEME=
export APPDIR=/opt/pidscope

exec /opt/pidscope/AppRun "$@"
EOF

  # Install desktop integration if present in the AppImage.
  if [[ -d "${srcdir}/squashfs-root/usr/share/applications" ]]; then
    install -dm755 "${pkgdir}/usr/share/applications"
    cp -a "${srcdir}/squashfs-root/usr/share/applications/." \
      "${pkgdir}/usr/share/applications/"

    find "${pkgdir}/usr/share/applications" -type f -name '*.desktop' -exec \
      sed -i \
        -e 's|^Exec=.*|Exec=/usr/bin/pidscope %F|' \
        -e 's|^Icon=.*|Icon=com.pidscope.PIDscope|' \
        {} +
  else
    install -Dm644 /dev/stdin \
      "${pkgdir}/usr/share/applications/com.pidscope.PIDscope.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=PIDscope
Comment=Blackbox flight log analyzer for FPV drone PID tuning
Exec=/usr/bin/pidscope %F
Icon=com.pidscope.PIDscope
Categories=Science;Engineering;
Terminal=false
EOF
  fi

  # Install icons / AppStream / MIME metadata if present.
  for dir in icons metainfo mime; do
    if [[ -d "${srcdir}/squashfs-root/usr/share/${dir}" ]]; then
      install -dm755 "${pkgdir}/usr/share/${dir}"
      cp -a "${srcdir}/squashfs-root/usr/share/${dir}/." \
        "${pkgdir}/usr/share/${dir}/"
    fi
  done

  # Fallback icon locations sometimes used by AppImages.
  for icon in \
    "${srcdir}/squashfs-root/com.pidscope.PIDscope.png" \
    "${srcdir}/squashfs-root/pidscope.png" \
    "${srcdir}/squashfs-root/.DirIcon"
  do
    if [[ -f "${icon}" ]]; then
      install -Dm644 "${icon}" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.pidscope.PIDscope.png"
      break
    fi
  done
}
