# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=freebayes
pkgver=1.1.0
pkgrel=1
pkgdesc="A tool for finding polymorphisms in high throughput sequence data."
arch=('x86_64')
url="https://github.com/ekg/freebayes"
license=('MIT')
depends=('gcc-libs' 'jsoncpp>=1.8.0' 'openmp' 'zlib')
makedepends=('cmake>=3.0' 'git')
provides=('freebayes')
conflicts=('freebayes')
source=(
    "git+git://github.com/ekg/bamtools.git#commit=e77a43f5097ea7eee432ee765049c6b246d49baa"
    "git+git://github.com/walaj/bwa.git#commit=fbd4dbc03904eccd71cdca8cac7aa48da749c19c"
    "git+git://github.com/ekg/fastahack.git#commit=c68cebb4f2e5d5d2b70cf08fbdf1944e9ab2c2dd"
    "git+git://github.com/walaj/fermi-lite.git#commit=5bc90f8d70e2b66184eccbd223a3be714c914365"
    "git+git://github.com/ekg/filevercmp.git#commit=1a9b779b93d0b244040274794d402106907b71b7"
    "git+git://github.com/ekg/freebayes.git#commit=39e5e4bcb801556141f2da36aba1df5c5c60701f"
    "git+git://github.com/ekg/fsom.git#commit=a6ef318fbd347c53189384aef7f670c0e6ce89a3"
    "git+git://github.com/google/googletest.git#commit=d225acc90bc3a8c420a9bcd1f033033c1ccd7fe0"
    "git+git://github.com/samtools/htslib.git#commit=0f298ce22c5c825c506129bf242348a31630c382"
    "git+git://github.com/ekg/intervaltree.git#commit=dbb4c513d1ad3baac516fc1484c995daf9b42838"
    "git+git://github.com/ekg/intervaltree.git#commit=b704f195e9b51d44dad68e33c209b06e63ebb353"
    "git+git://github.com/ekg/multichoose.git#commit=73d35daa18bf35729b9ba758041a9247a72484a5"
    "git+git://github.com/walaj/SeqLib.git#commit=cce1e410ef6d2ac64972f5cacd8a0f9b86cecdd8"
    "git+git://github.com/ekg/smithwaterman.git#commit=84c08d7eae7211d87fbcb1871dae20e6c2041e96"
    "git+git://github.com/ekg/tabixpp.git#commit=80012f86dc22b13c75b73baf38195956db92473e"
    "git+git://github.com/vcflib/vcflib.git#commit=5e3ce04f758c6df16bc4d242b18a24d725d2e6e5"
)
md5sums=(
    SKIP SKIP SKIP SKIP
    SKIP SKIP SKIP SKIP
    SKIP SKIP SKIP SKIP
    SKIP SKIP SKIP SKIP
)

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git config submodule.SeqLib.url "${srcdir}/SeqLib"
  git config submodule.bamtools.url "${srcdir}/bamtools"
  git config submodule.intervaltree.url "${srcdir}/intervaltree"
  git config submodule.vcflib.url "${srcdir}/vcflib"
  git submodule update

  cd "${srcdir}/${pkgname}/SeqLib"
  git submodule init
  git config submodule.bwa.url "${srcdir}/bwa"
  git config submodule.fermi-lite.url "${srcdir}/fermi-lite"
  git config submodule.htslib.url "${srcdir}/htslib"
  git submodule update

  cd "${srcdir}/${pkgname}/vcflib"
  git submodule init
  git config submodule.fastahack.url "${srcdir}/fastahack"
  git config submodule.filevercmp.url "${srcdir}/filevercmp"
  git config submodule.fsom.url "${srcdir}/fsom"
  git config submodule.googletest.url "${srcdir}/googletest"
  git config submodule.intervaltree.url "${srcdir}/intervaltree"
  git config submodule.multichoose.url "${srcdir}/multichoose"
  git config submodule.smithwaterman.url "${srcdir}/smithwaterman"
  git config submodule.tabixpp.url "${srcdir}/tabixpp"
  git submodule update

  cd "${srcdir}/${pkgname}/vcflib/tabixpp"
  git submodule init
  git config submodule.htslib.url "${srcdir}/htslib"
  git submodule update
}

build() {
  cd "${srcdir}/${pkgname}" && make
}

check() {
  # Need to install http://search.cpan.org/dist/Test-Harness/bin/prove first.
  # cd "${srcdir}/${pkgname}" && make test
  true
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}-${pkgver}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/README.md"
  install -Dm644 CONTRIBUTORS "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/CONTRIBUTORS"

  install -D bin/bamleftalign "${pkgdir}/usr/bin/bamleftalign"
  install -D bin/freebayes "${pkgdir}/usr/bin/freebayes"
}
