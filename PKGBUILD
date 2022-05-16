pkgname=monitorfs
pkgdesc="Monitor filesystem, Do something on some filesystem event"
pkgver=v0.0.1.r2.g9b4417c
pkgrel=1
arch=('x86_64' 'aarch64')
url=https://github.com/vcup/MonitorFileSystem
license=('GPL3')
makedepends=('git')
source=(
  'git+https://github.com/vcup/MonitorFileSystem'
  'https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh'
)
sha256sums=(
  'SKIP'
  '760596d2e182e0edf05f4a10bd0fa266086d700fdd96438d2663f28e538912e3'
)

pkgver() {
  cd "${srcdir}/MonitorFileSystem"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare(){
  [[ -d "${srcdir}/dotnet-sdk" ]] && rm -rf "${srcdir}/dotnet-sdk"
  bash "${srcdir}/dotnet-install.sh" --install-dir "${srcdir}/dotnet-sdk" --channel Current --no-path
}
check(){
  cd "${srcdir}/MonitorFileSystem"
  PATH="${srcdir}/dotnet-sdk:${PATH}"
  dotnet test ./tests/MonitorFileSystem.Tests/MonitorFileSystem.Tests.csproj -c "Release"
}
build(){
  cd "${srcdir}/MonitorFileSystem"
  PATH="${srcdir}/dotnet-sdk:${PATH}"
  dotnet restore ./MonitorFileSystem.sln
  dotnet build ./src/MonitorFileSystem/MonitorFileSystem.csproj -c "Release"
  dotnet publish ./src/MonitorFileSystem/MonitorFileSystem.csproj -c "Release" \
    --nologo --output ./service-out

  dotnet build ./src/MonitorFileSystem.Client/MonitorFileSystem.Client.csproj -c "Release"
  dotnet publish ./src/MonitorFileSystem.Client/MonitorFileSystem.Client.csproj -c "Release" \
    --nologo --output ./client-out
}
package(){
  mkdir -p "${pkgdir}/opt/monitorfs"
  mkdir -p "${pkgdir}/opt/monitorfsc"
  mkdir -p "${pkgdir}/usr/bin"
  cd "${srcdir}/MonitorFileSystem/service-out"
  cp -a * "${pkgdir}/opt/monitorfs"
  cd "${srcdir}/MonitorFileSystem/client-out"
  cp -a * "${pkgdir}/opt/monitorfsc"

  ln -sf /opt/monitorfs/MonitorFileSystem "${pkgdir}/usr/bin/monitorfs"
  ln -sf /opt/monitorfsc/MonitorFileSystem.Client "${pkgdir}/usr/bin/monitorfsc"
}
