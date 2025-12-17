# Maintainer: Jonghyo Lee <na1307@outlook.kr>
pkgname=dotup-git
pkgver=r3.60e891d
pkgrel=1
pkgdesc="A .NET version manager"
arch=('x86_64')
url="https://github.com/na1307/dotup"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib' 'openssl' 'krb5' 'libunwind')
makedepends=('dotnet-sdk-10.0' 'clang' 'git')
checkdepends=('dotnet-sdk-10.0')
provides=('dotup')
conflicts=('dotup')
source=("git+https://github.com/na1307/dotup.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/dotup"
  # Generate version based on git commits (r<count>.<hash>)
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/dotup"
  dotnet restore
}

build() {
  cd "$srcdir/dotup"

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
  cd "$srcdir/dotup"
  dotnet test
}

package() {
  cd "$srcdir/dotup"

  # Install binary
  install -Dm755 publish/dotup "$pkgdir/usr/bin/dotup"

  # Install profile script
  install -Dm755 dotup.sh "$pkgdir/etc/profile.d/dotup.sh"

  # Install License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
