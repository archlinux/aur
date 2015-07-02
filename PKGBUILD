# Maintainer: 3ED <krzysztof1987@gmail.com>
pkgbase=daydreamer
pkgname=(daydreamer daydreamer-common daydreamer-editor)
pkgver=8.1
pkgrel=3
_app_player=("0Byn3Yo_yFz45ZWFJdVd0OFNPMG8" "8.1" "DayDreamer8.1.jar")
_app_editor=("0Byn3Yo_yFz45VUNwQlBQNkcyX1k" "8.1" "DayDreamerEditor8.1.jar")
pkgdesc="Day Dreamer is interactive fiction player written in java (ddg/ddz format)"
arch=('any')
url="https://drive.google.com/folderview?id=0Byn3Yo_yFz45ak11MXl6U05mYVE&usp=sharing"
license=('CCPL:BY-ND-NC')
depends=('java-runtime-common')
install=daydreamer.install

source=("${pkgbase}-${_app_player[1]}.zip::https://drive.google.com/uc?export=download&id=${_app_player[0]}"
        "${pkgbase}-editor-${_app_editor[1]}.zip::https://drive.google.com/uc?export=download&id=${_app_editor[0]}"
        "daydreamer.mime"
        "launcher.sh"
        "daydreamer.desktop"
        "daydreamer-editor.desktop"
        "daydreamer-save.svg"
        "daydreamer-game.svg"
        "daydreamer-editor.svg"
        "daydreamer.svg")
sha512sums=('4cfeffb34cc67430fc16c56760c6ad62ec44b274d1e11075cc813044cf2819fddc15251ec07bcff58d9449c8aac387cd1db8431d7fcba7c138858c9d925ba9a7'
            '9d3ebae1ba26051f4234fd7887dd202edf076eee9628152e3d1c03df7816239a1ccf756f337efbc13f35db35286d3dbb2a552ade353a182dee53b16476c03307'
            'a02799b7337166bc33645d6e4beaecdfac7e622ea5d5e876370a512fb261577bf619cb68b1776b95cb0014a4ee90ea84efaa26a08124087363fa3cebb52427a8'
            'b02deb777a20e5adba60829a4916b3f13f22a9334d06068d4c73cd72a3863201eba2d6917171479f293cfe87b608538386a335a277876dc47c73604d09598759'
            'c812d292be1c455d006f8909527718a9d93dd9bb071e8cf66cdafea2f6860fb90a12a0776f677e1c09c2c5d3912e42397c573ef2c74fab1c608893ec1ad6842c'
            '5b840f61cb91c48bb75d4519a29226681aee4d275051af8ae7579f07714dcb0c408f4b5e7b102ded9d8d884789edcce53e5af7565334eea6405e923af755399c'
            '7f99b9baaa1539cdc6ca1cac70d739b34965b0581e4761162f20e93e27ebc799125f94d2611b3b168a38caddb7ed75ab613e898abdb7d414d814115076d2dde5'
            '716d856e6ca132fd3d7d5cb1a8a72a7ab749f9d55061f665d7be98a5b6a6a932fe2dd99875cdc71bc719bcbf5c94029d3f3e4ae1fa822d29df5627914121286d'
            'dc79faf74a9114859d593b2625f4aecafaaaea794145b44dc0419101ac2731537d69db8bd5377767ef9539751b920f2a93358118fa35ed609f1fd4822932255e'
            '9b61145dd74f2a976d757d3926f752d1b861e0ebbfbe1c7a885c936274f8a6598913c637c752618f06bf64c9586b503d12bf69ccf41fd5435dfb9e7b7b361fef')
