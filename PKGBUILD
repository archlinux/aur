# Maintainer: Jonghyo Lee <na1307@outlook.kr>
pkgname=dotup
pkgver=0.0
pkgrel=1
pkgdesc="A .NET version manager"
arch=('x86_64')
url="https://github.com/na1307/dotup"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib' 'openssl' 'krb5' 'libunwind')
makedepends=('dotnet-sdk-10.0' 'clang')
checkdepends=('dotnet-sdk-10.0')
provides=()
conflicts=()
source=("https://github.com/na1307/dotup/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3ae533f1379277a25417dd474cc2f6a5abfb6fd5c7881d9300a94adbdea5da6f')

prepare() {
  cd "$srcdir/dotup-$pkgver"
  dotnet restore
}

build() {
  cd "$srcdir/dotup-$pkgver"

  # Publish with Native AOT
  # Note: TargetFramework is net10.0 as per csproj
  dotnet publish dotup/dotup.csproj \
    --no-restore \
    --configuration Release \
    --runtime linux-x64 \
    -p:Platform=x64 \
    -p:PublishAot=true \
    --output publish
}

check() {
  cd "$srcdir/dotup-$pkgver"
  dotnet test
}

package() {
  cd "$srcdir/dotup-$pkgver"

  # Install binary
  install -Dm755 publish/dotup "$pkgdir/usr/bin/dotup"

  # Install profile script
  install -Dm755 dotup.sh "$pkgdir/etc/profile.d/dotup.sh"

  # Install License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
