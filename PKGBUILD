# Maintainer: Tim Kicker <tim@kicker.dev>
pkgname=podliner-bin
pkgver=1.0.14
pkgrel=1
pkgdesc="Podliner: TUI podcast player (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/timkicker/podliner"
license=('MIT')
provides=('podliner')
conflicts=('podliner')
depends=()
source_x86_64=("podliner-${pkgver}-linux-x64.tar.gz::https://github.com/timkicker/podliner/releases/download/v${pkgver}/podliner-linux-x64.tar.gz")
source_aarch64=("podliner-${pkgver}-linux-arm64.tar.gz::https://github.com/timkicker/podliner/releases/download/v${pkgver}/podliner-linux-arm64.tar.gz")
sha256sums_x86_64=('15026c2c16f3587b4b2bac39fa18a4d2562b783f3367c11ae53c94759a69e99c')
sha256sums_aarch64=('af7f72e735256794f6b23ab6bdd5995fe9d132a800db518dd6064f1ddfc31c99')

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
