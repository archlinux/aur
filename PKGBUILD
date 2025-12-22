pkgname=openssh-gui-git
_pkgname=OpenSSH-GUI
pkgver=2.2.1
pkgrel=1
pkgdesc="A GUI for OpenSSH configuration and management (GIT version)"
arch=('x86_64')
url="https://github.com/frequency403/OpenSSH-GUI"
license=('MIT')
depends=('dotnet-runtime-9.0')
makedepends=('git' 'dotnet-sdk-9.0')
provides=('openssh-gui')
conflicts=('openssh-gui' 'openssh-gui-bin')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "${_pkgname}"
  dotnet publish OpenSSH_GUI/OpenSSH_GUI.csproj \
    --configuration Release \
    --runtime linux-x64 \
    --output "publish" \
    -p:PublishSingleFile=true \
    -p:PublishReadyToRun=true \
    -p:IncludeNativeLibrariesForSelfExtract=true \
    --self-contained true
}

package() {
  cd "${_pkgname}"
  install -Dm755 "publish/OpenSSH_GUI" "${pkgdir}/usr/bin/openssh-gui"
  install -Dm644 "OpenSSH_GUI/Assets/appicon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openssh-gui.png"
  install -Dm644 "openssh-gui.desktop" "${pkgdir}/usr/share/applications/openssh-gui.desktop"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
