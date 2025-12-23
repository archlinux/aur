# Maintainer: Oliver Schantz <frequency403@gmail.com>
pkgname=openssh-gui-git
pkgver=2.2.0
pkgrel=1
pkgdesc="A graphical user interface for OpenSSH (Development Branch)"
arch=('x86_64')
url="https://github.com/frequency403/OpenSSH-GUI" # Replace with your actual repo URL
license=('MIT')
depends=('icu' 'openssl' 'zlib' 'dotnet-runtime-9.0')
options=('!strip')
makedepends=('git' 'dotnet-sdk-9.0')
provides=('openssh-gui')
conflicts=('openssh-gui' 'openssh-gui-bin')
source=("${pkgname}::git+${url}.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  # Generates a version based on latest tag + commit count + rc suffix
  # Example output: 1.0.0.rc.r42.ga1b2c3d
  printf "1.0.0.rc.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  dotnet publish OpenSSH_GUI/OpenSSH_GUI.csproj \
    --configuration Release \
    --runtime linux-x64 \
    --output "./publish" \
    -p:PublishSingleFile=true \
    -p:PublishReadyToRun=true \
    -p:IncludeNativeLibrariesForSelfExtract=true \
    --self-contained false
}

package() {
  cd "${srcdir}/${pkgname}/publish"
  install -Dm755 "OpenSSH_GUI" "${pkgdir}/usr/bin/openssh-gui"
}
