# Maintainer: Benjamim Gois <seu-email>
_pkgname=pascube
pkgname=${_pkgname}-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="A simple OpenGL spinning cube written in Pascal (Lazarus/Qt6)"
arch=('x86_64')
url="https://github.com/benjamimgois/pascube"
license=('GPL2')
depends=(
  'qt6-base'   # runtime Qt6
  'qt6pas'     # bindings Qt6 para Lazarus
  'mesa'       # libGL
  'glu'        # libGLU usada pelo unit GLU
)
makedepends=(
  'git'
  'fpc'
  'fpc-src'
  'lazarus-qt6'  # compila usando a LCL Qt6
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  # compila com a LCL Qt6; o lazarus fica em /usr/lib/lazarus no Arch oficial
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset=qt6 "${_pkgname}.lpi"
}

package() {
  cd "${srcdir}/${_pkgname}"

  # binário (Lazarus normalmente gera na pasta do projeto)
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # ícone (o repo tem pascube.ico; instalamos também um .png se quiseres depois)
  if [[ -f "pascube.ico" ]]; then
    install -Dm644 "pascube.ico" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pascube.ico"
  fi

  # desktop entry básico
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/pascube.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=pasCube
Comment=A simple OpenGL spinning cube written in Pascal
Exec=pascube
Icon=pascube
Terminal=false
Categories=Graphics;Education;Qt;
EOF

  # licença
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
