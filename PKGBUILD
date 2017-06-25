# Maintainer: Justin Harrison <me@justinharrison.ca>

pkgname=diceware-gen
pkgver=0.2.2
pkgrel=1
arch=("i686" "x86_64")
url="https://gitlab.com/jmatthin/${pkgname}"
license=("MIT")
depends=("rust")
source=("${pkgname}-${pkgver}.tar.gz::${url}/repository/archive.tar.gz?ref=${pkgver}")
sha512sums=("668ea749b3841b9a3cc265fe1ff186950b8fcb141d6e824e5fd44d662d233bedc6b4bd6d0584bda35a4d22d9b47c7251b94190dd53a33a6df513964fec120d09")

prepare() {
  # GitLab appends the archive with a sequence of characters, this is needed to remove that
  # sequence. It's pretty ugly, but I don't know of a better, simpler way.
  mkdir -p "${pkgname}-${pkgver}" && tar -xf "${pkgname}-${pkgver}.tar.gz" --directory "${pkgname}-${pkgver}" --strip-components=1
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m 755 eff_large_wordlist.txt "${pkgdir}/usr/share/diceware-gen/eff_large_wordlist.txt"
}
