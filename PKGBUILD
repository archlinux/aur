# Maintainer: John Beard <john.j.beard@gmail.com>
pkgname=goldendict-cc-cedict-content
pkgver=1.0_r20230506
pkgrel=1
pkgdesc="CC-CEDICT Chinese-English Dictionary for Goldendict"
arch=("any")
url="https://www.mdbg.net/chinese/dictionary?page=cedict"
license=("custom:cc-by-sa-4.0" "custom")
install=$pkgname.install
optdepends=(
"goldendict: for using this dictionary"
"goldendict-git: for using this dictionary"
)
makedepends=(
"pyglossary"
)
source=("cc-cedict.png"
"LICENSE"
"https://www.mdbg.net/chinese/export/cedict/cedict_1_0_ts_utf-8_mdbg.txt.gz")
md5sums=('729e16b892fb38a6d1c5853330191e93'
         '747cb41a7c6ddb22a508164f768dae2a'
         'SKIP')

_extractedFile="cedict.txt"

prepare() {

    cd "${srcdir}"

    gzip -d -c cedict*.txt.gz > ${_extractedFile}
}

pkgver() {

    cd "${srcdir}"

    version=$(grep -m 100 '#! version' ${_extractedFile} | cut -d'=' -f2 | tr -d '\r\n')
    subversion=$(grep -m 100 '#! subversion' ${_extractedFile} | cut -d= -f2 | tr -d '\r\n')
    datecode=$(grep -m 100 '#! date' ${_extractedFile} | cut -d= -f2 | cut -dT -f1 | tr -d '\r\n-')

    verstr="${version}.${subversion}_r${datecode}"

    echo -n "${verstr}"
}

build() {

  cd "${srcdir}"

  # convert to Stardict format
  pyglossary ${_extractedFile} cc-cedict.ifo\
    --read-format=CC-CEDICT --write-format=Stardict

  # update the bookname: this is what GoldenDict will display as the dictionary name
  sed -i 's/bookname=.*/bookname=CC-CEDICT/' cc-cedict.ifo

  # the .ifo version field is the Stardict format version, _not_ the dictionary version

  # zip the dict file to save installation space
  # gzip -c cc-cedict.dict > cc-cedict.dict.dz
}



package() {
  TARGET="/usr/share/goldendict"
  contentdir="${pkgdir}${TARGET}/content/cc-cedict"

  install -dm 755 ${contentdir}

  install -Dm 644 ${srcdir}/cc-cedict.{syn,ifo,dict,idx} ${contentdir}
  install -Dm 644 cc-cedict.png ${contentdir}

  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

