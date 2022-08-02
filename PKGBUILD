pkgname=monitorfs
pkgdesc="Monitor filesystem, Do something on some filesystem event"
pkgver=v0.0.3.r2.ge34dfd8
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
  '4147ff176c9fbbc22452244c5f8da66cd8b5028decdeda36c54eae95d49e3b34'
)

pkgver() {
  cd "${srcdir}/MonitorFileSystem"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare(){
  [[ -d "${srcdir}/dotnet-sdk" ]] && rm -rf "${srcdir}/dotnet-sdk"
  bash "${srcdir}/dotnet-install.sh" --install-dir "${srcdir}/dotnet-sdk" --channel Current --no-path
  cd "${srcdir}/MonitorFileSystem"
  git submodule update --init --recursive
}
check(){
  cd "${srcdir}/MonitorFileSystem"
  PATH="${srcdir}/dotnet-sdk:${PATH}"
  dotnet test ./tests/MonitorFileSystem.Tests/MonitorFileSystem.Tests.csproj -c "Release" --nologo
}
build(){
  cd "${srcdir}/MonitorFileSystem"
  PATH="${srcdir}/dotnet-sdk:${PATH}"
  dotnet restore ./MonitorFileSystem.sln
  dotnet publish ./src/MonitorFileSystem/MonitorFileSystem.csproj -c "Release" \
    --nologo --force --output ./service-out

  dotnet publish ./src/MonitorFileSystem.Client/MonitorFileSystem.Client.csproj -c "Release" \
    --nologo --force --output ./client-out
}
package(){
  mkdir -p "${pkgdir}/opt/monitorfs"
  mkdir -p "${pkgdir}/opt/monitorfsc"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/etc/monitorfs"
  mkdir -p "${pkgdir}/etc/monitorfsc"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"

  cd "${srcdir}/MonitorFileSystem/service-out"
  cp -a * "${pkgdir}/opt/monitorfs"
  cd "${srcdir}/MonitorFileSystem/client-out"
  cp -a * "${pkgdir}/opt/monitorfsc"

  cd "${srcdir}/MonitorFileSystem/systemd"
  cp -a * "${pkgdir}/usr/lib/systemd/system"

  ln -sf /opt/monitorfs/MonitorFileSystem "${pkgdir}/usr/bin/monitorfs"
  ln -sf /opt/monitorfsc/MonitorFileSystem.Client "${pkgdir}/usr/bin/monitorfsc"
}
