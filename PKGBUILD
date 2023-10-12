# Maintainer: Masaki Waga <masakiwaga@gmail.com>
# Contributor: Tatsunori Aoki <ginjiro.135@gmail.com>

DLAGENTS='https::/usr/bin/curl --insecure -fLC - --retry 3 --retry-delay 3 -o %o %u'

pkgname=open-usp-tukubai
pkgver=20230322
pkgrel=1
pkgdesc="An open source version of shell commands usp Tukubai."
arch=('any')
url="https://uec.usp-lab.com/TUKUBAI/CGI/TUKUBAI.CGI"
license=('MIT' 'custom')
depends=('python')
conflicts=('open-usp-tukubai-git')

source=(
"https://uec.usp-lab.com/TUKUBAI/DOWNLOAD/open-usp-tukubai-20230322.tar.bz2"
"https://gist.githubusercontent.com/MasWag/76a89b3c3056753d1d31/raw/280803d2cca5ad788184554271494941e6adaaa8/Makefile.patch"
)

md5sums=('d5e93fde3669e853e5da3f571ee9c21b'
         'b5571178bc45ef76662883dd35e20439')

build() {
  patch "$pkgname-$pkgver"/Makefile Makefile.patch
  cd "$pkgname-$pkgver"

  mv COMMANDS/tcat COMMANDS/tukubai-tcat
  for file in COMMANDS/*; do
      if [ "$(head -n 1 "$file")" == "#!/usr/bin/env python" ]; then
          2to3 -w -n "$file"
      fi
  done
  cat Makefile | grep "^#" | sed 's/^#//' > LICENSE
}

check () {
  cd "$pkgname-$pkgver"
  commands="1bai block_getlast calclock calsed cap cgi-name check_attr_name check_cmp_name check_date_name check_dble_name check_inlist_name check_need_name cjoin0 cjoin1 cjoin1x cjoin2 cjoin2x comma count ctail dayslash delf delr divsen exist extname filehame formhame fromcsv fsed getfirst getlast gyo haba han isdate itouch join0 join1 join1x join2 join2x joinx juni kasan keta keycut loopj loopx maezero map marume mdate mime-read mojihame msort nameread numchar plus rank ratio retu rjson self selr sm2 sm4 sm5 tarr tateyoko tukubai-tcat tocsv uconv ulock unmap up3 uriencode wjson xmldir yarr ycat yobi ysum zen"

  for cmd in $commands; do
    if ! [ -f "./COMMANDS/$cmd" ]; then
      echo "Test failed: $cmd"
      return 1
    fi
  done
}

package() {
  cd "$pkgname-$pkgver"

  make PREFIX="${pkgdir}/usr" LOCALBASE="$pkgdir/usr" install
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
