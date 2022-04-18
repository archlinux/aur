# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=bbmap
pkgver=38.96
pkgrel=1
pkgdesc="A short read aligner and other bioinformatic tools"
arch=('x86_64')
url=https://jgi.doe.gov/data-and-tools/bbtools/
license=('BSD')
depends=('jre8-openjdk' 'jdk8-openjdk')
optdepends=(
  'env-modules: for any scripts requiring `module`' 
  'pigz: for parallel GZIP (de)compression'
  'samtools: for BAM output'
)
source=("${pkgname}"-"${pkgver}".tar.gz::https://downloads.sourceforge.net/project/"${pkgname}"/BBMap_"${pkgver}".tar.gz)
sha256sums=('18d9c89b02c0ab044b2795a65f6236b2262a494ed83d27e31750437b350ef080')

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
