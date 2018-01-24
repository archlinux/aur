# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=kraken
pkgver=1.1
pkgrel=2
pkgdesc="Kraken taxonomic sequence classification system"
arch=('i686' 'x86_64')
url=https://github.com/DerrickWood/"${pkgname}"
license=('GPL3')
depends=('perl')
optdepends=('jellyfish<=1: for building Kraken databases')
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/DerrickWood/"${pkgname}"/archive/v"${pkgver}".tar.gz)
sha256sums=('a4ac74c54c10920f431741c80d8a172670be12c3b352912000030fb5ea4c87a7')
_installation_dir=/usr/share/"${pkgname}"-"${pkgver}"

prepare() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  sed -i "s#\$(KRAKEN_DIR)#${pkgdir}${_installation_dir}#g" src/Makefile
  make -C src clean
}

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  make -C src
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"

  mkdir -p "${pkgdir}""${_installation_dir}"

  make -C src install

  for scripts in scripts/*; do
    sed -i "s|#####=KRAKEN_DIR=#####|${_installation_dir}|g" "${scripts}"
    sed -i "s|#####=VERSION=#####|${pkgver}|g" "${scripts}"

    install -Dm775 "${scripts}" "${pkgdir}""${_installation_dir}"/
  done

  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"_v"${pkgver}"/LICENSE
  install -D -m644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"_v"${pkgver}"/README.md
  install -D -m644 CHANGELOG "${pkgdir}"/usr/share/doc/"${pkgname}"_v"${pkgver}"/CHANGELOG

  for doc in docs/*; do
    install -D -m644 "${doc}" "${pkgdir}"/usr/share/doc/"${pkgname}"_v"${pkgver}"/"${doc}"
  done

  for file in "${pkgdir}${_installation_dir}"/kraken*; do
    install -Dm775 "${file}" "${pkgdir}"/usr/bin/$( basename "${file}" )
  done
}
