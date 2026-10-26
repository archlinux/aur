# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=blender-4.5-lts-bin
pkgver=4.5.15
pkgrel=1
pkgdesc="A fully integrated 3D graphics creation suite (official 4.5 LTS precompiled binary release)"
arch=('x86_64')
url="https://www.blender.org"
license=('GPL-3.0-or-later')
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
provides=('blender=4.5.15' 'blender-4.5' 'blender-lts')
conflicts=('blender')
source=(
  "https://download.blender.org/release/Blender4.5/blender-${pkgver}-linux-x64.tar.xz"
  "blender-4.5.sh"
)
sha256sums=(
  '0d2b8bb2efe97e6c8eb57de6b7322f8800e1984e3125b60decca5f6771e4773e'
  'fc8b07fcf73a77c9a1e074ec09a35c680d7adcf6a98a427556c923fe0aefb6e0'
)

package() {
  local _src="blender-${pkgver}-linux-x64"
  cd "$srcdir/$_src"

  local _opt_dir="${pkgdir}/opt/blender-4.5-lts"
  install -dm755 "$_opt_dir"

  # Copy precompiled blender tree to /opt/blender-4.5-lts
  cp -a * "$_opt_dir/"

  # Ensure bundled libraries have executable permissions
  if [ -d "$_opt_dir/lib" ]; then
    chmod -R 755 "$_opt_dir/lib"
  fi

  # Binary wrapper and symlinks
  install -Dm755 "${srcdir}/blender-4.5.sh" "${pkgdir}/usr/bin/blender-4.5"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf blender-4.5 "${pkgdir}/usr/bin/blender"
  ln -sf /opt/blender-4.5-lts/blender-thumbnailer "${pkgdir}/usr/bin/blender-4.5-thumbnailer"
  ln -sf blender-4.5-thumbnailer "${pkgdir}/usr/bin/blender-thumbnailer"

  # Desktop integration
  install -dm755 "${pkgdir}/usr/share/applications"
  sed \
    -e 's|^Exec=blender %f|Exec=blender-4.5 %f|' \
    -e 's|^Name=Blender$|Name=Blender 4.5 LTS|' \
    -e 's|^Icon=blender$|Icon=blender-4.5|' \
    blender.desktop > "${pkgdir}/usr/share/applications/blender-4.5.desktop"
  ln -sf blender-4.5.desktop "${pkgdir}/usr/share/applications/blender.desktop"

  # Icons
  install -Dm644 blender.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/blender-4.5.svg"
  ln -sf blender-4.5.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/blender.svg"
  if [ -f blender-symbolic.svg ]; then
    install -Dm644 blender-symbolic.svg "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/blender-4.5-symbolic.svg"
    ln -sf blender-4.5-symbolic.svg "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/blender-symbolic.svg"
  fi

  # Thumbnailer
  install -dm755 "${pkgdir}/usr/share/thumbnailers"
  cat << 'EOF' > "${pkgdir}/usr/share/thumbnailers/blender-4.5.thumbnailer"
[Thumbnailer Entry]
TryExec=blender-4.5-thumbnailer
Exec=blender-4.5-thumbnailer %u %o
MimeType=application/x-blender;
EOF
  ln -sf blender-4.5.thumbnailer "${pkgdir}/usr/share/thumbnailers/blender.thumbnailer"

  # Licenses & documentation
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  if [ -d license ]; then
    cp -a license/* "${pkgdir}/usr/share/licenses/${pkgname}/" 2>/dev/null || true
  fi
  if [ -f copyright.txt ]; then
    install -Dm644 copyright.txt "${pkgdir}/usr/share/licenses/${pkgname}/copyright.txt" 2>/dev/null || true
  fi
}
