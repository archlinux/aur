# Maintainer: Tim Kicker <tim@kicker.dev>
pkgname=podliner-bin
pkgver=1.0.18
pkgrel=6
pkgdesc="Podliner: TUI podcast player (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/timkicker/podliner"
license=('MIT')
options=(!strip)
provides=('podliner')
conflicts=('podliner')
depends=()
source_x86_64=("podliner-${pkgver}-linux-x64.tar.gz::https://github.com/timkicker/podliner/releases/download/v${pkgver}/podliner-linux-x64.tar.gz")
source_aarch64=("podliner-${pkgver}-linux-arm64.tar.gz::https://github.com/timkicker/podliner/releases/download/v${pkgver}/podliner-linux-arm64.tar.gz")
sha256sums_x86_64=('c6d9ccb55054164d4e012ba54857bb0242f0809102133c0294dea34d6e865050')
sha256sums_aarch64=('0cfa128fdd7512be9d9fbb1b3fb0ab4e5b360264a70e5450530e76437836972b')

package() {
  install -d "${pkgdir}/usr/bin"
  local tarball
  if [[ "$CARCH" == "x86_64" ]]; then
    tarball="${srcdir}/podliner-${pkgver}-linux-x64.tar.gz"
  else
    tarball="${srcdir}/podliner-${pkgver}-linux-arm64.tar.gz"
  fi
  mkdir -p "${srcdir}/podliner-build"
  tar -xzf "$tarball" -C "${srcdir}/podliner-build"
  install -m755 "${srcdir}/podliner-build/podliner/podliner" "${pkgdir}/usr/bin/podliner"
}



package() {
  install -d "${pkgdir}/usr/bin"
  mkdir -p "${srcdir}/podliner-build"

  local tarball
  if [[ "$CARCH" == "x86_64" ]]; then
    tarball="${srcdir}/podliner-${pkgver}-linux-x64.tar.gz"
  else
    tarball="${srcdir}/podliner-${pkgver}-linux-arm64.tar.gz"
  fi

  # entpacken (idempotent ok)
  bsdtar -xf "$tarball" -C "${srcdir}/podliner-build"

  # mögliche Layouts:
  # 1) ${srcdir}/podliner-build/podliner          (Datei)
  # 2) ${srcdir}/podliner-build/podliner/podliner (Ordner + Datei)
  # 3) sonst suche bis Tiefe 3
  local binpath=""
  if [[ -f "${srcdir}/podliner-build/podliner" ]]; then
    binpath="${srcdir}/podliner-build/podliner"
  elif [[ -f "${srcdir}/podliner-build/podliner/podliner" ]]; then
    binpath="${srcdir}/podliner-build/podliner/podliner"
  else
    binpath="$(find "${srcdir}/podliner-build" -maxdepth 3 -type f -name podliner -print -quit)"
  fi

  if [[ -z "$binpath" || ! -f "$binpath" ]]; then
    echo "podliner binary not found in archive" >&2
    echo "Archive tree (depth<=3):" >&2
    find "${srcdir}/podliner-build" -maxdepth 3 -print >&2
    return 1
  fi

  install -m755 "$binpath" "${pkgdir}/usr/bin/podliner"
}
