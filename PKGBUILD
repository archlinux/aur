# Maintainer: seiuneko <chfsefefgesfen foxmail>

_pkgname=bilibilitool-dotnet
pkgname=${_pkgname}-git
pkgver=1.0.15.r0.gd23e87e
pkgrel=2
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
            'ca3726e76573747bceddf0267a04141b14c2dfa8b353b46a49bb932e620e7c64'
            '818ed53d54e57c4021fd5078212fe7199414b49b4c097fcb2f3631560d77fd35'
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
    --no-restore
}

package() {
  install -Dm644 bilibilitool-dotnet.service "${pkgdir}/usr/lib/systemd/system/bilibilitool-dotnet.service"
  install -Dm644 bilibilitool-dotnet.timer "${pkgdir}/usr/lib/systemd/system/bilibilitool-dotnet.timer"

  cd ${_pkgname}/src/Ray.BiliBiliTool.Console
  install -dm755 ${pkgdir}/usr/{bin,lib} "${pkgdir}/etc/${_pkgname}"
  dotnet publish \
  --runtime linux-x64 \
  --self-contained false \
  --no-restore \
  -o "${pkgdir}/usr/lib/${_pkgname}"
  ln -s "/usr/lib/${_pkgname}/Ray.BiliBiliTool.Console" "${pkgdir}/usr/bin/${_pkgname}"

  cd ../..
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/usr/lib/${_pkgname}/appsettings.json" "${pkgdir}/etc/${_pkgname}/appsettings.json"
}

