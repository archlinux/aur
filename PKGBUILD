# Maintainer: BarbUk <julien.virey@gmail.com>

pkgname=rackpeek
pkgver=0.0.3
pkgrel=1
pkgdesc='CLI tool to discover, manage, and document your IT infrastructure and home lab.'
arch=(x86_64 aarch64)
url='https://github.com/Timmoth/RackPeek'
license=('AGPL-3.0-or-later')
depends=(glibc libgcc libstdc++)
options=(!strip)
source=(
  $pkgname.install
  "$pkgname-$pkgver.tar.gz::$url/archive/${url##*/}-$pkgver.tar.gz"
)
sha256sums=('a8b0762ddaa8b90f0ae195f778b61fcf1293dcc969c34f86894719952ed27b01'
            'd28a1401fa35c2d0de5ab0e3d267f61b4c84912de269ef8fad1ad8ffe4cfa460')
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
