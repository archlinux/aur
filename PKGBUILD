# Maintainer: Sander Zuidema <archlinux at grunny dot demon dot nl>
# Contributor: Lukas Grossar <lukas dot grossar at gmail dot com>

pkgname=moneydance
pkgver=2015.1358
pkgrel=3
epoch=
pkgdesc="A personal finance manager for Mac, Windows and Linux"
arch=('i686' 'x86_64')
url="http://www.moneydance.com/"
license=('custom')
groups=()
depends=('java-runtime' 'bash')
checkdepends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('moneydance.sh'
        'moneydance.patch')
source_i686+=(http://infinitekind.com/stabledl/2015/Moneydance_linux_x86.tar.gz)
source_x86_64+=(http://infinitekind.com/stabledl/2015/Moneydance_linux_amd64.tar.gz)
sha256sums=('2afec424853974a22690657376edfdbe7924a2adae7ea57c0e3aa98d8cd62947'
            '4e48af0efb968910304767fe0bbab733aaa7b15f4d05b6a82c9fdac78351776f')
sha256sums_i686=('a4d18b832eda92580d593d8d2afbcad2e06a5f6609b1355516b32ca7a5a1c4a8')
sha256sums_x86_64=('64bc32f5d6fc6bffb5e2f923d04a0250a993cb3f3394626352cda933a77d4b95')

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
  
  cd "$srcdir/Moneydance/jars"
  bsdcpio --extract --make-directories "com/moneydance/apps/md/view/gui/glyphs/appicon_128.png" < $pkgname.jar || return 1

  cd "$srcdir/${pkgname^}"
  patch -uN "resources/moneydance.desktop" "../moneydance.patch"
  install -m644 "resources/moneydance.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop" || return 1
  install -m644 "resources/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
  install -m644 jars/com/moneydance/apps/md/view/gui/glyphs/appicon_128.png "$pkgdir/usr/share/pixmaps/$pkgname.png" || return 1
  install -m644 jars/*.jar "$pkgdir/usr/share/java/$pkgname" || return 1
}
