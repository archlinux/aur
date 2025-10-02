# Maintainer: Benjamim Gois <benjamim.gois@gmail.com>
pkgname=pascube
pkgver=1.5.0
pkgrel=1
pkgdesc="A simple OpenGL spinning cube written in Pascal (Lazarus/Qt6)"
arch=('x86_64')
url="https://github.com/benjamimgois/pascube"
license=('GPL-2.0-or-later')

depends=(
  'qt6-base'   # Qt6 runtime
  'qt6pas'     # Lazarus Qt6 bindings (LCL Qt6)
  'mesa'       # libGL
  'glu'        # libGLU
)
makedepends=(
  'git'
  'fpc'
  'fpc-src'
  'lazarus'    # provides lazbuild on Arch
)

# This release package provides/conflicts with the VCS variant
provides=("${pkgname}")
conflicts=("${pkgname}-git")

# GitHub source tarball for tag v${pkgver}
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/benjamimgois/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('36d7275c4537ef4e8419fc261cc16aca4441a01863c2c1766653ab31dbf55438')

# Convenience var for the extracted source dir name used by GitHub archives
_srcdir="${pkgname}-${pkgver}"

prepare() {
  cd "${_srcdir}"
  # Use an isolated Lazarus config dir for reproducible builds
  mkdir -p build
}

build() {
  set -e
  cd "${_srcdir}"

  # Build using LCL Qt6 with explicit Lazarus dir on Arch
  lazbuild \
    --lazarusdir=/usr/lib/lazarus \
    --primary-config-path=build \
    --widgetset=qt6 \
    "${pkgname}.lpi"

  # Detect the resulting binary location
  BIN_CANDIDATE=""
  for p in \
    "./${pkgname}" \
    "./bin/${pkgname}" \
    ./lib/*/"${pkgname}" \
    ./lib/"${pkgname}"; do
    [[ -x "$p" ]] && { BIN_CANDIDATE="$p"; break; }
  done
  [[ -n "${BIN_CANDIDATE}" ]] || BIN_CANDIDATE="$(find . -maxdepth 3 -type f -name "${pkgname}" -perm -111 | head -n1 || true)"
  [[ -n "${BIN_CANDIDATE}" ]] || { echo "Error: could not find built binary '${pkgname}'"; exit 1; }

  printf '%s' "${BIN_CANDIDATE}" > .built_binary_path
}

package() {
  set -e
  cd "${_srcdir}"

  # Read binary path detected during build()
  BIN_PATH="$(< .built_binary_path)"
  [[ -x "${BIN_PATH}" ]] || { echo "Error: built binary not executable: ${BIN_PATH}"; exit 1; }

  # Install the real binary under /usr/lib/pascube
  install -Dm755 "${BIN_PATH}" "${pkgdir}/usr/lib/${pkgname}/${pkgname}"

  # Wrapper: force X11 via xcb (no provisioning into $HOME)
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/sh
export QT_QPA_PLATFORM=xcb
exec /usr/lib/pascube/pascube "$@"
EOF

  # ---- Desktop entry ----
  # If data/pascube.desktop exists, normalize Icon and Exec and install it
  if [[ -f "data/pascube.desktop" ]]; then
    sed -E \
      -e 's/^Icon=.*/Icon=pascube/' \
      -e 's/^Exec=.*/Exec=pascube/' \
      "data/pascube.desktop" > "${srcdir}/pascube.desktop"
    install -Dm644 "${srcdir}/pascube.desktop" \
      "${pkgdir}/usr/share/applications/pascube.desktop"
  else
    # Fallback desktop file
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
  fi

  # ---- Icons (from data/icons/{128x128,256x256,512x512}/pascube.png) ----
  for sz in 128x128 256x256 512x512; do
    if [[ -f "data/icons/${sz}/pascube.png" ]]; then
      install -Dm644 "data/icons/${sz}/pascube.png" \
        "${pkgdir}/usr/share/icons/hicolor/${sz}/apps/pascube.png"
    fi
  done

  # ---- Shared resources (skybox only under /usr/share/pascube) ----
  if [[ -f "skybox.png" ]]; then
    install -Dm644 "skybox.png" "${pkgdir}/usr/share/pascube/skybox.png"
  elif [[ -f "data/skybox.png" ]]; then
    install -Dm644 "data/skybox.png" "${pkgdir}/usr/share/pascube/skybox.png"
  fi

  # License (if present)
  [[ -f LICENSE ]] && install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
