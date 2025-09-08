# Maintainer: Karl Essinger <xkaess22@gmail.com>
pkgname=scpdiscord-git
pkgver=3.3.0.23.git7f896f8
pkgrel=1
pkgdesc="A very customisable Discord bot + SCP:SL plugin combo. Dev build."
arch=("x86_64")
url="https://github.com/KarlOfDuty/SCPDiscord"
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
  "scpdiscord"
)
#replaces=()
#backup=()
#options=()
install=scpdiscord.install
#changelog=
source=("git+${url}.git")
#noextract=()
sha512sums=("SKIP")
#validpgpkeys=()
backup=(etc/scpdiscord/config.yml)

_srcdir="SCPDiscord"

pkgver() {
  cd "$_srcdir"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/./g;s/g/git/' || echo "r$(git rev-list --count HEAD).git$(git rev-parse --short HEAD)"
}

build() {
  cd "$_srcdir"
  dotnet publish SCPDiscordBot/SCPDiscordBot.csproj -p:PublishSingleFile=true -r linux-x64 -c Release --self-contained false --output out
}

package() {
  cd "$_srcdir"

  install -d "${pkgdir}/usr/bin/"
  install -Dm 755 out/scpdiscord "${pkgdir}/usr/bin/"

  install -d "${pkgdir}/usr/lib/systemd/system/"
  install -Dm 644 packaging/scpdiscord@.service "${pkgdir}/usr/lib/systemd/system/"

  install -d "${pkgdir}/usr/share/scpdiscord/"
  install -Dm 644 SCPDiscordBot/default_config.yml "${pkgdir}/usr/share/scpdiscord/"

  install -d "${pkgdir}/usr/lib/sysusers.d/"
  install -Dm 644 "packaging/scpdiscord.sysusers" "${pkgdir}/usr/lib/sysusers.d/scpdiscord.conf"

  install -d "${pkgdir}/usr/lib/tmpfiles.d/"
  install -Dm 644 "packaging/scpdiscord.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/scpdiscord.conf"
}
