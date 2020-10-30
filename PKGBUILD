# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-stellaris
pkgver=2.8.0
_pkgtag=$pkgver
pkgrel=1
pkgdesc="A strategy game with space exploration at its core"
arch=('x86_64')
url="https://www.gog.com/game/stellaris"
license=('custom')
makedepends=('unzip' 'findutils' 'lgogdownloader')
optdepends=("gog-stellaris-anniversary-portraits=$pkgver" "gog-stellaris-horizon-signal=$pkgver")
depends=('bash' 'sed' 'glibc' 'libx11' 'libglvnd' 'gcc-libs')
source=("stellaris_${pkgver//./_}.sh::gogdownloader://1508702879/en3installer0"
        "Stellaris.desktop"
        "start-stellaris.sh")
sha512sums=('483c03b53c5aa2f8d8d68e63f0627d3ca84622e5c5e3860f6a2938ac1fa4437238cf46f38cc5e4a809acfba4f9568a1478467b98e7bc74a233cacfddba8b280c'
            'adb27526719b22f71211cd0398f1323a3821821f12fd6998f592eb5e31c0891234f2505e7eb0b685588116b305aaf33b78670539b26440744befc351b4776827'
            '909ba5ce65d6906f7357ad12f5f9cf3a2c81c15bd6414298b91616236754c1d4bff32f0ab0f83f6449e8c6adda669351ce23fbdd80c1366b6d36c862c6435603')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

prepare()
{
  cd "${srcdir}"
  test -d "${srcdir}/stellaris" && rm -r "${srcdir}/stellaris"
  unzip -q -d stellaris stellaris_${pkgver//./_}.sh || test $? -eq 1
  cd "${srcdir}/stellaris/data/noarch/game"
  rm AutoClientScript.py \
     AutoClientScriptOvernight.py \
     dowser \
     launcher-installer-linux \
     pdx_core_test
}

package()
{
  mkdir -p "${pkgdir}/opt/$pkgname"
  cp -r "${srcdir}/stellaris/data/noarch/game" -T "${pkgdir}/opt/$pkgname"
  chmod -R 644 "${pkgdir}/opt/$pkgname/"
  chmod    755 "${pkgdir}/opt/$pkgname/stellaris"
  find "${pkgdir}/opt/$pkgname" -type d -exec chmod 755 {} \;
  install -Dm 755 "${srcdir}/start-stellaris.sh" "${pkgdir}/usr/bin/stellaris"
  install -Dm 755 "${srcdir}/Stellaris.desktop" "$pkgdir/usr/share/applications/Stellaris.desktop"
  install -Dm 644 "${srcdir}/stellaris/data/noarch/support/icon.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
  install -d 644 "${pkgdir}/usr/share/licenses/$pkgname"
  mv "${pkgdir}/opt/$pkgname/licenses" -T "${pkgdir}/usr/share/licenses/$pkgname/"
  install -Dm 644 "${srcdir}/stellaris/data/noarch/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  mv "${pkgdir}/opt/$pkgname/ThirdPartyLicenses.txt" "${pkgdir}/usr/share/licenses/$pkgname"
}
