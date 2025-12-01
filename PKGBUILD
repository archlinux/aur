# Maintainer: BarbUk <julien.virey@gmail.com>

pkgname=cleanuparr
pkgver=2.4.7
_pkgver_qbittorrent=1.0.2
_pkgver_transmission=1.0.3
pkgrel=1
pkgdesc='Tool for automating the cleanup of unwanted or blocked files in Sonarr, Radarr, and supported download clients like qBittorrent, Deluge and Transmission.'
arch=(x86_64 aarch64)
url='https://cleanuparr.github.io/Cleanuparr'
license=('GPL-3.0-or-later')
groups=(servarr)
provides=(cleanuparr)
conflicts=(cleanuparr-bin)
options=(!debug !strip)
install=cleanuparr.install
depends=(
  gcc-libs
  glibc
)
makedepends=(dotnet-sdk-9.0 git)
source=(
  "git+https://github.com/${pkgname^}/${pkgname^}.git#tag=v${pkgver}"
  "git+https://github.com/${pkgname^}/qbittorrent-net-client.git"
  "git+https://github.com/${pkgname^}/Transmission.API.RPC.git"
  cleanuparr.service
  cleanuparr.sysusers
  cleanuparr.tmpfiles
  cleanuparr.install
)
sha256sums=('42fe0663308fded0fea91054ed9cfd3086feda92fc52fce212d7afd27a8e010e'
            'SKIP'
            'SKIP'
            'e64633347d71185ef886314a74881f81ea70cbb896f285547dfd7739ecbe0188'
            '4606d163398bbfa37f8f6b8967c0bee7c950823f766983699194828f0f8b008e'
            '9a16872bfaeb80898641efc70a92a559c49f3893b792b2ce9be9a4cf7143dbe4'
            '19f295bd0b4d3bb046a4e1bef2808277cdf033297aace97b9e719eec4d2c045e')

case ${CARCH} in
  x86_64) _CARCH='x64' ;;
  aarch64) _CARCH='arm64' ;;
esac

_framework='net9.0'
_runtime="linux-${_CARCH}"
_artifacts="${pkgname^}/artifacts/$pkgname-$pkgver-linux-$_CARCH"

build() {
  export DOTNET_CLI_TELEMETRY_OPTOUT=1

  # We need to add a local nuget source to store QBittorrent and Transmission dependencies
  dotnet nuget add source --name "$pkgname-$pkgver" "$srcdir"

  # Build and publish Transmission.API.RPC
  dotnet publish Transmission.API.RPC --configuration Release --runtime linux-"$_CARCH" \
    /p:DebugSymbols=false /p:Version="$_pkgver_transmission"
  dotnet pack Transmission.API.RPC
  dotnet nuget push Transmission.API.RPC/Transmission.API.RPC/bin/Release/FLM.Transmission.$_pkgver_transmission.nupkg --source "$srcdir"

  # Build and publish qbittorrent-net-client
  dotnet publish qbittorrent-net-client/src/QBittorrent.Client/QBittorrent.Client.csproj --configuration Release --runtime linux-"$_CARCH" \
    /p:DebugSymbols=false /p:Version="$_pkgver_qbittorrent"
  dotnet nuget push qbittorrent-net-client/src/QBittorrent.Client/bin/Release/FLM.QBittorrent.$_pkgver_qbittorrent.nupkg --source "$srcdir"

  # Build and publish Cleanuparr
  dotnet publish ${pkgname^}/code/backend/${pkgname^}.Api/${pkgname^}.Api.csproj \
    --framework ${_framework} \
    --no-self-contained \
    --configuration Release \
    --runtime linux-$_CARCH \
    -o "$_artifacts" \
    /p:PublishSingleFile=true /p:Version=$pkgver /p:DebugSymbols=false \
    && dotnet build-server shutdown # Build servers do not terminate automatically

  # Clean nuget source
  dotnet nuget remove source "$pkgname-$pkgver"

  # Build frontend
  (
    cd ${pkgname^}/code/frontend
    export NG_CLI_ANALYTICS=false
    npm ci
    npm run build
  )

  mkdir -p "$_artifacts/wwwroot"
  cp -r ${pkgname^}/code/frontend/dist/ui/browser/* "$_artifacts/wwwroot/"
}

package() {
  install -dm755 "${pkgdir}/usr/lib/cleanuparr"

  # Systemd
  install -Dm644 cleanuparr.service "${pkgdir}/usr/lib/systemd/system/cleanuparr.service"
  install -Dm644 cleanuparr.sysusers "${pkgdir}/usr/lib/sysusers.d/cleanuparr.conf"
  install -Dm644 cleanuparr.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/cleanuparr.conf"

  # Copy Cleanuparr
  cp -dr "$_artifacts"/* "${pkgdir}/usr/lib/$pkgname/"
}
