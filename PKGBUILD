# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=taskcore
pkgver=1.0.0beta
_pkgver=1.0.0-beta
pkgrel=1
pkgdesc='Command Line ToDo Management Application'
arch=('x86_64')
url='https://github.com/tarikguney/taskcore'
license=("APACHE")
makedepends=("dotnet-sdk")
options=("staticlibs")
source=("${url}/archive/v${_pkgver}.tar.gz"
        "${url}/commit/37c47a92.patch")
sha256sums=("bdef7b73997e3689d8a340dbc42317e968478e6a74fc348985862ad28481b2e3"
            "d8b563596998d8b2f93e1fc40dfd74d80d6cf2566d56a1c69f7aab2d88a10517")

prepare() {
  patch -d "${pkgname}-${_pkgver}" -p1 -i ../37c47a92.patch # Set DB path in local AppData
}

build() {
  cd "${pkgname}-${_pkgver}/TaskCore.App"
  MSBUILDDISABLENODEREUSE=1 dotnet publish \
    --configuration Release \
    --self-contained true \
    --runtime linux-x64 \
    -p:PublishTrimmed=true \
    --output ../${pkgname} \
    ./TaskCore.App.csproj
}

package() {
  cd "${pkgname}-${_pkgver}"
  install -d $pkgdir/usr/{bin,lib}
  cp -r ${pkgname} "$pkgdir/usr/lib/"
  ln -s "/usr/lib/${pkgname}/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
