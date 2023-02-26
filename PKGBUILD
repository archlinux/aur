# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragonlite
pkgver=1.5.3
pkgrel=2
pkgdesc='HUSH Lite wallet that supports z-addresses'
url='http://git.hush.is/hush/SilentDragonLite'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
makedepends=('qtcreator' 'rustup')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
        'silentdragonlite.desktop'
        'silentdragonlite.png')
sha512sums=('631ed0c43bf10010399fc35ad92b5fac22bf686568cc08443e4ccd3553ffb8d58e85bd87bb29b16104653ce6b8b481d7296193f023052a365b753028659ec622'
            '580379c88ef67d15cf1ac1e14899a0159230a2fd59f2400b864ee4d6711f0fcef29ccf84562a3cbdb7caa021271a4fab8210e228c9279ab0854eb1c668f1debd'
            '0b887786a3be6e0643f8d047b0c934036bb71d203e09e692bc2af056d8b23d8469feaff0f952642b1a087f09db159c692fe89aaa4e49802602c4044f9f0620a5')

# Default the required version of rustc for this to compile
# If rustc greater than 1.63 is used, then it does not compile as seen in
# https://git.hush.is/hush/SilentDragonLite/issues/89
prepare() {
  rustup install 1.63
  rustup default 1.63
}

build() {
  cd "$pkgname"
  ./build.sh linguist
  ./build.sh
  rustup default stable
}

package() {
  install -Dm755 "${srcdir}/$pkgname/SilentDragonLite" "${pkgdir}/opt/$pkgname/$pkgname"
  install -Dm644 "${srcdir}/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
  install -Dm644 "${srcdir}/$pkgname.png" "${pkgdir}/opt/$pkgname/$pkgname.png"

  # links to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/silentdragonlite "${pkgdir}/usr/bin"
}
