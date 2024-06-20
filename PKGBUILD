# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Hauser <andy-aur@splashground.de>

_langs=(afr amh ara asm aze_cyrl aze bel ben bod bos bre bul cat ceb ces chi_sim chi_sim_vert chi_tra chi_tra_vert chr cos cym dan deu div dzo ell eng enm epo est eus fao fas fil fin fra frk frm fry gla gle glg grc guj hat heb hin hrv hun hye iku ind isl ita_old ita jav jpn jpn_vert kan kat_old kat kaz khm kir kmr kor kor_vert lao lat lav lit ltz mal mar mkd mlt mon mri msa mya nep nld nor oci ori osd pan pol por pus que ron rus san sin slk slv snd spa_old spa sqi srp_latn srp sun swa swe syr tam tat tel tgk tha tir ton tur uig ukr urd uzb_cyrl uzb vie yid yor)

pkgbase=tesseract-data-best
pkgname=("${_langs[@]/#/tesseract-data-best-}")
_pkgname=tessdata
epoch=2
pkgver=4.1.0
pkgrel=4
pkgdesc='Best performing Tesseract OCR LSTM data'
arch=(any)
url="https://github.com/tesseract-ocr/${_pkgname}_best"
license=(Apache)
_archive="$_pkgname-$pkgver"
_archive_dir="${_pkgname}_best-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('bb05b738298ae73e7130e2913ed002b49d94cd1cea508e63be1928fe47770b32')

build() {
	:
}

# osd is a pseudo-language data set that is required all the time, by itself
# it is not sufficient to provide a language as the virtual 'tessdata' package
# nor is it included in the group
package_tesseract-data-best-osd() {
	provides=(tesseract-data-osd)
	conflicts=(tesseract-data-osd)
	local lang=${pkgname##*-}
	pkgdesc+=" (osd)"
	cd "$_archive_dir"
	install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/" $lang.*
}

# Declare the package functions for data
for lang in ${_langs[@]}; do
	if [[ $lang == osd ]]; then continue; fi
	eval "
package_tesseract-data-best-$lang(){
	pkgdesc+=' ($lang)'
	depends=(tesseract)
	provides=($_pkgname tesseract-data-$lang)
	conflicts=(tesseract-data-$lang)
	groups=($pkgbase)
	cd '$_archive_dir'
	install -Dm0644 -t \"\$pkgdir/usr/share/$_pkgname/\" $lang.*
}
    "
done
