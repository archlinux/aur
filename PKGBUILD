# Maintainer: Sultan <berkkapla82@proton.me>
pkgname=dcshowcase
pkgver=r9.a077ae0
pkgrel=1
pkgdesc="A high-performance, cross-platform tool to analyze your Discord Data Package"
arch=('x86_64')
url="https://github.com/compiledkernel-idk/dc-showcase"
license=('GPL3')
depends=('zlib' 'openssl' 'icu') # Runtime dependencies for .NET apps
makedepends=('dotnet-sdk' 'git')
provides=('dcshowcase')
conflicts=('dcshowcase')
source=("git+https://github.com/compiledkernel-idk/dc-showcase.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
  cd "$srcdir/dc-showcase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/dc-showcase/DiscordVoyagerCLI"
  # Restore dependencies
  dotnet restore
  # Build and publish self-contained
  dotnet publish -c Release -r linux-x64 --self-contained true -o "$srcdir/publish" /p:StripSymbols=true /p:PublishSingleFile=true
}

package() {
  # Install the binary
  install -Dm755 "$srcdir/publish/showcase" "$pkgdir/usr/bin/dcshowcase"

  # Install License
  install -Dm644 "$srcdir/dc-showcase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install README as doc (optional but good practice)
  install -Dm644 "$srcdir/dc-showcase/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
