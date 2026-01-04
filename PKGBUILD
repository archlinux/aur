# Maintainer: Karl Essinger <xkaess22@gmail.com>
pkgname=roleboi-git
pkgver=1.0.0.0.gitd7fc570
pkgrel=1
pkgdesc="A small role management Discord bot. Dev build."
arch=("x86_64")
url="https://github.com/KarlOfDuty/RoleBoi"
license=('GPL-3.0-or-later')
options=('!debug' '!strip')
depends=(
  "dotnet-runtime-9.0"
)
makedepends=(
  "dotnet-sdk-9.0"
)
#checkdepends=()
#optdepends=()
#provides=()
conflicts=(
  "roleboi"
)
#replaces=()
#backup=()
#options=()
install=roleboi.install
#changelog=
source=("git+${url}.git")
#noextract=()
sha512sums=("SKIP")
#validpgpkeys=()
backup=(etc/roleboi/config.yml)

_srcdir="RoleBoi"

pkgver() {
  cd "$_srcdir"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/./g;s/g/git/' || echo "r$(git rev-list --count HEAD).git$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_srcdir"
  dotnet restore
}

build() {
  cd "$_srcdir"
  dotnet publish RoleBoi.csproj -p:PublishSingleFile=true -r linux-x64 -c Release --self-contained false --output out
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
