# Maintainer: Joel Jax <joeljax@web.de>

pkgname=vstbridge # For git paths
pkgver=0.0.4
pkgrel=1
pkgdesc="Windows VST2/VST3/CLAP plugins in Linux DAWs via Wine. A fork of yabridge by Robert Van Der Helm."
arch=('x86_64')
url="https://github.com/rations/vstbridge"
license=('GPL-3.0-only')
depends=(
  'wine'
  'gtk3'
  'glibc>=2.34'
  'libxcb'
  'gcc-libs'
)
optdepends=(
  'wine-staging: recommended Wine implementation'
  'winetricks: install DXVK and other Wine components'
)
provides=()
conflicts=()
options=('!strip' '!debug') # Upstream binaries (Wine PE hosts) must not be stripped

source=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-x86_64.tar.gz")
sha256sums=('1b851e55098fc176f21c82f78c4842a67746b177265e9fed8e9062b3d54f6c5e') # Adjust with each version bump (copy from git releases page)

prepare() {
  :
}



package() {
  cd "${srcdir}/${pkgname}"

  # Place plugin libraries and wine hosts in /usr/lib
  install -d "${pkgdir}/usr/lib"
  for f in libvstbridge-*.so vstbridge-host*.exe vstbridge-host*.so; do
    [[ -e "$f" ]] && install -m755 "$f" "${pkgdir}/usr/lib/$f"
  done

  # Place management tools (CLI + GTK GUI) in /usr/bin
  install -d "${pkgdir}/usr/bin"
  for b in vstbridgectl vstbridgectl-gtk; do
    [[ -e "$b" ]] && install -m755 "$b" "${pkgdir}/usr/bin/$b"
  done

  # Desktop entry for the GUI
  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/vstbridgectl.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=vstbridgectl
Comment=Manage vstbridge Windows plugin bridges
Exec=vstbridgectl-gtk
Icon=audio-x-generic
Terminal=false
Categories=AudioVideo;Audio;Settings;
EOF

  # Docs and license
  for d in README.md readme-fixes.md; do
    [[ -e "$d" ]] && install -Dm644 "$d" "${pkgdir}/usr/share/doc/${pkgname}/$d"
  done
  [[ -e LICENSE ]] && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
