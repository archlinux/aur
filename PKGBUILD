# Maintainer: Benjamim Gois <benjamim.gois@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pascube-git
pkgver=1.5.1.r0.ge926659
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

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  # Enter the working copy checked out by makepkg
  cd "$srcdir/${pkgname%-git}" 2>/dev/null || cd "${pkgname%-git}"

  # Try tag-based version; fallback to commitcount+short hash
  _ver="$(git describe --long --tags --abbrev=7 2>/dev/null || true)"
  if [[ -n "$_ver" ]]; then
    # 1.2.3-45-g<hash> -> 1.2.3.r45.g<hash>
    printf '%s' "$_ver" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.r%s.g%s' \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "${pkgname%-git}"
  # Use an isolated Lazarus config dir for reproducible builds
  mkdir -p build
}

build() {
  set -e
  cd "${pkgname%-git}"

  # Build using LCL Qt6 with explicit Lazarus dir on Arch
  lazbuild \
    --lazarusdir=/usr/lib/lazarus \
    --primary-config-path=build \
    --widgetset=qt6 \
    "${pkgname%-git}.lpi"

  # Detect the resulting binary location
  BIN_CANDIDATE=""
  for p in \
    "./${pkgname%-git}" \
    "./bin/${pkgname%-git}" \
    ./lib/*/"${pkgname%-git}" \
    ./lib/"${pkgname%-git}"; do
    [[ -x "$p" ]] && { BIN_CANDIDATE="$p"; break; }
  done
  [[ -n "${BIN_CANDIDATE}" ]] || BIN_CANDIDATE="$(find . -maxdepth 3 -type f -name "${pkgname%-git}" -perm -111 | head -n1 || true)"
  [[ -n "${BIN_CANDIDATE}" ]] || { echo "Error: could not find built binary '${pkgname%-git}'"; exit 1; }

  printf '%s' "${BIN_CANDIDATE}" > .built_binary_path
}

package() {
  set -e
  cd "${pkgname%-git}"

  # Read binary path detected during build()
  BIN_PATH="$(< .built_binary_path)"
  [[ -x "${BIN_PATH}" ]] || { echo "Error: built binary not executable: ${BIN_PATH}"; exit 1; }

  # Install the real binary under /usr/lib/pascube
  install -Dm755 "${BIN_PATH}" "${pkgdir}/usr/lib/${pkgname%-git}/${pkgname%-git}"

  # Wrapper: force X11 via xcb (no provisioning into $HOME)
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" <<'EOF'
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
Categories=Graphics;
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
  install -d "${pkgdir}/usr/share/pascube"
  if [[ -f "data/skybox.png" ]]; then
    install -m644 "data/skybox.png" "${pkgdir}/usr/share/pascube/skybox.png"
  fi


}
