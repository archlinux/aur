# Maintainer: Fernando Gonzalez Urriola <fgonzalezurriola@users.noreply.github.com>
pkgname=shaula
pkgver=0.1.2
pkgrel=1
pkgdesc='Wayland screenshot tool for Niri'
arch=('x86_64' 'aarch64')
url='https://github.com/fgonzalezurriola/shaula'
license=('MIT')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glibc'
  'grim'
  'gtk4'
  'gtk4-layer-shell'
  'hicolor-icon-theme'
  'slurp'
  'wayland'
  'wl-clipboard'
)
makedepends=(
  'pkgconf'
  'zig'
)
optdepends=(
  'niri: primary supported compositor and setup integration'
  'quickshell: Noctalia Shell integration'
  'ttf-geist: recommended UI font'
  'ttf-excalifont: recommended annotation font'
)
provides=('shaula')
conflicts=('shaula-bin')
install='shaula.install'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('81246a131177e8182764d4d98ebcc425425f73d5815a4732111de8f566a86771')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  zig build -Doptimize=ReleaseSafe -Dstrip
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  zig build -Doptimize=ReleaseSafe -Dstrip --prefix "${pkgdir}/usr"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/shaula.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Shaula
Comment=Wayland screenshot tool for Niri
Exec=shaula capture area --json
Icon=shaula
Terminal=false
Categories=Graphics;Utility;
StartupNotify=false
EOF
}
