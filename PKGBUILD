# Maintainer: Tim Kicker <tim@kicker.dev>
pkgname=podliner-bin
pkgver=2.4.0
pkgrel=1
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

# Checksums v1.0.20
sha256sums_x86_64=("bfbaabb90d1f4bde99159c69838a2138e3de602373052d6999ab712019ded0c7")
sha256sums_aarch64=("4ea32a5c49fb95fe44dff74254b7a8274c1c7efe495ae92f858b6bd9646b2900")

package() {
  install -d "${pkgdir}/usr/bin"
  mkdir -p "${srcdir}/podliner-build"

  local tarball
  if [[ "$CARCH" == "x86_64" ]]; then
    tarball="${srcdir}/podliner-${pkgver}-linux-x64.tar.gz"
  else
    tarball="${srcdir}/podliner-${pkgver}-linux-arm64.tar.gz"
  fi

  bsdtar -xf "$tarball" -C "${srcdir}/podliner-build"

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

