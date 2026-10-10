# Maintainer: Stefan Gehr <stefan@gehr.xyz>
pkgname=vizard-bin
_pkgname=vizard
pkgver=2.4.0
pkgrel=1
pkgdesc="Unity-based 3D visualization companion for the Basilisk spacecraft simulation framework (prebuilt binary)"
arch=('x86_64')
url="https://github.com/AVSLab/vizard"
license=('ISC')
depends=('glibc' 'gcc-libs' 'gtk3' 'libgl' 'libx11')
optdepends=('vulkan-icd-loader: Vulkan rendering'
            'basilisk: simulation framework that produces the data Vizard displays')
provides=("$_pkgname")
conflicts=("$_pkgname")
# Unity players break if stripped
options=('!strip' '!debug')
noextract=("Vizard_Linux-$pkgver.zip")
source=("Vizard_Linux-$pkgver.zip::https://hanspeterschaub.info/bskFiles/Vizard_Linux.zip"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/AVSLab/vizard/master/LICENSE")
# Upstream's zip is unversioned and replaced in place; run `updpkgsums`
# for each release and expect hashes to go stale if upstream re-uploads.
sha256sums=('c2482c11c4ae41eea810a44a15330623ca3bc300adab6aa8536cf9676b1e1fb0'
            'd80ca16ce044732ac4ebdd36052eb45d44e32ae0d7baaec803c8feed5cfa3657')

prepare() {
  mkdir -p "$srcdir/$_pkgname"
  # Extract only the app directory, skipping __MACOSX/ resource-fork junk
  bsdtar -xf "Vizard_Linux-$pkgver.zip" -C "$srcdir/$_pkgname" 'Vizard_Linux'
  find "$srcdir/$_pkgname" -name '.DS_Store' -delete
}

package() {
  local _exe="Vizard.$CARCH"

  install -d "$pkgdir/usr/lib/$_pkgname"
  cp -a "$srcdir/$_pkgname/Vizard_Linux/." "$pkgdir/usr/lib/$_pkgname/"
  chmod -R u=rwX,go=rX "$pkgdir/usr/lib/$_pkgname"
  chmod 755 "$pkgdir/usr/lib/$_pkgname/$_exe"

  # Launcher. The bundled native file browser has no Wayland support,
  # so default GTK to X11 (override by exporting GDK_BACKEND yourself).
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/vizard" <<EOF
#!/bin/sh
export GDK_BACKEND="\${GDK_BACKEND:-x11}"
exec /usr/lib/$_pkgname/$_exe "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/vizard"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/vizard.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Vizard
Comment=Basilisk spacecraft simulation visualization
Exec=vizard
Icon=applications-science
Terminal=false
Categories=Science;Education;
EOF

  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
