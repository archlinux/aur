# Maintainer: Attila Fidan <archlinux-buildsystem@print0.net>
# Contributor: JianQing Liu <me at pegasis dot site>

pkgname="discord-chat-exporter-cli"
_apkgname="DiscordChatExporter"
pkgver=2.43.3
pkgrel=1
_dotnet_ver=8.0

pkgdesc="Exports Discord chat logs to a file (Command-line interface only)"
url="https://github.com/Tyrrrz/$_apkgname"
license=(MIT)
arch=(x86_64)

depends=(
  "dotnet-runtime-$_dotnet_ver"
  gcc-libs
  glibc
  sh
)
makedepends=(
  aspnet-runtime
  "dotnet-sdk-$_dotnet_ver"
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "$pkgname"
)
b2sums=('21d8e44d3b24caa77207452521f810ca96baac988163bd5bf53a89e519cb04be1c457bb25db473c041267b9a82c3e973fb57da0cb1da0aae559fa73a9849a205'
        '7540fb95f81c1041c87778c590a9438ffb64bf417c3d4d3f1363da5a25898c98f9dcd1209b9237bd595374a33326b7f23043bd6156cc7e14f0bff230ee0f6de6')

prepare() {
  cd "$_apkgname-$pkgver"

  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  dotnet restore --locked-mode "$_apkgname.Cli"
}

build() {
  mkdir -p "$srcdir/bin"
  cd "$_apkgname-$pkgver"

  # trimming is only relevant for self-contained builds
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  dotnet publish \
    --no-restore \
    --self-contained false \
    --configuration Release \
    --output "$srcdir/bin" \
    -p:PublishTrimmed=false \
    "$_apkgname.Cli"
}

package() {
  install -Dm644 "$_apkgname-$pkgver/License.txt" "$pkgdir/usr/share/licenses/$pkgname/License.txt"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  cd bin
  find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/lib/$pkgname/{}" \;
}
