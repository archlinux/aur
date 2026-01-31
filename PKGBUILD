# Maintainer: Evert Vorster
_pkgname=openmemory-backend
pkgname=${_pkgname}-git
pkgver=1.3.0.r21.g30daf78
pkgrel=2
pkgdesc="OpenMemory backend server (HTTP API + MCP) from git"
arch=('x86_64')
url="https://github.com/CaviraOSS/OpenMemory"
license=('Apache-2.0')

depends=('nodejs')
makedepends=('git' 'npm')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

# Use the .install hook you already created
install=openmemory-backend.install

# Upstream is a monorepo; the backend implementation lives here
_backend_subdir="packages/openmemory-js"

source=(
  "OpenMemory::git+${url}.git"
  "openmemory-backend"          # our fixed wrapper
  "openmemory-backend.service"
  "openmemory-backend.install"
)

# For AUR convenience while iterating; you can later replace SKIP with fixed sums.
sha256sums=('SKIP'
            '19bf453eb01f50e9c2be6dc632202daa9385a669ea8051c3310423b1f71eba88'
            '9992d4a471fcbfcadac82f13a59885b286967e13cbb8f71dfe26cc5495a6f14c'
            'af2acf2ba5ce8f441704e5879e2d42d58a03b5dfc97d8e17f47f9e4cea5fece9')

pkgver() {
  cd "${srcdir}/OpenMemory"
  git describe --long --tags --always 2>/dev/null \
    | sed 's/^v//; s/-/.r/; s/-/./' \
    || printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/OpenMemory/${_backend_subdir}"

  # Upstream lockfile may not be CI-clean on git HEAD; npm ci can fail.
  npm install

  # If upstream defines a build step, run it.
  if npm run | grep -qE '^\s+build\b'; then
    npm run build
  fi

  # Keep only production deps in the packaged payload.
  npm prune --omit=dev
}

package() {
  cd "${srcdir}/OpenMemory"

  # Install backend runtime payload
  install -d "${pkgdir}/usr/lib/openmemory-backend"
  cp -a "${_backend_subdir}" "${pkgdir}/usr/lib/openmemory-backend/"

  # Arch is glibc; remove musl prebuilds if present
  rm -rf \
    "${pkgdir}/usr/lib/openmemory-backend/openmemory-js/node_modules/@napi-rs/canvas-linux-x64-musl" \
    2>/dev/null || true

  # Remove empty esbuild dir noise (optional)
  rmdir --ignore-fail-on-non-empty \
    "${pkgdir}/usr/lib/openmemory-backend/openmemory-js/node_modules/@esbuild" \
    2>/dev/null || true

  # Install the corrected wrapper from the AUR repo (NOT generated inline)
  install -Dm755 "${srcdir}/openmemory-backend" \
    "${pkgdir}/usr/bin/openmemory-backend"
  # Ship an env template under /usr/share (read-only, pacman-tracked).
  # Users can override by copying it to ~/.config/openmemory/openmemory.env.
  install -d "${pkgdir}/usr/share/openmemory"
  if [[ -f .env.example ]]; then
    install -m644 .env.example "${pkgdir}/usr/share/openmemory/openmemory.env.example"
  else
    printf "# Upstream .env.example not found in this revision.\n" \
      > "${pkgdir}/usr/share/openmemory/openmemory.env.example"
  fi

  # systemd user service (from source=(), not generated inline)
  install -Dm644 "${srcdir}/openmemory-backend.service" \
    "${pkgdir}/usr/lib/systemd/user/openmemory-backend.service"

  # License
  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
