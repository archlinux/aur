# Maintainer: Martin Reboredo <yakoyoku@gmail.com>

pkgname=mongosh
pkgver=2.5.10
pkgrel=1
pkgdesc='Rich Node.js REPL for interacting with MongoDB instances.'
arch=('x86_64')
url='https://github.com/mongodb-js/mongosh'
license=('Apache')
depends=(nodejs krb5)
makedepends=(git npm modclean libmongocrypt python)
optdepends=('libmongocrypt: session encryption support')
source=(
  https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz
)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('0e566dd8f256fcfaaf82975a5cf4aea3bf9589680ba27c867e9b3baa882168f1')
# sha256sums=('2f9f60f72765044d9dac0728b1b38fb340b6142047af80f568f2b4baad5249fa')
# sha256sums=('49f772210ca9af0c54b7db34b8db8e8aa2caed8d55ae06e49e197afdffb5e2d5')
# sha256sums=('7548c15d6af5094237e2d5545007fc453b2728bebcb316b926d9d1e1ce71d243')
# sha256sums=('2eb36d5562e8d4a7acad1253891ad1d733169e0dd6c19f91bc9db2b66045f9ad')
# sha256sums=('9f50ddd59bba6e03eff8e3b6459d6878461599e2716fee9abf9f285f34136410')
# sha256sums=('1dd5aea33d6134082e4ae9d5a8662f5da369b49f07445d881b2d22a7c75850f1')
# sha256sums=('87a60de61ac86f6e7c34e8f6103094f9c2790021afd9f39b42b90b606faf23b0')
# sha256sums=('4958bea34405c9598abd5b90e619a3279e84e49697fa1af03fb2b2614777881d')
# sha256sums=('5d3ea533f1493615c96962500895e42cd42b303853cf2f72057a8da097981dd6')
# sha256sums=('80db9c5a5bab54e8a820661acc6ab0f89922fc68fe0400f718bfdc410b35f5fa')
# sha256sums=('eb95034ba700aa39bff573131bffeffeeb3e5af3e421ff35860fa24255921f9e')
# sha256sums=('52b9d71ee1026d515b1d86dd791f58eb6f45382c8e1ca85bb9b5601e38dc6d1c')
# sha256sums=('5408d6e8c130e61ce1f8e4709de41b7655c1f156eb6638ae58958f3910e1351f')

package() {
  export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1
  npm install --omit=dev -g --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$pkgdir"/usr/lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname

  cd "$pkgdir"/usr/lib/node_modules/$pkgname
  modclean --path . -r -a "*.ts,.bin,.deps,.github,.vscode,bin.js,makefile" -I "license,makefile*"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"
  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
