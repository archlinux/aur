# Maintainer: Karl Essinger <xkaess22@gmail.com>
pkgname=supportboi
pkgver=4.0.1
pkgrel=1
pkgdesc="A support ticket Discord bot with automated interviews and rendered HTML transcripts"
arch=("x86_64")
url="https://github.com/KarlOfDuty/SupportBoi"
license=('GPL-3.0-or-later')
options=('!debug' '!strip')
depends=(
  "dotnet-runtime-9.0"
  "mysql"
)
makedepends=(
  "dotnet-sdk-9.0"
)
conflicts=(
  "supportboi-git"
)
install=supportboi.install
source=("git+${url}.git#tag=${pkgver}")
sha512sums=("SKIP")
#validpgpkeys=()
backup=(etc/supportboi/config.yml)

_srcdir="SupportBoi"

prepare() {
  cd "$_srcdir"
  dotnet restore
}

build() {
  cd "$_srcdir"
  dotnet publish SupportBoi.csproj -p:PublishSingleFile=true -r linux-x64 -c Release --self-contained false --output out
}

package() {
  cd "$_srcdir"

  install -d "${pkgdir}/usr/bin/"
  install -Dm 755 out/supportboi "${pkgdir}/usr/bin/"

  install -d "${pkgdir}/usr/lib/systemd/system/"
  install -Dm 644 packaging/supportboi.service "${pkgdir}/usr/lib/systemd/system/"

  install -d "${pkgdir}/etc/supportboi/"
  install -Dm 600 default_config.yml "${pkgdir}/etc/supportboi/config.yml"

  install -d "${pkgdir}/usr/lib/sysusers.d/"
  install -Dm 644 "packaging/supportboi.sysusers" "${pkgdir}/usr/lib/sysusers.d/supportboi.conf"

  install -d "${pkgdir}/usr/lib/tmpfiles.d/"
  install -Dm 644 "packaging/supportboi.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/supportboi.conf"
}
