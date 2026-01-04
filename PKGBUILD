# Maintainer: Karl Essinger <xkaess22@gmail.com>
pkgname=roleboi
pkgver=1.0.0
pkgrel=1
pkgdesc="A small role management Discord bot."
arch=("x86_64")
url="https://github.com/KarlOfDuty/RoleBoi"
license=('GPL-3.0-or-later')
options=('!debug' '!strip')
#depends=()
makedepends=(
  "dotnet-sdk-9.0"
)
conflicts=(
  "roleboi-git"
)
install=roleboi.install
source=("git+${url}.git#tag=${pkgver}")
sha512sums=("SKIP")
#validpgpkeys=()
backup=(etc/roleboi/config.yml)

_srcdir="RoleBoi"

prepare() {
  cd "$_srcdir"
  dotnet restore
}

build() {
  cd "$_srcdir"
  dotnet publish RoleBoi.csproj -r linux-x64 -c Release --output out
}

package() {
  cd "$_srcdir"

  install -d "${pkgdir}/usr/bin/"
  install -Dm 755 out/roleboi "${pkgdir}/usr/bin/"

  install -d "${pkgdir}/usr/lib/systemd/system/"
  install -Dm 644 packaging/roleboi.service "${pkgdir}/usr/lib/systemd/system/"

  install -d "${pkgdir}/etc/roleboi/"
  install -Dm 600 default_config.yml "${pkgdir}/etc/roleboi/config.yml"

  install -d "${pkgdir}/usr/lib/sysusers.d/"
  install -Dm 644 "packaging/roleboi.sysusers" "${pkgdir}/usr/lib/sysusers.d/roleboi.conf"

  install -d "${pkgdir}/usr/lib/tmpfiles.d/"
  install -Dm 644 "packaging/roleboi.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/roleboi.conf"
}
