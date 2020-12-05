# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-sudden-strike-4
pkgver=1.15
_pkgtag=$pkgver
pkgrel=1
pkgdesc="A historical real time strategy game. Commanding the Allied, German or Soviet troops."
arch=('x86_64')
url="https://www.gog.com/game/sudden_strike_4"
license=('custom')
makedepends=('lgogdownloader' 'findutils' 'unzip')
depends=('gtk2')
optdepends=("gog-sudden-strike-4-the-pacific-war=$pkgver"
            "gog-sudden-strike-4-road-to-dunkirk=$pkgver"
            "gog-sudden-strike-4-africa-desert-war=$pkgver"
            "gog-sudden-strike-4-finland_winter_storm=$pkgver"
            "gog-sudden-strike-4-battle_of_kursk=$pkgver")
source=("sudden_strike_4_${pkgver//./_}.sh::gogdownloader://2146639313/en3installer0"
        "Sudden Strike 4.desktop"
        "start-sudden-strike-4.sh")
sha512sums=('bc918de3e38ab86ecd8f1630f6afc2ad76bdcd848bf33ae57b6170e50f8323cd880ee2d2f3450c730c48fe76389b745dd637e7690723c623370067a3e83b8d36'
            '0414b87ab350906a0401bbc4b3c425d6efa6e9685b2dbabf87b88217b74bf4c5e73d411846996f5368ea241e366ddb63a23ebaae2b030730ff7f71179db40100'
            'a0250c930eef5dab2e7211dec395cc3c889b42728001b4976c32ee7f2d6902e25e1a0dd7d006897e3753d5b376c4c3ae109032c43bad77919d705bfd69be6223')

#lgogdownloader exit always with 141 after a successful downlaod for some games
# || test $? -eq 141 and /usr/bin/bash -c does not work in DLAGENTS, use a script instead
#https://stackoverflow.com/questions/65149855/add-a-makepkg-dlagent-which-accept-a-non-zero-exit-code
DLAGENTS+=("gogdownloader::./catch_gogdownloader_error141.sh %u %o")


prepare()
{
  test -d "${srcdir}/data" && rm -r "${srcdir}/data"
	echo "unzip will create a warning, because a script is in front of the archive"
  unzip -q -n -d "${srcdir}" "sudden_strike_4_${pkgver//./_}.sh" ||  test $? -eq 1
}

package()
{
  mkdir -p "${pkgdir}/opt/$pkgname"
  mv "${srcdir}/data/noarch/game" -T "${pkgdir}/opt/$pkgname"
  chmod -R 644 "${pkgdir}/opt/$pkgname/"
  chmod    755 "${pkgdir}/opt/$pkgname/SuddenStrike4.x86_64"
  find "${pkgdir}/opt/$pkgname" -type d -exec chmod 755 {} \;
  install -Dm 755 "${srcdir}/start-sudden-strike-4.sh" "${pkgdir}/usr/bin/sudden-strike-4"
  install -Dm 755 "${srcdir}/Sudden Strike 4.desktop" "$pkgdir/usr/share/applications/Sudden Strike 4.desktop"
  install -Dm 644 "${srcdir}/data/noarch/support/icon.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
  install -Dm 644 "${srcdir}/data/noarch/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
