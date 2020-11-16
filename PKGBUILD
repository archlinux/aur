# Maintainer: Colin Adler <colin@coder.com>
# Maintainer: Anmol Sethi <anmol@coder.com>
# Maintainer: Ash <ash@coder.com>

pkgname=code-server
pkgver=3.7.0
pkgrel=1
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
sha512sums_x86_64=('c9490b229df665883f046e1ae0ebd5c18ccd5f8cdd6c58800ec58be275d9099e6eb36e683d736d255899e01cd9d2f5239e32f10060d4e55d40b2c988d5d1b765')
sha512sums_aarch64=('d1fdc8b52d6f2644222125cadb411a58caff9c68cb4ce3181259c2beb2c153584ba5987c7dadfe3ddc5012104d3e2be91beaf78e78458285e87d6d21cd84a20d')

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
  cp -a "$pkgname-$pkgver@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"

  mkdir -p "$pkgdir/usr/lib/systemd/user"
  cp -a "$pkgname-$pkgver-user.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"

  mkdir -p "$pkgdir/usr/share/licenses"
  cp -a "$release_name/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
