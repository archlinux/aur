# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=bbmap
pkgver=37.99
pkgrel=3
pkgdesc="A short read aligner and other bioinformatic tools"
arch=('x86_64')
url=https://jgi.doe.gov/data-and-tools/bbtools/
license=('BSD')
depends=('jre8-openjdk>=7')
optdepends=(
  'env-modules: for any scripts requiring `module`' 
  'pigz: for parallel GZIP (de)compression'
  'samtools: for BAM output'
)
source=("${pkgname}"-"${pkgver}".tar.gz::https://downloads.sourceforge.net/project/"${pkgname}"/BBMap_"${pkgver}".tar.gz)
sha256sums=('e796b399ba1a8d3ce4688b7d2d35f065754d4cdeddf09bb9a2f15ba77694f401')

prepare() {
  cd "${srcdir}"/"${pkgname}"/jni
  make -f makefile.linux clean
}

build() {
  cd "${srcdir}"/"${pkgname}"/jni
  # Headers for JNI are found in this Arch Linux specific location
  env JAVA_HOME=/usr/lib/jvm/default make -f makefile.linux
}

package() {
  cd "${srcdir}"/"${pkgname}"

  mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
  cp -r docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/

  mkdir -p "${pkgdir}"/usr/share/java/"${pkgname}"/
  cp -r config    "${pkgdir}"/usr/share/java/"${pkgname}"/
  cp -r current   "${pkgdir}"/usr/share/java/"${pkgname}"/
  cp -r jni       "${pkgdir}"/usr/share/java/"${pkgname}"/
  cp -r pipelines "${pkgdir}"/usr/share/java/"${pkgname}"/
  cp -r resources "${pkgdir}"/usr/share/java/"${pkgname}"/

  for script in *.sh; do
    sed -i s_'\bCP=.*'_CP=/usr/share/java/"${pkgname}"/current/_ "${script}"
    sed -i s_'\bDIR=.*'_DIR=/usr/bin/_ "${script}"
    sed -i s_'\bNATIVELIBDIR=.*'_NATIVELIBDIR=/usr/share/java/"${pkgname}"/current/jni/_ "${script}"

    install -Dm775 "${script}" "${pkgdir}"/usr/bin/"${script}"
  done
}
