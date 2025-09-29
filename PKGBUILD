# Maintainer: Benjamim Gois <benjamim.gois@gmail.com>
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
  'qt6pas'     # bindings Qt6 para Lazarus (LCL Qt6)
  'mesa'       # libGL
  'glu'        # libGLU
)
makedepends=(
  'git'
  'fpc'
  'fpc-src'
  'lazarus-qt6'
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
  # Compila usando LCL Qt6
  lazbuild --widgetset=qt6 "${_pkgname}.lpi"
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Instala binário real em /usr/lib/pascube
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"

  # Wrapper: força X11 e garante skybox do usuário
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'EOF'
#!/bin/sh
# Force X11 backend for Qt6
export QT_QPA_PLATFORM=xcb

# Ensure user config dir and a default skybox
CFGDIR="$HOME/.config/pascube"
SYSRES="/usr/share/pascube/skybox.png"
mkdir -p "$CFGDIR"
if [ -f "$SYSRES" ] && [ ! -f "$CFGDIR/skybox.png" ]; then
  cp "$SYSRES" "$CFGDIR/skybox.png"
fi

exec /usr/lib/pascube/pascube "$@"
EOF

  # Desktop entry (usa o wrapper)
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

  # Recursos: instala skybox padrão para todos os usuários
  if [[ -f "skybox.png" ]]; then
    install -Dm644 "skybox.png" "${pkgdir}/usr/share/pascube/skybox.png"
  fi

  # Ícones (instala o que existir no repo)
  if [[ -f "pascube.png" ]]; then
    install -Dm644 "pascube.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pascube.png"
  elif [[ -f "pascube.svg" ]]; then
    install -Dm644 "pascube.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pascube.svg"
  elif [[ -f "pascube.ico" ]]; then
    install -Dm644 "pascube.ico" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pascube.ico"
  fi

  # Licença (se existir)
  [[ -f LICENSE ]] && install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
