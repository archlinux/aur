# Maintainer: Mehad <mehad605@gmail.com>
pkgname=dev-type-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Master touch typing while coding"
arch=('x86_64')
url="https://github.com/mehad605/dev_type"
license=('CC-BY-NC-SA-4.0')

# Extract the AppImage so FUSE is not required at runtime.
# The AppImage bundles everything; no extra runtime deps needed beyond glibc.
depends=('glibc' 'gcc-libs')
provides=('dev-type')
conflicts=('dev-type' 'dev-type-git')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.AppImage::https://github.com/mehad605/dev_type/releases/download/v${pkgver}/dev_type-${pkgver}-x86_64.AppImage"
  "dev_type.png::https://raw.githubusercontent.com/mehad605/dev_type/v${pkgver}/assets/icon.png"
)
sha256sums=('16b58de8fa1d5238127824ff0ace264be5b646f68476a06dd844373f5b829cec'
            'a326e6355f522857545036ac88825042ba1f22e750c2638029856fc7347b3188')

prepare() {
  # Make the AppImage executable so it can be extracted
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"

  # Extract the AppImage contents into a squashfs-root directory.
  # --appimage-extract avoids needing FUSE and unpacks the SquashFS payload.
  cd "${srcdir}"
  "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
  local _squash="${srcdir}/squashfs-root"

  # --- Main executable ---
  # The onedir layout places the real binary at usr/bin/dev_type with all
  # bundled .so files in usr/bin/_internal/ alongside it.
  install -d "${pkgdir}/usr/lib/dev_type"
  cp -a "${_squash}/usr/bin/." "${pkgdir}/usr/lib/dev_type/"

  # Make the main binary executable
  chmod 755 "${pkgdir}/usr/lib/dev_type/dev_type"

  # Create a launcher wrapper in /usr/bin
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/dev_type" << 'EOF'
#!/bin/sh
exec /usr/lib/dev_type/dev_type "$@"
EOF

  # --- Icon ---
  install -Dm644 "${srcdir}/dev_type.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/dev_type.png"

  # --- Desktop entry (inlined — avoids fetching from a URL that may not exist) ---
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
}
