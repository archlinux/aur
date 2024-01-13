# Maintainer: Fijxu <fijxu at nadeko dot net>

pkgname=cpp2il-dev-git
_pkgname=cpp2il-dev
pkgver=2022.1.0.pre.release.14.r0.gec789f4
pkgrel=1
pkgdesc="Work-in-progress tool to reverse unity's IL2CPP toolchain. (git version) (development branch)"
arch=('x86_64' 'aarch64')
url='https://github.com/SamboyCoding/Cpp2IL/tree/development'
license=('MIT')
depends=('dotnet-runtime-7.0')
makedepends=('git' 'dotnet-host' 'dotnet-sdk')
source=("$_pkgname::git+https://github.com/SamboyCoding/Cpp2IL.git#branch=development")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname/Cpp2IL
  dotnet restore
  dotnet build Cpp2IL.csproj -c Release -r linux-x64 --no-self-contained
}

package() {
  cd $_pkgname
  install -dm 755 "$pkgdir/usr/bin"

  # Thanks to blackarch Cpp2Il package
  cat > "$pkgdir/usr/bin/$_pkgname" << EOF
#!/bin/sh
exec /usr/share/$_pkgname/Cpp2IL "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$_pkgname"

  install -dm 755 "$pkgdir/usr/share/$_pkgname"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$_pkgname/" *.md

  cp -a --no-preserve=ownership ./Cpp2IL/bin/Release/net7.0/linux-x64/* "$pkgdir/usr/share/$_pkgname/"
}
