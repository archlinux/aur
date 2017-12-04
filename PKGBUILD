# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=kraken
pkgver=1.0
pkgrel=1
pkgdesc="Kraken taxonomic sequence classification system"
arch=('i686' 'x86_64')
url=https://github.com/DerrickWood/"${pkgname}"
license=('GPL3')
depends=('coreutils' 'perl' 'jellyfish')
provides=('kraken')
conflicts=('kraken')
source=(https://github.com/DerrickWood/"${pkgname}"/archive/v"${pkgver}".tar.gz)
md5sums=('e790d6b09662bbd810aa34517ef66586')

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"

  installation_dir=/usr/share/"${pkgname}"-"${pkgver}"

  mkdir -p "${pkgdir}""${installation_dir}"
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/share/licenses
  mkdir -p "${pkgdir}"/usr/share/doc

  sed -i "s#\$(KRAKEN_DIR)#${pkgdir}${installation_dir}#g" src/Makefile
  make -C src install

  for file in scripts/*; do
    sed -i "s|#####=KRAKEN_DIR=#####|${installation_dir}|g" "${file}"
    sed -i "s|#####=VERSION=#####|${pkgver}|g" "${file}"

    install -Dm775 "${file}" "${pkgdir}""${installation_dir}"/
  done

  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"_v"${pkgver}"/LICENSE
  install -D -m644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"_v"${pkgver}"/README.md
  install -D -m644 CHANGELOG "${pkgdir}"/usr/share/doc/"${pkgname}"_v"${pkgver}"/CHANGELOG

  for doc in docs/*; do
    install -D -m644 "${doc}" "${pkgdir}"/usr/share/doc/"${pkgname}"_v"${pkgver}"/"${doc}"
  done

  for file in "${pkgdir}${installation_dir}"/kraken*; do
    install -Dm775 "${file}" "${pkgdir}"/usr/bin/$(basename "${file}")
  done
}
