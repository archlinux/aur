# Maintainer: cgar <notify-cgar -AT- outlook -DOT- com>

pkgname='discord-chat-exporter-plus-cli'
_apkgname='DiscordChatExporter'
_gpkgname='DiscordChatExporterPlus'
pkgver=2.45
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
  881bbddea44be854d44319ba148c9f647482e77dd1872fa47090f4e67ea01ca6095775ceac062dec225ad0ae5da354392c230c255ebf6fa23b8534ff0827c650
  f04af622af8aee1c08beb6444aa7e46db9c55180a7cd87f0fceb2dce9d27052883be6322074a8944ff51af142e8d104d5ae89c2b54e79700769d1dabc38328e0
)

options=('!strip')

depends=('dotnet-runtime-9.0')
makedepends=('dotnet-sdk-9.0')

build() {
  cd "$_gpkgname-$pkgver"
  dotnet publish "$_apkgname.Cli" --configuration "Release"
}

package() {
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  cd "$_gpkgname-$pkgver"
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/License.txt"

  cd "$_apkgname.Cli/bin/Release/net9.0/linux-x64/publish"
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/lib/$pkgname/{}" \;
}
