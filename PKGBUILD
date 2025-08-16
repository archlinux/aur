# Maintainer: harrietobrien <harrietobrien@protonmail.com>
pkgname=mantidworkbench-bin
pkgver=6.13.1
pkgrel=1
pkgdesc="MantidWorkbench (GUI) prebuilt bundle from upstream .tar.xz"
arch=('x86_64')
url="https://www.mantidproject.org/"
license=('GPL3' 'custom')
# upstream bundle is self-contained
depends=()
provides=('mantidworkbench')
options=(!strip)
source=("mantidworkbench-${pkgver}.tar.xz::https://github.com/mantidproject/mantid/releases/download/v${pkgver}/mantidworkbench-${pkgver}.tar.xz")
sha256sums=('b1cf9c0836c54a356bbcea8541fe9ba05903002c81ab6560d3566e33056e63d4')

prepare() {
  cd "$srcdir"
  rm -rf "mantidworkbench-${pkgver}"
  mkdir -p "mantidworkbench-${pkgver}"
  # extract w/o creating nested directories if tarball already has a top dir
  tar -xJf "mantidworkbench-${pkgver}.tar.xz" -C "mantidworkbench-${pkgver}" --strip-components=1 || \
  tar -xJf "mantidworkbench-${pkgver}.tar.xz" -C "mantidworkbench-${pkgver}"
}

package() {
  # /opt installation
  install -d "$pkgdir/opt/${pkgname}-${pkgver}"
  cp -a "$srcdir/mantidworkbench-${pkgver}/." "$pkgdir/opt/${pkgname}-${pkgver}/"

  # launcher
  install -d "$pkgdir/usr/bin"
  if [[ -x "$pkgdir/opt/${pkgname}-${pkgver}/bin/mantidworkbench" ]]; then
    ln -s "/opt/${pkgname}-${pkgver}/bin/mantidworkbench" "$pkgdir/usr/bin/mantidworkbench"
  else
    # fallback - try canonical binary name used historically
    if [[ -x "$pkgdir/opt/${pkgname}-${pkgver}/bin/MantidWorkbench" ]]; then
      ln -s "/opt/${pkgname}-${pkgver}/bin/MantidWorkbench" "$pkgdir/usr/bin/mantidworkbench"
    fi
  fi

  # desktop entry
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/mantidworkbench.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=MantidWorkbench
GenericName=Scientific Data Analysis
Comment=Visualise and analyse neutron and muon scattering data
Exec=mantidworkbench %F
Icon=mantidworkbench
Categories=Science;Education;DataVisualization;
StartupNotify=true
Terminal=false
EOF

  # attempt icon installation if one is bundled
  icon_src=""
  for p in \
    "$pkgdir/opt/${pkgname}-${pkgver}/share/icons/hicolor/256x256/apps/mantidworkbench.png" \
    "$pkgdir/opt/${pkgname}-${pkgver}/share/icons/hicolor/256x256/apps/mantid.png" \
    "$pkgdir/opt/${pkgname}-${pkgver}/bin/mantidworkbench.png" \
    "$pkgdir/opt/${pkgname}-${pkgver}/share/pixmaps/mantidworkbench.png"
  do
    [[ -f "$p" ]] && icon_src="$p" && break
  done
  if [[ -n "$icon_src" ]]; then
    install -Dm644 "$icon_src" "$pkgdir/usr/share/icons/hicolor/256x256/apps/mantidworkbench.png"
  fi

  # license if present
  for L in LICENSE LICENSE.txt COPYING COPYING3; do
    if [[ -f "$pkgdir/opt/${pkgname}-${pkgver}/$L" ]]; then
      install -Dm644 "$pkgdir/opt/${pkgname}-${pkgver}/$L" "$pkgdir/usr/share/licenses/${pkgname}/$L"
    fi
  done
}

