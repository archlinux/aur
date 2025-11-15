# Maintainer: Karl Essinger <xkaess22@gmail.com>
pkgname=scpdiscord
pkgver=3.3.1
pkgrel=1
pkgdesc="A very customisable Discord bot + SCP:SL plugin combo."
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
conflicts=(
  "scpdiscord-git"
)
install=scpdiscord.install
source=("git+${url}.git#tag=${pkgver}")
sha512sums=("SKIP")
#validpgpkeys=()
backup=(etc/scpdiscord/config.yml)

_srcdir="SCPDiscord"

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
