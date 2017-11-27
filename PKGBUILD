# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=vcflib-git
pkgver=v1.0.0.rc1.r127.gac59d4f
pkgrel=1
pkgdesc="A simple C++ library for parsing and manipulating VCF files, and many command-line utilities"
arch=('i686' 'x86_64')
url="https://github.com/vcflib/vcflib"
license=('MIT')
depends=('zlib')
provides=('vcflib')
conflicts=('vcflib')
source=(
  "git+git://github.com/vcflib/vcflib.git#commit=ac59d4f0b18c6c5f0b378aa84bee6a453ca70572"
  "git+git://github.com/ekg/fastahack.git#commit=c68cebb4f2e5d5d2b70cf08fbdf1944e9ab2c2dd"
  "git+git://github.com/ekg/filevercmp.git#commit=1a9b779b93d0b244040274794d402106907b71b7"
  "git+git://github.com/ekg/fsom.git#commit=a6ef318fbd347c53189384aef7f670c0e6ce89a3"
  "git+git://github.com/google/googletest.git#commit=d225acc90bc3a8c420a9bcd1f033033c1ccd7fe0"
  "git+git://github.com/ekg/intervaltree.git#commit=b704f195e9b51d44dad68e33c209b06e63ebb353"
  "git+git://github.com/edawson/libVCFH.git#commit=7ee7a250ce009d29f20aca7a2e2ef24bb7825a0f"
  "git+git://github.com/ekg/multichoose.git#commit=73d35daa18bf35729b9ba758041a9247a72484a5"
  "git+git://github.com/ekg/smithwaterman.git#commit=84c08d7eae7211d87fbcb1871dae20e6c2041e96"
  "git+git://github.com/ekg/tabixpp.git#commit=4a3b4c33e9972c00dc8af53de52033d8c718f383"
  "git+git://github.com/samtools/htslib.git#commit=49fdfbda20acbd73303df3c7fef84f2d972c5f8d"
)
md5sums=(
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
  'SKIP'
)

prepare() {
  cd "${srcdir}"/"${pkgname//-git/}"

  git submodule init
  git config submodule.fastahack.url "${srcdir}"/fastahack
  git config submodule.filevercmp.url "${srcdir}"/filevercmp
  git config submodule.fsom.url "${srcdir}"/fsom
  git config submodule.googletest.url "${srcdir}"/googletest
  git config submodule.intervaltree.url "${srcdir}"/intervaltree
  git config submodule.libVCFH.url "${srcdir}"/libVCFH
  git config submodule.multichoose.url "${srcdir}"/multichoose
  git config submodule.smithwaterman.url "${srcdir}"/smithwaterman
  git config submodule.tabixpp.url "${srcdir}"/tabixpp
  git submodule update

  cd "${srcdir}"/"${pkgname//-git/}"/tabixpp

  git submodule init
  git config submodule.htslib.url "${srcdir}"/htslib
  git submodule update
}

pkgver() {
  cd "${pkgname//-git/}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "${srcdir}"/"${pkgname//-git/}"/tabixpp/htslib

  autoheader
  autoconf
  ./configure
  make

  cd "${srcdir}/${pkgname//-git/}"
  make openmp
}

package() {
  cd "${srcdir}/${pkgname//-git/}"

  mkdir -p "${pkgdir}/usr/bin/"

  for file in bin/*; do
    mv "${file}" "${pkgdir}"/usr/bin/"$(basename ${file})"
  done

  # Replace Python header in Python scripts for Arch convention.
  sed -i 's/python/python2/g' "${pkgdir}"/usr/bin/vcf2bed.py
  sed -i 's/python/python2/g' "${pkgdir}"/usr/bin/vcf2sqlite.py
}
