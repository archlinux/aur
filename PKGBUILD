# Maintainer: seiuneko <chfsefefgesfen foxmail>

_pkgname=bilibilitoolpro
pkgname=${_pkgname}-git
pkgver=2.0.1.r0.g9c8739f
pkgrel=1
pkgdesc="A cross-platform Bilibili daily task tool written in .Net 5"
arch=('x86_64')
url='https://github.com/RayWangQvQ/BiliBiliToolPro'
license=("MIT")
depends=("dotnet-runtime" "aspnet-runtime")
makedepends=("dotnet-sdk" "git")
source=("${_pkgname}::git+https://github.com/RayWangQvQ/BiliBiliToolPro.git"
        "change-default-configuration-path.patch"
        "disable-log-to-file.patch"
        "${_pkgname}.service"
        "${_pkgname}.timer"
        "sysusers.d"
        "tmpfiles.d")
backup=("etc/${_pkgname}/appsettings.json")
sha256sums=('SKIP'
            '87ce39ab6d9882503c2f1af1b7df500c0b06d912609bb5681df4061d890aacfd'
            '60df0b33087bf22517abb3f076259cf1e1e76c68b941288ef6f4b07b25ed091b'
            '1c8eab441925d714ab3d9c85dea7c2c3eb01fbd550c83467a80da4567aa81117'
            '2b4f3621c10194156e0127e07367a2adc3dcc2a90dee5a9ca145931da8ec8d30'
            '92d9a55235d7933fa45d94a68bcf1ba2798d605799f12ffd9949c1150d9e884f'
            'c529fbcdf5750aae3c7ac8d5a38cd984f3e9d330cafc889c2c95ab6fe3ef91de')

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
  install -Dm644 tmpfiles.d "${pkgdir}/usr/lib/tmpfiles.d/bilibilitoolpro.conf"
  install -Dm644 sysusers.d "${pkgdir}/usr/lib/sysusers.d/bilibilitoolpro.conf"

  cd "${_pkgname}"
  install -dm755 ${pkgdir}/usr/{bin,lib/${_pkgname}} "${pkgdir}/etc/${_pkgname}"
  cp -a bin/* "${pkgdir}/usr/lib/${_pkgname}"
  ln -s "../lib/${_pkgname}/Ray.BiliBiliTool.Console" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${pkgdir}/usr/lib/${_pkgname}/appsettings.json" "${pkgdir}/etc/${_pkgname}/appsettings.json"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

