# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=blender-3.6-lts-bin
pkgver=3.6.23
pkgrel=2
pkgdesc="A fully integrated 3D graphics creation suite (official 3.6 LTS precompiled binary release)"
arch=('x86_64')
url="https://www.blender.org"
license=('GPL-3.0-or-later')
options=('!strip' '!debug')
depends=(
  'desktop-file-utils'
  'hicolor-icon-theme'
  'libglvnd'
  'libice'
  'libsm'
  'libx11'
  'libxext'
  'libxfixes'
  'libxi'
  'libxkbcommon'
  'libxrender'
  'shared-mime-info'
)
optdepends=(
  'cuda: Cycles renderer CUDA support'
  'hip-runtime-amd: HIP renderer AMD support'
  'intel-compute-runtime: Cycles renderer Intel OneAPI support'
  'libdecor: Wayland client-side decorations support'
)
provides=('blender=3.6.23' 'blender-3.6' 'blender-lts')
conflicts=('blender')
source=(
  "https://download.blender.org/release/Blender3.6/blender-${pkgver}-linux-x64.tar.xz"
  "blender-3.6.sh"
)
sha256sums=(
  '0e9a18af4d0060b825e9617e24a775f759e0f9f67271c062f3d53a539030af00'
  '508ad0a9f1bfa205e2ac993d1e04948830bcde5c3fe0c10ad497058dfe9af575'
)

package() {
  local _src="blender-${pkgver}-linux-x64"
  cd "$srcdir/$_src"

  local _opt_dir="${pkgdir}/opt/blender-3.6-lts"
  install -dm755 "$_opt_dir"

  # Copy precompiled blender tree to /opt/blender-3.6-lts
  cp -a * "$_opt_dir/"

  # Ensure bundled libraries have executable permissions
  if [ -d "$_opt_dir/lib" ]; then
    chmod -R 755 "$_opt_dir/lib"
  fi

  # Binary wrapper and symlinks
  install -Dm755 "${srcdir}/blender-3.6.sh" "${pkgdir}/usr/bin/blender-3.6"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf blender-3.6 "${pkgdir}/usr/bin/blender"
  ln -sf /opt/blender-3.6-lts/blender-thumbnailer "${pkgdir}/usr/bin/blender-3.6-thumbnailer"
  ln -sf blender-3.6-thumbnailer "${pkgdir}/usr/bin/blender-thumbnailer"

  # Desktop integration
  install -dm755 "${pkgdir}/usr/share/applications"
  sed \
    -e 's|^Exec=blender %f|Exec=blender-3.6 %f|' \
    -e 's|^Name=Blender$|Name=Blender 3.6 LTS|' \
    -e 's|^Icon=blender$|Icon=blender-3.6|' \
    blender.desktop > "${pkgdir}/usr/share/applications/blender-3.6.desktop"
  ln -sf blender-3.6.desktop "${pkgdir}/usr/share/applications/blender.desktop"

  # Icons
  install -Dm644 blender.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/blender-3.6.svg"
  ln -sf blender-3.6.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/blender.svg"
  if [ -f blender-symbolic.svg ]; then
    install -Dm644 blender-symbolic.svg "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/blender-3.6-symbolic.svg"
    ln -sf blender-3.6-symbolic.svg "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/blender-symbolic.svg"
  fi

  # Thumbnailer
  install -dm755 "${pkgdir}/usr/share/thumbnailers"
  cat << 'EOF' > "${pkgdir}/usr/share/thumbnailers/blender-3.6.thumbnailer"
[Thumbnailer Entry]
TryExec=blender-3.6-thumbnailer
Exec=blender-3.6-thumbnailer %u %o
MimeType=application/x-blender;
EOF
  ln -sf blender-3.6.thumbnailer "${pkgdir}/usr/share/thumbnailers/blender.thumbnailer"

  # Licenses & documentation
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  if [ -d license ]; then
    cp -a license/* "${pkgdir}/usr/share/licenses/${pkgname}/" 2>/dev/null || true
  fi
  if [ -f copyright.txt ]; then
    install -Dm644 copyright.txt "${pkgdir}/usr/share/licenses/${pkgname}/copyright.txt" 2>/dev/null || true
  fi
}
