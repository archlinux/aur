# Maintainer: Michael Serajnik <m at mser dot at>
pkgname=rkvm-git
_pkgname=rkvm
pkgver=0.2.0.r9.gbf13366
pkgrel=1
pkgdesc="Virtual KVM switch for Linux machines"
arch=("x86_64")
url="https://github.com/htrefil/${_pkgname}"
license=("MIT")
depends=("openssl")
makedepends=("git" "clang" "libevdev" "rust")
source=("git+https://github.com/htrefil/${_pkgname}.git"
        rkvm-client.service
        rkvm-server.service)
sha256sums=("SKIP"
            "b3c39452aefb93f9a620a907d6947db66b0c907cfc351f72e2cc4953a081a038"
            "031de233ee12593a3d3344d6dbacdcdff4cf68ad8067b80955bdb1bab964daef")
backup=("etc/${_pkgname}/client.toml"
        "etc/${_pkgname}/server.toml")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "target/release/client" "${pkgdir}/usr/bin/${_pkgname}-client"
  install -Dm755 "target/release/server" "${pkgdir}/usr/bin/${_pkgname}-server"
  install -Dm755 "target/release/certificate-gen" "${pkgdir}/usr/bin/${_pkgname}-certificate-gen"
  install -Dm644 "example/client.toml" "${pkgdir}/etc/${_pkgname}/client.toml"
  install -Dm644 "example/server.toml" "${pkgdir}/etc/${_pkgname}/server.toml"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${srcdir}"
  install -Dm644 "${_pkgname}-client.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}-client.service"
  install -Dm644 "${_pkgname}-server.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}-server.service"
}
