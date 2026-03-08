# Maintainer: BarbUk <julien.virey@gmail.com>

pkgname=rackpeek
pkgver=1.3.0
pkgrel=1
pkgdesc='CLI tool to discover, manage, and document your IT infrastructure and home lab.'
arch=(x86_64 aarch64)
url='https://github.com/Timmoth/RackPeek'
license=('AGPL-3.0-or-later')
depends=(glibc libgcc libstdc++)
makedepends=(dotnet-sdk)
options=(!strip)
source=(
  $pkgname.install
  "$pkgname-$pkgver.tar.gz::$url/archive/${url##*/}-$pkgver.tar.gz"
)
sha256sums=('14cd89ed266911aff4d52d76bb976a4cb3ad602cbbc939785a72fd3e45cd4c01'
            '5addf6b4e04949d59d6a602675e6e6e224094970c855bbd2caab5e4d69be535e')
install=$pkgname.install

case ${CARCH} in
  x86_64) _CARCH='x64' ;;
  aarch64) _CARCH='arm64' ;;
esac

_framework='net10.0'
_runtime="linux-${_CARCH}"
_artifacts="artifacts/$pkgname-$pkgver-linux-$_CARCH"

build() {
  export DOTNET_CLI_TELEMETRY_OPTOUT=1

  mkdir -p artifacts

  # Build and publish Cleanuparr
  dotnet publish "${url##*/}-${url##*/}-$pkgver/${url##*/}/${url##*/}.csproj" \
    --framework ${_framework} \
    --self-contained \
    --configuration Release \
    --runtime linux-$_CARCH \
    -o "$_artifacts" \
    /p:PublishSingleFile=true /p:Version=$pkgver /p:DebugSymbols=false \
    && dotnet build-server shutdown # Build servers do not terminate automatically
}

package() {
  install -Dm755 "artifacts/$pkgname-$pkgver-linux-$_CARCH/${url##*/}" "${pkgdir}/usr/bin/$pkgname"
}
