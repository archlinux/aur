# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-stellaris
pkgver=2.7.2
_pkgtag=$pkgver
pkgrel=1
pkgdesc="A strategy game with space exploration at its core"
arch=('x86_64')
url="https://www.gog.com/game/stellaris"
license=('custom')
depends=('glibc' 'libx11' 'libglvnd' 'gcc-libs')
source=("stellaris_${pkgver//./_}_38578.sh::gogdownloader://stellaris/en3installer0"
        "Stellaris.desktop"
        "start-stellaris.sh")
sha512sums=('68135960fc348d6667de2ae69ab02040e4a0d09ffe738d9c16121f33d82418695bd7d5ae55762f9c5cfd633430f4d4ea2cec06630668548eb1994f7f970f4471'
            'adb27526719b22f71211cd0398f1323a3821821f12fd6998f592eb5e31c0891234f2505e7eb0b685588116b305aaf33b78670539b26440744befc351b4776827'
            '909ba5ce65d6906f7357ad12f5f9cf3a2c81c15bd6414298b91616236754c1d4bff32f0ab0f83f6449e8c6adda669351ce23fbdd80c1366b6d36c862c6435603')

prepare()
{
  cd "${srcdir}"
  test -d "${srcdir}/stellaris" && rm -r "${srcdir}/stellaris"
  unzip -q -d stellaris stellaris_${pkgver//./_}_38578.sh || test $? -eq 1
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
