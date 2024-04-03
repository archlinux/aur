# Maintainer: D3SOX <d3sox at protonmail dot com>

_reponame=Swig
pkgname=swig-cli
pkgver=3.0.0
pkgrel=3
pkgdesc="An easy to use git config manager"
arch=(any)
url="https://github.com/AlexanderDotH/$_reponame"
license=(custom)
depends=(git xdg-utils)
makedepends=(dotnet-host dotnet-sdk)
options=(!strip !debug)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1ad9d2343c6d86012a8df1585b7796c7d244a9829b793609c3cb2b5d22092a5e')

prepare() {
  cd "$srcdir/$_reponame-$pkgver/Build"
  # modify build.sh to remove dotnet publish lines which do not contain linux
  sed -i '/linux/! s/^dotnet publish/#dotnet publish/' build.sh
  # add missing executable permission
  chmod +x build.sh
}

build() {
  cd "$srcdir/$_reponame-$pkgver/Build"
  # build, ignoring errors is required as of now
  ./build.sh || true
}

package() {
  cd "$srcdir/$_reponame-$pkgver"
  # install license
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # install binary
  install -Dm755 "Build/Swig/Linux/Swig.Console" "$pkgdir/usr/bin/swig-cli"
}
