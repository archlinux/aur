pkgname=monitorfs
pkgdesc="Monitor filesystem, Do something on some filesystem event"
pkgver=v0.0.4.r0.g90fe838
pkgrel=1
arch=('x86_64' 'aarch64')
url=https://github.com/vcup/MonitorFileSystem
license=('GPL3')
makedepends=('git' 'dotnet-sdk')
source=(
  'git+https://github.com/vcup/MonitorFileSystem'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/MonitorFileSystem"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare(){
  cd "${srcdir}/MonitorFileSystem"
  git submodule update --init --recursive
}
check(){
  cd "${srcdir}/MonitorFileSystem"
  dotnet test ./tests/MonitorFileSystem.Tests/MonitorFileSystem.Tests.csproj -c "Release" --nologo
}
build(){
  cd "${srcdir}/MonitorFileSystem"
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
