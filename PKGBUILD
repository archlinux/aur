# Maintainer: Kevin <info@borunsky.de>

pkgname=wowusky
pkgver=0.12.0
pkgrel=1
pkgdesc='Minimalist World of Warcraft addon manager for Linux'
arch=('x86_64')
url='https://github.com/borunsky/wowusky'
license=('MIT')
depends=('python' 'nodejs')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools>=77'
  'python-wheel'
  'npm'
)
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# The real checksum is computed automatically by the `Publish to AUR`
# GitHub Action (it runs `updpkgsums` against the published release
# tarball before pushing). 'SKIP' is the in-repo placeholder.
sha256sums=('bf30d97f53511ec06c011008044ed0523e44e2f763aca89c6692cb194c0905f7')

prepare() {
  cd "${pkgname}-${pkgver}/desktop"
  npm ci --prefer-offline
}

build() {
  cd "${pkgname}-${pkgver}"

  # Python bridge package
  python -m build --wheel --no-isolation

  # Electron renderer + main
  cd desktop
  npm run dist:dir
}

check() {
  cd "${pkgname}-${pkgver}"
  PYTHONPATH=. python -m pytest -q
}

package() {
  cd "${pkgname}-${pkgver}"

  # ── Python bridge ───────────────────────────────────────────────────────────
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 README.md  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # ── Electron app ────────────────────────────────────────────────────────────
  # Install the unpacked Electron dir to /usr/lib/wowusky-desktop/
  local _app_dir="${pkgdir}/usr/lib/wowusky-desktop"
  install -dm755 "${_app_dir}"
  cp -r desktop/dist/linux-unpacked/. "${_app_dir}/"

  # Wrapper script so /usr/bin/wowusky launches the Electron shell
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/wowusky" <<'EOF'
#!/bin/sh
exec /usr/lib/wowusky-desktop/wowusky-desktop "$@"
EOF

  # ── Desktop integration ─────────────────────────────────────────────────────
  install -Dm644 packaging/wowusky.desktop \
                 "${pkgdir}/usr/share/applications/wowusky.desktop"
  install -Dm644 packaging/wowusky.svg \
                 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wowusky.svg"

  for sz in 32 64 128 256 512; do
    if [ -f "packaging/wowusky-${sz}.png" ]; then
      install -Dm644 "packaging/wowusky-${sz}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/apps/wowusky.png"
    fi
  done
}
