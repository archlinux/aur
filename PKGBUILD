# Maintainer: Colin Adler <colin@coder.com>
# Maintainer: Asher <ash@coder.com>
# Maintainer: Joe Previte <joe@coder.com>
# Contributor: Anmol <anmol@coder.com>

pkgname=code-server
pkgver=3.11.1
pkgrel=0
pkgdesc="VS Code in the browser"
arch=("x86_64" "aarch64")
url="https://github.com/cdr/code-server"
license=(MIT)
depends=(glibc)
source=(
  "$pkgname-$pkgver-user.service::https://raw.githubusercontent.com/cdr/code-server/v$pkgver/ci/build/code-server-user.service"
  "$pkgname-$pkgver@.service::https://raw.githubusercontent.com/cdr/code-server/v$pkgver/ci/build/code-server@.service"
)
release_name="code-server-${pkgver}-linux"
source_x86_64=(
  "${url}/releases/download/v$pkgver/$release_name-amd64.tar.gz"
)
source_aarch64=(
  "${url}/releases/download/v$pkgver/$release_name-arm64.tar.gz"
)
sha512sums=('7040df09c7404a56dbbb32e09d04ead3b622773520feae19c6710656cef46ca5d79b1972bfebb931e309e495d041b9938cd6a51c39fc0f8f6133dfe711be9280'
            'ab8e679c05f6184f163dccf0651e8c1fac22a29ae583148f8c93b6930ece27cdff45a48b425e8b15b8c8ce749015680a3ae8225b7e8037979ff3d228f396f629')
sha512sums_x86_64=('597731a401ad48f2fa902f98e9d376f509d343d04e94a8a2f980885e60ff3a85f37d3d3b3b5628546fda371cea37b5b26b4b40864d6483d6d569e4ee13af0af3')
sha512sums_aarch64=('e48545a35fe505f9b44996fec838f81c4ffeef51e1521c8377ee87e0c692abf73838c656c5d7a94b6cda112166d33af70c52097d39b44f5c6016d6d52d7cd8a5')

package() {
  if [[ $(uname -m) == x86_64 ]]; then
    release_name+=-amd64
  else
    release_name+=-arm64
  fi

  mkdir -p "$pkgdir/usr/lib"
  cp -a "$release_name" "$pkgdir/usr/lib/$pkgname"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"

  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cp -aL "$pkgname-$pkgver@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"

  mkdir -p "$pkgdir/usr/lib/systemd/user"
  cp -aL "$pkgname-$pkgver-user.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"

  mkdir -p "$pkgdir/usr/share/licenses"
  cp -a "$release_name/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
