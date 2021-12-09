# Maintainer: James Devlin <devlin.ja@northeastern.edu>

pkgname=bustd
pkgver=0.1.0
pkgrel=1
pkgdesc="Process Killer Daemon for Out-of-Memory Scenarios, written in Rust"

arch=("x86_64")
license=("MIT")
url="https://github.com/vrmiguel/bustd"
source=("${pkgname}::git+${url}" "bustd.service")
provides=("bustd")
conflicts=("bustd")
sha1sums=("SKIP" "5a6571580691a96e8cfedba8e6d951e93c033997")

depends=("gcc-libs")
makedepends=("cargo" "git")
conflicts=("oomd")

build() {
  cd "${srcdir}/${pkgname}"
  cargo build --release --all-features
}

package() {
  cd "${srcdir}/${pkgname}"

  # Binary Executable
  install -Dm755 "target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"

  # Package License
  install -Dm644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Documentation (README)
  install -Dm644 "README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Systemd Service
  install -Dm644 bustd.service \
    "${pkgdir}/etc/systemd/system/bustd.service"
  echo "To load bustd with systemd, run 'sudo systemctl enable --now bustd'."
}
