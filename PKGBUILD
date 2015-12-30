# Maintainer: 3ED <krzysztof1987@gmail.com>

pkgname=daydreamer-editor
pkgver=8.4
pkgrel=1
_app_editor=("0Byn3Yo_yFz45M2d3cUNtUDI5Vlk" "8.4" "DayDreamerEditor8.4.jar")
pkgdesc="Editor for Day Dreamer interactive fiction games"
arch=('any')
url="https://drive.google.com/folderview?id=0Byn3Yo_yFz45ak11MXl6U05mYVE&usp=sharing"
license=('CCPL:BY-ND-NC')
depends=('java-runtime-common' 'daydreamer')
makedepends=('librsvg')
install=daydreamer-editor.install

source=("${pkgname}-${_app_editor[1]}.zip::https://drive.google.com/uc?export=download&id=${_app_editor[0]}"
        "launcher.sh"
        "daydreamer-editor.desktop"
        "daydreamer-editor.svg")
sha512sums=('459468f59cf141bc5b2be63883d9f50f18397af5ff842de72b0891648552cdbbe49915b1c9c223993ed2ac0177dec8eef0348f46910272efbb815c49240e4cff'
            'b02deb777a20e5adba60829a4916b3f13f22a9334d06068d4c73cd72a3863201eba2d6917171479f293cfe87b608538386a335a277876dc47c73604d09598759'
            '5b840f61cb91c48bb75d4519a29226681aee4d275051af8ae7579f07714dcb0c408f4b5e7b102ded9d8d884789edcce53e5af7565334eea6405e923af755399c'
            'dc79faf74a9114859d593b2625f4aecafaaaea794145b44dc0419101ac2731537d69db8bd5377767ef9539751b920f2a93358118fa35ed609f1fd4822932255e')

prepare() {
  cd "$srcdir"

  msg2 "Creating icons..."
  # Picture under CC, share and modification allowed, user/author: m-erencelik @deviantart
  # // vectorized by 3ED (inkscape)

  install -dm755 \
    "$srcdir/icons/hicolor/scalable/apps/"
  install -m644 \
    "$srcdir/daydreamer-editor.svg" \
    "$srcdir/icons/hicolor/scalable/apps/daydreamer-editor.svg"

  for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256; do
    install -dm755 \
      "$srcdir/icons/hicolor/$i/apps/"
    rsvg-convert \
      -w "${i%%x*}" \
      -h "${i##*x}" \
      -f png \
      -o "$srcdir/icons/hicolor/$i/apps/daydreamer-editor.png" \
      "$srcdir/daydreamer-editor.svg"
  done


  msg2 "Remove backup files from documentation..."
  find DayDreamerEditorHelp -name "*~" -delete

  msg2 "Creating launchers..."
  cat launcher.sh > daydreamer-editor.sh
  echo 'launch_app "'"${_app_editor[2]}"'"' >> daydreamer-editor.sh

}

package() {
  install -dm755 \
    "$pkgdir"/usr/{bin,lib/daydreamer,share/{icons,doc/$pkgname,applications}}

  # jar file
  install -m644 \
    "$srcdir/${_app_editor[2]}" \
    "$pkgdir/usr/lib/daydreamer/"
  # launcher
  install -m755 \
    "$srcdir/${pkgname}.sh" \
    "$pkgdir/usr/bin/${pkgname}"
  # desktop file
  install -m644 \
    "$srcdir/${pkgname}.desktop" \
    "$pkgdir/usr/share/applications/"
  # editor's help files
  install -m644 \
    DayDreamerEditorHelp.html \
    "$pkgdir/usr/share/doc/$pkgname/"
  bsdtar -cf - DayDreamerEditorHelp \
    | bsdtar -xf - -C "$pkgdir/usr/share/doc/$pkgname/"
  # icons
  cd "icons"
  bsdtar -cf - hicolor \
    | bsdtar -xf - -C "$pkgdir/usr/share/icons/"
}
