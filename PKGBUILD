pkgname=powershell-bin
_pkgname=${pkgname%-bin}
pkgver=7.6.7
pkgrel=1
pkgdesc="A cross-platform automation and configuration tool/framework (binary package)"
arch=(x86_64 armv7h aarch64)
url="https://github.com/Powershell/Powershell"
license=(MIT)
depends=(
  gcc-libs
  glibc
)
optdepends=('lttng-ust2.12: CoreCLR tracing')
provides=(powershell)
conflicts=(powershell)
install=powershell.install
_archive="$pkgname-$pkgver-$pkgrel"
_artifact="$_archive.tar.gz"
source_armv7h=("$_artifact::$url/releases/download/v$pkgver/powershell-$pkgver-linux-arm32.tar.gz")
source_aarch64=("$_artifact::$url/releases/download/v$pkgver/powershell-$pkgver-linux-arm64.tar.gz")
source_x86_64=("$_artifact::$url/releases/download/v$pkgver/powershell-$pkgver-linux-x64.tar.gz")
noextract=("$_artifact")
sha256sums_armv7h=('6C056A2104273C834DA2E383960FFA850520F3E760BADA5AF43F7CE8A64146D2')
sha256sums_aarch64=('BA465EFDFB0984C1C5DC5ED9EB0B79A7E91A1B52C45F99377058C0659B84D3F1')
sha256sums_x86_64=('6896F9E3A6B0A354BF470835A96DA76D2F801CD50DCF047AD7C4563BF93BF431')

prepare() {
  mkdir -p "$_archive"
  tar -xf $_artifact -C "$_archive"
}

package() {
  cd "$_archive"

  local pkgnum=${pkgver:0:1}

  install -dm755 "$pkgdir/usr/lib/$_pkgname-$pkgnum"
  cp -a -t "$pkgdir/usr/lib/$_pkgname-$pkgnum" ./*
  # The pwsh executable is not executable in the archive, for some reason.
  chmod 755 "$pkgdir/usr/lib/$_pkgname-$pkgnum/pwsh"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname-$pkgnum/pwsh" "$pkgdir/usr/bin/pwsh"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
