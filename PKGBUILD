# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=kraken
pkgver=0.10.5
pkgrel=1
pkgdesc="Kraken taxonomic sequence classification system"
arch=('i686' 'x86_64')
url=https://github.com/DerrickWood/"${pkgname}"
license=('GPL3')
depends=('coreutils' 'perl')
provides=('kraken')
conflicts=('kraken')
source=(https://github.com/DerrickWood/"${pkgname}"/archive/v"${pkgver}"-beta.tar.gz)
md5sums=('0231a7bfc067f564ad28fa91e9f71606')

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"-beta

  installation_dir="${pkgdir}"/usr/share/"${pkgname}"-"${pkgver}"-beta

  mkdir -p "${installation_dir}"
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/share/licenses
  mkdir -p "${pkgdir}"/usr/share/doc

  sed -i "s#\$(KRAKEN_DIR)#${installation_dir}#g" src/Makefile
  make -C src install

  for file in scripts/*; do
    sed -i "s|#####=KRAKEN_DIR=#####|${installation_dir}|g" "${file}"
    sed -i "s|#####=VERSION=#####|${pkgver}|g" "${file}"

    cp "${file}" "${installation_dir}"
  done

  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"_v"${pkgver}"/LICENSE
  install -D -m644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"_v"${pkgver}"/README.md
  install -D -m644 CHANGELOG "${pkgdir}"/usr/share/doc/"${pkgname}"_v"${pkgver}"/CHANGELOG

  for doc in docs/*; do
    install -D -m644 "${doc}" "${pkgdir}"/usr/share/doc/"${pkgname}"_v"${pkgver}"/"${doc}"
  done

  # Soft link primary scripts to /usr/bin.
  for file in "${installation_dir}"/kraken*; do
    cp "${file}" "${pkgdir}"/usr/bin/$(basename "${file}")
  done
}
