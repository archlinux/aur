pkgname=mux
pkgver=0.23.1
pkgrel=1
pkgdesc="Desktop app for isolated, parallel agentic development"
arch=('x86_64')
url='https://github.com/coder/mux'
license=('AGPL-3.0-only')
depends=('electron' 'bash' 'git')
makedepends=('bun' 'nodejs' 'npm' 'python' 'make')
source=("mux-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fe0aa3aff6506500d2ad0b56793195af20353b732f635ada146f5b0784f6241f')
options=('!strip' '!debug')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export HOME="${srcdir}/home"
  mkdir -p "${HOME}"

  bun install --frozen-lockfile --no-progress

  if [[ -x ./scripts/postinstall.sh ]]; then
    ./scripts/postinstall.sh
  fi

  make SHELL=/bin/bash build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -a dist "${pkgdir}/usr/lib/${pkgname}/"
  cp -a node_modules "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 package.json "${pkgdir}/usr/lib/${pkgname}/package.json"

  # Remove build byproducts that leak absolute build paths ($srcdir).
  local nm_dir="${pkgdir}/usr/lib/${pkgname}/node_modules"
  find "${nm_dir}" -type d -name '__pycache__' -prune -exec rm -rf {} +
  find "${nm_dir}" -type d -path '*/build/Release/.deps' -prune -exec rm -rf {} +
  find "${nm_dir}" -type d -path '*/build/Release/obj.target' -prune -exec rm -rf {} +
  find "${nm_dir}" -type f \( \
    -name '*.pyc' -o \
    -name '*.pyo' -o \
    -name '*.o' -o \
    -name '*.d' -o \
    -name '*.mk' -o \
    -name 'Makefile' -o \
    -name 'config.gypi' \
  \) -delete

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mux" <<'EOF'
#!/bin/sh
export ELECTRON_RUN_AS_NODE=1
export MUX_E2E_LOAD_DIST=1
exec electron /usr/lib/mux/dist/cli/index.js "$@"
EOF

  if [[ -f public/icon.png ]]; then
    install -Dm644 public/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/mux.png"
  fi

  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/mux.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Mux
GenericName=Agent Multiplexer
Comment=Agent Multiplexer
Exec=mux %U
Icon=mux
Terminal=false
Categories=Development;
StartupWMClass=mux
EOF
}
