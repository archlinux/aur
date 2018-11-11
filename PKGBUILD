# Contributor: JC FRANCOIS <jc.francois.gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=craftbukkit-spigot
pkgver=1.12.2.20181110
_pkgver=1.12.2
# Specify BuildTools version explicitly (instead of using
# 'lastSuccessfulBuild') to let makepkg detect when needs to download an update
_buildtoolver=81
pkgrel=1
pkgdesc="CraftBukkit & Spigot Minecraft servers"
arch=(any)
url="http://www.spigotmc.org/"
license=("GPL3")
depends=("java-runtime-headless<=10" fontconfig)
makedepends=(git)
optdepends=("mcrcon: Notify users before shutdown and consistent backups")
conflicts=(bukkit craftbukkit craftbukkit-stable)
provides=("craftbukkit=${_pkgver}" "minecraft-server=${_pkgver}")
install=craftbukkit-spigot.install
noextract=("BuildTools-${_buildtoolver}.jar")
source=("BuildTools-${_buildtoolver}.jar::https://hub.spigotmc.org/jenkins/job/BuildTools/${_buildtoolver}/artifact/target/BuildTools.jar"
        "minecraft.service"
        "craftbukkit.service"
        "spigot.service"
        "craftbukkit-mcrcon.sh"
        "craftbukkit-save.sh"
        "backup.sh"
        "init-rcon.sh"
        "notify-shutdown.sh"
        "start_server.sh"
        "readme.md"
        "sysusers.conf")
sha256sums=('9cee19aed800f7d5f14ed60bcd271e74d6a5269ad32ffe1809ba6e793e5ffb31'
            '5859dea11a273f1dd5b559a753c3bb2668e5b5b6d035f4d4c9a1025adcbf12e0'
            '0bc6e5f367fdf61ebc5cf3261c0f2bdfce39ef9c101dec67a6fafd59ea4e43aa'
            '6d6be0a6f067daf24a8edb75b74aa5fed114aeb49405808f73205bee8d41932c'
            'b61231aabdb40efc21afbe5ed182cdfe01c78a55f19ac0e506e721992f967161'
            'a42b86ab0c5562bd04a49b3c022e57b62dc81c56960fa48841b169285b30a7cb'
            '2b758beb056019daa92caf19a9d35f33ab2c90b4f422e5ab4f0791c72a3f7ed0'
            '2bec4ae313392326cf53c874557f94ff8060ddeb3de50d96c5a0cc0be2b2fb36'
            '9ef47ee95df1b4c3ef8852083b1be13ab197a9b4a05f3a24416d3f2ee0584fe3'
            '8252abe18ae5aac364bd210a9dd598ead0e3f81c67b6680a9c25b464c43d0465'
            '786d4cd9bb96a1a720ac43ffaf4c717e614ed40714c037d8600a4274f989a3ef'
            'c30b180e2e571d1f052df0b82c51f261bc4e48dbaf8806c5bc897c07e939f575')

pkgver() {
  # BuildTools downloads updates from multiple git repositories, so we include
  # the current date in the version.
  date "+${_pkgver}.%Y%m%d"
}

build() {
  MAVEN_OPTS="-Dmaven.repo.local=$srcdir/m2/repository" \
      java -jar "BuildTools-${_buildtoolver}.jar" --rev "$_pkgver"
}

package() {
  install -Dm755 "$srcdir/craftbukkit-mcrcon.sh" "$pkgdir/usr/bin/craftbukkit-mcrcon"
  install -Dm755 "$srcdir/craftbukkit-save.sh" "$pkgdir/usr/bin/craftbukkit-save"

  install -Dm644 "$srcdir/craftbukkit-${_pkgver}.jar" "$pkgdir/usr/share/java/$pkgname/craftbukkit.jar"
  install -Dm644 "$srcdir/spigot-${_pkgver}.jar" "$pkgdir/usr/share/java/$pkgname/spigot.jar"
  install -Dm644 "$srcdir/work/minecraft_server.${_pkgver}.jar" "$pkgdir/usr/share/java/$pkgname/minecraft.jar"

  install -Dm755 "$srcdir/init-rcon.sh" "$pkgdir/usr/share/$pkgname/init-rcon.sh"
  install -Dm755 "$srcdir/start_server.sh" "$pkgdir/usr/share/$pkgname/start_server.sh"
  install -Dm755 "$srcdir/notify-shutdown.sh" "$pkgdir/usr/share/$pkgname/notify-shutdown.sh"

  install -Dm755 "$srcdir/backup.sh" "$pkgdir/usr/share/doc/$pkgname/backup.sh"
  install -Dm644 "$srcdir/readme.md" "$pkgdir/usr/share/doc/$pkgname/readme.md"

  install -Dm644 "$srcdir/minecraft.service" "$pkgdir/usr/lib/systemd/system/minecraft.service"
  install -Dm644 "$srcdir/craftbukkit.service" "$pkgdir/usr/lib/systemd/system/craftbukkit.service"
  install -Dm644 "$srcdir/spigot.service" "$pkgdir/usr/lib/systemd/system/spigot.service"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}
