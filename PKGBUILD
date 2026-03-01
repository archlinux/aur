# Maintainer: cgar <notify-cgar -AT- outlook -DOT- com>

pkgname='discord-chat-exporter-plus-cli'
_apkgname='DiscordChatExporter'
_gpkgname='DiscordChatExporterPlus'
_sdk='10.0'
pkgver=2.47
pkgrel=1

pkgdesc='Exports Discord chat logs to a file (without the political bloat)'
url="https://github.com/nulldg/$_gpkgname"
license=(MIT)
arch=(any)
conflicts=('discord-chat-exporter-cli')

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "$pkgname"
)
b2sums=(
  9f9f3874b7b970836753d25558f1628f5650ce23c96e181910154ec6857a461cf14262a1db28b2e6161bd081800566c434a7f85f99462504c04c30f11ba21211
  f04af622af8aee1c08beb6444aa7e46db9c55180a7cd87f0fceb2dce9d27052883be6322074a8944ff51af142e8d104d5ae89c2b54e79700769d1dabc38328e0
)

options=('!strip')

depends=("dotnet-runtime-$_sdk")
makedepends=("dotnet-sdk-$_sdk")

build() {
  cd "$_gpkgname-$pkgver"
  dotnet publish "$_apkgname.Cli" --configuration "Release"
}

package() {
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  cd "$_gpkgname-$pkgver"
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/License.txt"

  cd "$_apkgname.Cli/bin/Release/net$_sdk/linux-x64/publish"
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/lib/$pkgname/{}" \;
}
