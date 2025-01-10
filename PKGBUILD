# Maintainer: Masaki Waga <masakiwaga@gmail.com>
# Contributor: Tpaefawzen <960klo@gmail.com>
# Contributor: Tatsunori Aoki <ginjiro.135@gmail.com>

DLAGENTS='https::/usr/bin/curl --insecure -fLC - --retry 3 --retry-delay 3 -o %o %u'

pkgname=open-usp-tukubai
pkgver=20231122
pkgrel=2
pkgdesc="An open source version of shell commands usp Tukubai."
arch=('any')
url="https://www.uni-tama.com/html/"
license=('MIT' 'custom')
depends=('python')
conflicts=('open-usp-tukubai-git')

source=(
"https://unitama.usp-lab.com/download/${pkgname}-${pkgver}.tar.bz2"
)

md5sums=('2e64cd6e2b227e78634dad6b49280055'
)

build() {
  cd "$srcdir"
  sed -i 's/uconv/tukubai-&/g' Makefile
  sed -i 's/tcat/tukubai-tcat/g' Makefile
  sed -i 's:^HTMDIR=.*$:HTMDIR=		${PREFIX}/share/doc/${NAME}/html:' Makefile
  sed -i 's:^PDFDIR=.*$:PDFDIR=		${PREFIX}/share/doc/${NAME}/pdf:' Makefile
  sed -i 's:^DOCDIR=.*$:DOCDIR=		${PREFIX}/share/doc/${NAME}:' Makefile

  mv COMMANDS/tcat COMMANDS/tukubai-tcat
  mv COMMANDS/uconv COMMANDS/tukubai-uconv
  mv COMMANDS/count COMMANDS/tukubai-count
  mv man/uconv.1 man/tukubai-uconv.1

  mv MANUAL/uconv.txt MANUAL/tukubai-uconv.txt
}

check () {
  cd "$srcdir"
  commands="1bai block_getlast calclock calsed cap cgi-name check_attr_name check_cmp_name check_date_name check_dble_name check_inlist_name check_need_name cjoin0 cjoin1 cjoin1x cjoin2 cjoin2x comma tukubai-count ctail dayslash delf delr divsen exist extname filehame formhame fromcsv fsed getfirst getlast gyo haba han isdate itouch join0 join1 join1x join2 join2x joinx juni kasan keta keycut loopj loopx maezero map marume mdate mime-read mojihame msort nameread numchar plus rank ratio retu rjson self selr sm2 sm4 sm5 tarr tateyoko tukubai-tcat tocsv tukubai-uconv ulock unmap up3 uriencode wjson xmldir yarr ycat yobi ysum zen"

  for cmd in $commands; do
    if ! [ -f "./COMMANDS/$cmd" ]; then
      echo "Test failed: $cmd"
      return 1
    fi
  done
}

package() {
  cd "$srcdir"

  make PREFIX="${pkgdir}/usr" LOCALBASE="$pkgdir/usr" install
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  install -D -m644 man/*.1 "${pkgdir}/usr/share/man/man1"
}
