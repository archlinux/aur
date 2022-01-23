# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

_langs=(afr amh ara asm aze aze_cyrl bel ben bod bos bre bul cat ceb ces
    chi_sim chi_tra chr cos cym dan dan_frak deu deu_frak div dzo ell eng enm epo
    equ est eus fao fas fil fin fra frk frm fry gla gle glg grc guj hat heb
    hin hrv hun hye iku ind isl ita ita_old jav jpn kan kat kat_old kaz khm
    kir kmr kor kor_vert lao lat lav lit ltz mal mar mkd mlt mon mri msa
    mya nep nld nor oci ori osd pan pol por pus que ron rus san sin slk
    slk_frak slv snd spa spa_old sqi srp srp_latn sun swa swe syr tam tat
    tel tgk tgl tha tir ton tur uig ukr urd uzb uzb_cyrl vie yid yor)

pkgname=tesseract-git
pkgver=5.0.1.r9.g31a96843
pkgrel=1
epoch=1
pkgdesc="Open Source OCR Engine"
arch=(x86_64)
url="https://tesseract-ocr.github.io/"
license=(Apache)
depends=(libtiff libpng leptonica giflib)
makedepends=(git pango icu)
optdepends=('pango: text2image'
            'icu: text2image'
            $(for l in ${_langs[@]}; do echo tesseract-data-${l}; done))
provides=(tesseract)
conflicts=(tesseract)
install=tesseract.install
source=("git+https://github.com/tesseract-ocr/tesseract.git"
        "https://github.com/tesseract-ocr/tessdata/raw/bf82613055ebc6e63d9e3b438a5c234bfd638c93/osd.traineddata")
sha256sums=('SKIP'
            '9cf5d576fcc47564f11265841e5ca839001e7e6f38ff7f7aacf46d15a96b00ff')

pkgver() {
  cd "${srcdir}/tesseract"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/tesseract"
  ./autogen.sh
}

build() {
  cd "$srcdir/tesseract"
  ./configure --prefix=/usr
  make
  make training
}

package() {
  cd "$srcdir/tesseract"
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" training-install
  install -Dm0644 "${srcdir}"/osd.traineddata "${pkgdir}"/usr/share/tessdata/osd.traineddata
}
