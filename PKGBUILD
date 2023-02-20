# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragonlite
pkgver=1.5.2
pkgrel=4
pkgdesc='HUSH Lite wallet that supports z-addresses'
url='http://git.hush.is/hush/SilentDragonLite'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
makedepends=('qtcreator' 'rustup')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
        'hushdlogo.png'
        'silentdragonlite.desktop'
        'silentdragonlite.png')
sha512sums=('ee2e1df55b5f5b30cc6edf5f9cbf9a7fbf7dd49f6cf89239dd76ddffe104f87c9a39e636ca0ce3671ee8275115139f1c3e0f51aa830d5e5c7ffeba01c07a1597'
            '3a8621542cf45ff4ded4e4d1c3e74a4707bf3d837b4b97e0f7b5374330fe425d1ce89075ad244217746b30918bea4c9985d7a66190409fd41a35adc9c8d8c524'
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
  # upstream is missing this file in the release.tar.gz & it needs it to build
  cp "$srcdir/hushdlogo.png" "$pkgname/res/hushdlogo.png"
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
