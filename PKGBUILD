# Maintainer: Sander Zuidema <archlinux at grunny dot demon dot nl>
# Contributor: Lukas Grossar <lukas dot grossar at gmail dot com>

pkgname=moneydance
pkgver=2015.1299
pkgrel=1
epoch=
pkgdesc="A personal finance manager for Mac, Windows and Linux"
arch=('i686' 'x86_64')
url="http://www.moneydance.com/"
license=('custom')
groups=()
depends=('java-runtime' 'bash')
makedepends=('libicns')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('moneydance.sh'
        'moneydance.patch'
        'http://infinitekind.com/stabledl/2015/Moneydance.zip')
source_i686+=(http://infinitekind.com/stabledl/2015/Moneydance_linux_x86.tar.gz)
source_x86_64+=(http://infinitekind.com/stabledl/2015/Moneydance_linux_amd64.tar.gz)
sha256sums=('9c45324e6929c3ef52d195cfbbc6014e666b2f34a1be03c0bd81cd50b44cd89a'
            '4e48af0efb968910304767fe0bbab733aaa7b15f4d05b6a82c9fdac78351776f'
            'c89b4a16381b42a036aca634c38e21f83558730dbce9a166b355bbb5f6aef3c3')
sha256sums_i686=('b7f5b8463096b5a014a668259b303bd60ca0096328623eae4cc3515b9ceaabc8')
sha256sums_x86_64=('9a605834621cac00042e53a800747aa8d586464357cf40f2dd462f8553eee625')

package() {
  # generate directories in $pkgdir
  install -m755 -d "$pkgdir/usr/bin" \
    "$pkgdir/usr/share/java/$pkgname" \
    "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/pixmaps"

  # copy files
  cd "$srcdir"
  install -m755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname" || return 1

  # copy Mac icon since they're higher res
  cd "$srcdir/${pkgname^}.app/Contents/Resources/"
  icns2png -o . -x Moneydance.icns || return 1
  install -m644 "Moneydance_1024x1024x32.png" "$pkgdir/usr/share/pixmaps/$pkgname.png" || return 1

  cd "$srcdir/${pkgname^}"
  patch -uN "resources/moneydance.desktop" "../moneydance.patch"
  install -m644 "resources/moneydance.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop" || return 1
  install -m644 "resources/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
  install -m644 jars/*.jar "$pkgdir/usr/share/java/$pkgname" || return 1
}
