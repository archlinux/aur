# Maintainer: 3ED <krzysztof1987@gmail.com>

pkgname=daydreamer
pkgver=9.3
pkgrel=1
_app_player=("12ZqiK5XqhjUP_TLBD_iJrJBQkcOWSAH7" "9.3" "DayDreamer9.3.jar")
pkgdesc="Day Dreamer is interactive fiction player written in java (ddg/ddz format)"
arch=('any')
url="https://drive.google.com/folderview?id=0Byn3Yo_yFz45ak11MXl6U05mYVE&usp=sharing"
license=('CCPL:BY-ND-NC')
depends=('java-runtime-common')
makedepends=('librsvg')
conflicts=(daydreamer-common)
provides=(daydreamer-common)

source=("${pkgname}-${_app_player[1]}.zip::https://drive.google.com/uc?export=download&id=${_app_player[0]}"
        "daydreamer.mime"
        "launcher.sh"
        "daydreamer.desktop"
        "daydreamer-save.svg"
        "daydreamer-game.svg"
        "daydreamer.svg")
sha512sums=('61238421368ba8583bae609f45355a753f070fcaf842be48057275a4a44d67e073356cd6452a7151a783a39afbda6aaef21dc72c00d48cda79c73a3b6eebcf75'
            'a88082bcccf82dee9035a6f26651d970e623acda31c5b97b86dc78f6bf76542091012db284d0f620119a6e9d4b1743bd5a2e2cf91b232ef25720b32fd984d5bc'
            'b02deb777a20e5adba60829a4916b3f13f22a9334d06068d4c73cd72a3863201eba2d6917171479f293cfe87b608538386a335a277876dc47c73604d09598759'
            'c812d292be1c455d006f8909527718a9d93dd9bb071e8cf66cdafea2f6860fb90a12a0776f677e1c09c2c5d3912e42397c573ef2c74fab1c608893ec1ad6842c'
            '7f99b9baaa1539cdc6ca1cac70d739b34965b0581e4761162f20e93e27ebc799125f94d2611b3b168a38caddb7ed75ab613e898abdb7d414d814115076d2dde5'
            '716d856e6ca132fd3d7d5cb1a8a72a7ab749f9d55061f665d7be98a5b6a6a932fe2dd99875cdc71bc719bcbf5c94029d3f3e4ae1fa822d29df5627914121286d'
            '9b61145dd74f2a976d757d3926f752d1b861e0ebbfbe1c7a885c936274f8a6598913c637c752618f06bf64c9586b503d12bf69ccf41fd5435dfb9e7b7b361fef')

prepare() {
  cd "$srcdir"

  msg2 "Creating icons..."
  # Picture under CC, share and modification allowed, user/author: m-erencelik @deviantart
  # // vectorized by 3ED (inkscape)

  install -dm755 \
    "$srcdir/icons/hicolor/scalable/"{apps,mimetypes}
  install -m644 \
    "$srcdir/daydreamer.svg" \
    "$srcdir/icons/hicolor/scalable/apps/daydreamer.svg"

  for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256; do
    install -dm755 \
      "$srcdir/icons/hicolor/$i/apps/"
    rsvg-convert \
      -w "${i%%x*}" \
      -h "${i##*x}" \
      -f png \
      -o "$srcdir/icons/hicolor/$i/apps/daydreamer.png" \
      "$srcdir/daydreamer.svg"
  done

  for i in daydreamer-game daydreamer-save; do
    install -m644 \
      "$srcdir/$i.svg" \
      "$srcdir/icons/hicolor/scalable/mimetypes/application-x-$i.svg"

    for ii in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256; do
      install -dm755 \
        "$srcdir/icons/hicolor/$ii/mimetypes/"
      rsvg-convert \
        -w "${ii%%x*}" \
        -h "${ii##*x}" \
        -f png \
        -o "$srcdir/icons/hicolor/$ii/mimetypes/application-x-$i.png" \
        "$srcdir/$i.svg"
    done
  done

  msg2 "Creating launcher..."
  cat launcher.sh > daydreamer.sh
  echo 'launch_app "'"${_app_player[2]}"'"' >> daydreamer.sh

}

package() {
  install -dm755 \
    "$pkgdir/usr/"{bin,lib/daydreamer,share/{icons,mime/packages,doc/$pkgname,applications}}

  # mimetype
  install -m644 \
    "$srcdir/daydreamer.mime" \
    "$pkgdir/usr/share/mime/packages/daydreamer.xml"
  # doc -> readme
  install -m644 \
    "$srcdir/DayDreamer_readme.txt" \
    "$pkgdir/usr/share/doc/$pkgname/"
  # jar file
  install -m644 \
    "$srcdir/${_app_player[2]}" \
    "$pkgdir/usr/lib/daydreamer/"
  # launcher
  install -m755 \
    "$srcdir/daydreamer.sh" \
    "$pkgdir/usr/bin/daydreamer"
  # desktop file
  install -m644 \
    "$srcdir/daydreamer.desktop" \
    "$pkgdir/usr/share/applications/"
  # icons
  cd "icons"
  bsdtar -cf - hicolor \
    | bsdtar -xf - -C "$pkgdir/usr/share/icons/"
}
