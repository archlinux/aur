# Maintainer: seiuneko <chfsefefgesfen foxmail>

_pkgname=bilibilitool-dotnet
pkgname=${_pkgname}-git
pkgver=1.0.14.r1.ga9cd3f0
pkgrel=1
pkgdesc="A cross-platform Bilibili daily task tool written in .Net 5"
arch=('x86_64')
url='https://github.com/RayWangQvQ/BiliBiliTool'
license=("MIT")
depends=("dotnet-runtime>=5.0.0" "aspnet-runtime>=5.0.0" "gcc-libs")
makedepends=("dotnet-sdk>=5.0.0" "git")
source=("${_pkgname}::git+https://github.com/RayWangQvQ/BiliBiliTool.git"
        "change-default-configuration-path.patch"
        "${_pkgname}.service"
        "${_pkgname}.timer"
        "bilitool-get-cookie-for-ff")
install="${pkgname}.install"
backup=("etc/${_pkgname}/appsettings.json")
sha256sums=('SKIP'
            '706da4f4901361e67c4f31b6302220072a5f5989ad1bfafbb35dfbd3db34e4a9'
            '81283e4c542f4bcb9b8fcabc9324574e8553fed68738d32836b95bf5b8db44d4'
            '2b4f3621c10194156e0127e07367a2adc3dcc2a90dee5a9ca145931da8ec8d30'
            '55c10b3ff54139395bde101db58d1e31879b72cc50cbbf785280e20e8df17bc0')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "${_pkgname}"
  mkdir -p ${srcdir}/nuget

  patch -p1 -i ../change-default-configuration-path.patch

  NUGET_PACKAGES=${srcdir}/nuget/packages \
  NUGET_HTTP_CACHE_PATH=${srcdir}/nuget/v3-cache \
  NUGET_PLUGINS_CACHE_PATH=${srcdir}/nuget/plugins-cache \
  dotnet restore \
  --runtime linux-x64 \
  --verbosity normal
}

build() {
  cd "${_pkgname}"
  export MSBUILDDISABLENODEREUSE=1

  dotnet build \
    --configuration Release \
    --no-restore \

  cd ./src/Ray.BiliBiliTool.Console
  dotnet publish \
  --runtime linux-x64 \
  --self-contained false \
  --no-restore \
  -o ../../linux-x64
}

package() {
  install -Dm644 bilibilitool-dotnet.service "${pkgdir}/usr/lib/systemd/system/bilibilitool-dotnet.service"
  install -Dm644 bilibilitool-dotnet.timer "${pkgdir}/usr/lib/systemd/system/bilibilitool-dotnet.timer"

  cd "${_pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -dm755 ${pkgdir}/usr/{bin,lib} "${pkgdir}/etc/${_pkgname}"
  cp -a linux-x64 "${pkgdir}/usr/lib/${_pkgname}"
  ln -s "/usr/lib/${_pkgname}/Ray.BiliBiliTool.Console" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${pkgdir}/usr/lib/${_pkgname}/appsettings.json" "${pkgdir}/etc/${_pkgname}/appsettings.json"
}

