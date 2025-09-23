#Maintainer: zayatura <zayatura@mailbox.org>
pkgname=infra-arcana
pkgver=23.0.0
pkgrel=2
epoch=
pkgdesc="Roguelike game inspired by H.P. Lovecraft"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/infraarcana/home"
license=('custom:Infra Arcana License')
groups=()
makedepends=(icoutils)
depends=('sdl2_image' 'sdl2_mixer' 'hicolor-icon-theme')
conflicts=('infra-arcana-git')

install=${pkgname}.install
source=("ia_linux_x64_v$pkgver.zip::https://gitlab.com/martin-tornqvist/ia/-/jobs/artifacts/v$pkgver/download?job=build-linux"
    "icon_v$pkgver.ico::https://gitlab.com/martin-tornqvist/ia/-/raw/v$pkgver/icon/icon.ico?inline=false"
    "${pkgname}.install"
    "${pkgname}.desktop"
    "${pkgname}")
sha256sums=('ef59f3c0468258b1a5645cc1b8a71f32ea94c883dbb6c7e7d584807edf8e35d4'
         '5c5b0b435e5effead5a700bc870aaf227536f32e736348f23956048d7c3225fd'
         '3675cbaa28ce7e9e99271914f957cdbec942799aef0f88584cd99ddd642360d2'
         'cc38ecfb7529cefabb350c9269349477f028629f8d32d75aaea03b7bb3571869'
         '2db47e30b1277a8cf61d48d21260c3e1743d23c22f5d937fb515365de58605d9')

prepare() {
  icotool -x -o . icon_v$pkgver.ico
}

package() {
  cd $srcdir/ia_linux_x64_v$pkgver
  
  #install licenses
  install -DTm644 "./LICENSE.txt"\
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -DTm644 "./LICENSE-FONT-SPECIAL-ELITE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-FONT-SPECIAL-ELITE.txt"
  install -DTm644 "./LICENSE-AUDIO.txt"\
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-AUDIO.txt"
  install -DTm644 "./LICENSE-FONT-DEJAVU.txt"\
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-FONT-DEJAVU.txt"
  install -DTm644 "./LICENSE-FONTS.txt"\
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-FONTS.txt"

  #install docs
  install -DTm644 "./contact.txt" \
    "${pkgdir}/usr/share/doc/${pkgname}/contact.txt"
  install -DTm644 "./credits.txt" \
    "${pkgdir}/usr/share/doc/${pkgname}/credits.txt"
  install -DTm644 "./release_history.txt" \
    "${pkgdir}/usr/share/doc/${pkgname}/release_history.txt"

  # copy data
  mkdir -p "${pkgdir}/opt/${pkgname}/"
  cp -R ./audio "${pkgdir}/opt/${pkgname}/"
  cp -R ./data "${pkgdir}/opt/${pkgname}/"
  cp -R ./gfx "${pkgdir}/opt/${pkgname}/"
  cp ./manual.txt "${pkgdir}/opt/${pkgname}/"

  # copy main binary
  install -Dm755 ./ia "${pkgdir}/opt/${pkgname}/infra-arcana"

  # install the launcher file, meant to launch the game from the command-line
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  #install icons
  install -Dm644 "${srcdir}/icon_v${pkgver}_1_16x16x32.png" \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/${pkgname}.png"
  install -Dm644 "${srcdir}/icon_v${pkgver}_2_32x32x32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
  install -Dm644 "${srcdir}/icon_v${pkgver}_3_48x48x32.png" \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 "${srcdir}/icon_v${pkgver}_4_64x64x32.png" \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
  install -Dm644 "${srcdir}/icon_v${pkgver}_5_128x128x32.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -Dm644 "${srcdir}/icon_v${pkgver}_6_256x256x32.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  # install the .desktop file
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