prepare() {
  cd "$srcdir"

  msg2 "Creating icons..."

  for i in daydreamer daydreamer-editor; do
    # Picture under CC, share and modification allowed, user/author: m-erencelik @deviantart
    # // vectorized by 3ED (inkscape)
    install -dm755 "$srcdir/icons/${i}/hicolor/scalable/apps/"
    install -m644  "$srcdir/${i}.svg" "$srcdir/icons/${i}/hicolor/scalable/apps/${i}.svg"

    for ii in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256; do
      install -dm755 "$srcdir/icons/${i}/hicolor/$ii/apps/"
      rsvg-convert -w "${ii%%x*}" -h "${ii##*x}" -f png \
        -o "$srcdir/icons/${i}/hicolor/$ii/apps/${i}.png" "$srcdir/${i}.svg"
    done
  done

  install -dm755 "$srcdir/icons/daydreamer-common/hicolor/scalable/mimetypes/"
  for i in daydreamer-game daydreamer-save; do
    # Picture under CC, share and modification allowed, user/author: m-erencelik @deviantart
    # // vectorized by 3ED (inkscape)
    install -m644 "$srcdir/$i.svg" \
      "$srcdir/icons/daydreamer-common/hicolor/scalable/mimetypes/application-x-$i.svg"

    for ii in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256; do
      install -dm755 "$srcdir/icons/daydreamer-common/hicolor/$ii/mimetypes/"
      rsvg-convert -w "${ii%%x*}" -h "${ii##*x}" -f png \
        -o "$srcdir/icons/daydreamer-common/hicolor/$ii/mimetypes/application-x-$i.png" "$srcdir/$i.svg"
    done
  done

  msg2 "Remove backup files from documentation..."
  find DayDreamerEditorHelp -name "*~" -delete

  msg2 "Creating launchers..."
  cat launcher.sh | tee daydreamer > daydreamer-editor
  echo 'launch_app "'"${_app_player[2]}"'"' >> daydreamer
  echo 'launch_app "'"${_app_editor[2]}"'"' >> daydreamer-editor

}

package_daydreamer-common() {
  pkgdesc="Commoin files for Day Dreamer player and editor"
  install=daydreamer-common.install

  install -dm755 "$pkgdir"/usr/share/{icons,mime/packages}
  install -m644 "$srcdir/${pkgbase}.mime" "$pkgdir/usr/share/mime/packages/${pkgbase}.xml"
  cd "icons/daydreamer-common"
  bsdtar -cf - hicolor | bsdtar -xf - -C "$pkgdir/usr/share/icons/"
}

package_daydreamer() {
  depends+=('daydreamer-common')
  pkgver="${_app_player[1]}"
  install -dm755 "$pkgdir"/usr/{bin,lib/$pkgbase,share/{icons,doc/$pkgname,applications}}
  install -m644 "$srcdir/DayDreamer_readme.txt" "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 "$srcdir/${_app_player[2]}" "$pkgdir/usr/lib/$pkgbase/"
  install -m755 "$srcdir/${pkgname}" "$pkgdir/usr/bin/"
  install -m644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/"

  cd "icons/daydreamer"
  bsdtar -cf - hicolor | bsdtar -xf - -C "$pkgdir/usr/share/icons/"
}

package_daydreamer-editor() {
  depends+=('daydreamer-common')
  pkgdesc="Editor for Day Dreamer interactive fiction games"
  pkgver="${_app_editor[1]}"

  install -dm755 "$pkgdir"/usr/{bin,lib/$pkgbase,share/{icons,doc/$pkgname,applications}}
  install -m644 "$srcdir/${_app_editor[2]}" "$pkgdir/usr/lib/$pkgbase/"
  install -m755 "$srcdir/${pkgname}" "$pkgdir/usr/bin/"
  install -m644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/"
  install -m644 DayDreamerEditorHelp.html "$pkgdir/usr/share/doc/$pkgname/"
  bsdtar -cf - DayDreamerEditorHelp | bsdtar -xf - -C "$pkgdir/usr/share/doc/$pkgname/"

  cd "icons/daydreamer-editor"
  bsdtar -cf - hicolor | bsdtar -xf - -C "$pkgdir/usr/share/icons/"
}
