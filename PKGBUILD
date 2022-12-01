# Maintainer: seiuneko <chfsefefgesfen foxmail>

_pkgname=bilibilitoolpro
pkgname=${_pkgname}-git
pkgver=0.2.3.r7.gcc45c4f
pkgrel=1
pkgdesc="A cross-platform Bilibili daily task tool written in .Net 5"
arch=('x86_64')
url='https://github.com/RayWangQvQ/BiliBiliToolPro'
license=("MIT")
depends=("dotnet-runtime-6.0" "aspnet-runtime-6.0")
makedepends=("dotnet-sdk-6.0" "git")
source=("${_pkgname}::git+https://github.com/RayWangQvQ/BiliBiliToolPro.git"
        "change-default-configuration-path.patch"
        "disable-log-to-file.patch"
        "${_pkgname}.service"
        "${_pkgname}.timer")
backup=("etc/${_pkgname}/appsettings.json")
sha256sums=('SKIP'
            '7ff40a76980240d22d0eef3dd339b7739fbff80c6027f9459b5d88a096b6aa03'
            '60df0b33087bf22517abb3f076259cf1e1e76c68b941288ef6f4b07b25ed091b'
            'c841c935fd13bb001224177926cd2c9d88e6d7066f58ea12eb962e05adc7790d'
            '2b4f3621c10194156e0127e07367a2adc3dcc2a90dee5a9ca145931da8ec8d30')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "${_pkgname}"
  mkdir -p ${srcdir}/nuget

  patch -p1 -i ../change-default-configuration-path.patch
  patch -p1 -i ../disable-log-to-file.patch

  NUGET_PACKAGES=${srcdir}/nuget/packages \
  NUGET_HTTP_CACHE_PATH=${srcdir}/nuget/v3-cache \
  NUGET_PLUGINS_CACHE_PATH=${srcdir}/nuget/plugins-cache \
  dotnet restore \
      --runtime linux-x64
}

build() {
  cd "${_pkgname}/src/Ray.BiliBiliTool.Console"

  dotnet publish \
      --configuration Release \
      --runtime linux-x64 \
      --no-self-contained \
      --no-restore \
      -p:DebugType=None \
      -p:DebugSymbols=false \
      --output "../../bin"
}

package() {
  install -Dm644 ${_pkgname}.service "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 ${_pkgname}.timer "${pkgdir}/usr/lib/systemd/system/${_pkgname}.timer"

  cd "${_pkgname}"
  install -dm755 ${pkgdir}/usr/{bin,lib/${_pkgname}} "${pkgdir}/etc/${_pkgname}"
  cp -a bin/* "${pkgdir}/usr/lib/${_pkgname}"
  ln -s "../lib/${_pkgname}/Ray.BiliBiliTool.Console" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${pkgdir}/usr/lib/${_pkgname}/appsettings.json" "${pkgdir}/etc/${_pkgname}/appsettings.json"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

