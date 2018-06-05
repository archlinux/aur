# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_jellyfishver=1.1.11
pkgname=kraken
pkgver=1.1
pkgrel=4
pkgdesc="Kraken taxonomic sequence classification system"
arch=('x86_64')
url=https://github.com/DerrickWood/"${pkgname}"
license=('GPL3')
depends=('perl')
source=(
  "${pkgname}"-"${pkgver}".tar.gz::https://github.com/DerrickWood/"${pkgname}"/archive/v"${pkgver}".tar.gz
  jellyfish-"${_jellyfishver}".tar.gz::http://www.cbcb.umd.edu/software/jellyfish/jellyfish-"${_jellyfishver}".tar.gz
)
sha256sums=(
  'a4ac74c54c10920f431741c80d8a172670be12c3b352912000030fb5ea4c87a7'
  '496645d96b08ba35db1f856d857a159798c73cbc1eccb852ef1b253d1678c8e2'
)
_installation_dir=/usr/share/"${pkgname}"-"${pkgver}"

prepare() {
  pushd "${srcdir}"/"${pkgname}"-"${pkgver}"
  sed -i "s#\$(KRAKEN_DIR)#${pkgdir}${_installation_dir}#g" src/Makefile
  make -C src clean

  for script in scripts/*; do
    sed -i "s|#####=KRAKEN_DIR=#####|${_installation_dir}|g" "${script}"
    sed -i "s|#####=VERSION=#####|${pkgver}|g" "${script}"
  done

  sed -i "s#  check_for_jellyfish.sh##g" scripts/build_kraken_db.sh
  sed -i "s#    jellyfish #    jellyfish-v1 #g" scripts/build_kraken_db.sh
  popd

  pushd "${srcdir}"/jellyfish-"${_jellyfishver}"
  ./configure --prefix=/usr
  make clean
  popd
}

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  make -C src

  cd "${srcdir}"/jellyfish-"${_jellyfishver}"
  make
}

check() {
  cd "${srcdir}"/jellyfish-"${_jellyfishver}"
  # make check
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"

  mkdir -p "${pkgdir}""${_installation_dir}"

  make -C src install

  for script in scripts/*; do
    install -Dm775 "${script}" "${pkgdir}""${_installation_dir}"/
  done

  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -D -m644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
  install -D -m644 CHANGELOG "${pkgdir}"/usr/share/doc/"${pkgname}"/CHANGELOG

  for doc in docs/*; do
    install -D -m644 "${doc}" "${pkgdir}"/usr/share/doc/"${pkgname}"/"${doc}"
  done

  for file in "${pkgdir}${_installation_dir}"/kraken*; do
    install -Dm775 "${file}" "${pkgdir}"/usr/bin/$( basename "${file}" )
  done

  cd "${srcdir}"/jellyfish-"${_jellyfishver}"
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/jellyfish_v"${_jellyfishver}"/LICENSE
  install -D -m644 HalfLICENSE "${pkgdir}"/usr/share/licenses/jellyfish_v"${_jellyfishver}"/HalfLICENSE
  install -D -m644 README "${pkgdir}"/usr/share/doc/jellyfish-v"${_jellyfishver}"/README

  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/share/man
  mv "${pkgdir}"/usr/bin/jellyfish "${pkgdir}"/usr/bin/jellyfish-v1 
}
