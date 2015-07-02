# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

# prepared using:
#   ls -1 | /usr/bin/grep traineddata | cut -d"." -f 1 | tr '\n' ' '
_langs=(afr amh ara asm aze_cyrl aze bel ben bod bos bul cat ceb ces
chi_sim chi_tra chr cym dan_frak dan deu_frak deu dzo ell eng enm epo
equ est eus fas fin fra frk frm gle glg grc guj hat heb hin hrv hun
iku ind isl ita_old ita jav jpn kan kat_old kat kaz khm kir kor kur
lao lat lav lit mal mar mkd mlt msa mya nep nld nor ori osd pan pol
por pus ron rus san sin slk_frak slk slv spa_old spa sqi srp_latn srp
swa swe syr tam tel tgk tgl tha tir tur uig ukr urd uzb_cyrl uzb vie yid)

pkgbase=tesseract-data-git
pkgname=($(for l in ${_langs[@]}; do echo tesseract-data-${l}-git; done))
pkgver=3.074c372
pkgrel=1
pkgdesc="Trained language data for tesseract OCR Engine"
arch=('i686' 'x86_64')
url="https://github.com/tesseract-ocr/tessdata"
license=('Apache')
depends=('tesseract')
groups=('tesseract-data-git')
source=('tessdata::git+https://github.com/tesseract-ocr/tessdata.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/tessdata"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

for l in ${_langs[@]}; do
    eval "
package_tesseract-data-${l}-git(){
    provides=('tesseract-data-${l}')
    conflicts=('tesseract-data-${l}')

    cd \"\$srcdir/tessdata\"
    mkdir -p \"\$pkgdir/usr/share/tessdata\"
    cp ${l}.* \"\$pkgdir/usr/share/tessdata/\"
    find \$pkgdir/usr/share/tessdata -type f -exec chmod 0644 {} \;
}
    "
done

