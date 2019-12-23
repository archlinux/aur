# Contributor: JC FRANCOIS <jc.francois.gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=craftbukkit-spigot
pkgver=1.15.1.2522
#### Minecraft version to build. Just change this to build a different branch.
#### Makepkg will automatically (unless --holdver is specified) select the most
#### recent Spigot version for this Minecraft version.
_pkgver=1.15.1
_build="$(echo "$pkgver" | awk -F \. '{print $4}')"
_build="${_build//_/-}"
# Specify BuildTools version explicitly (instead of using
# 'lastSuccessfulBuild') to let makepkg detect when needs to download an update
_buildtoolver=105
pkgrel=2
pkgdesc="CraftBukkit, Spigot, and vanilla Minecraft servers"
arch=(any)
url="https://www.spigotmc.org/"
license=("GPL3")
depends=("java-runtime-headless<=12" fontconfig)
makedepends=(git)
optdepends=("mcrcon: Notify users before shutdown and consistent backups")
conflicts=(bukkit craftbukkit craftbukkit-stable)
provides=("craftbukkit=${_pkgver}" "minecraft-server=${_pkgver}")
install=craftbukkit-spigot.install
noextract=("BuildTools-${_buildtoolver}.jar")
source=("BuildTools-${_buildtoolver}.jar::https://hub.spigotmc.org/jenkins/job/BuildTools/${_buildtoolver}/artifact/target/BuildTools.jar"
        "craftbukkit.service"
        "craftbukkit@.service"
        "craftbukkit-mcrcon.sh"
        "craftbukkit-save.sh"
        "backup.sh"
        "init-rcon.sh"
        "notify-shutdown.sh"
        "readme.md"
        "sysusers.conf")
sha256sums=('298de870cb5400a0618bf6bdc6eefab347f3f2169f026509fd8adae82832d31d'
            '4ad26fa4df8c8f83e51b74bb0db4d78641a41fbad7c5e285b41493a6fd3019ac'
            '75677d50e67eae3aa3dd402b672ef9db7f3e34b626231b10ac8dbf04af23d6e5'
            '16d2281874c953eb94141994d5a4c4c31b0b3f7d51652ebdad1f2367fdeaea8c'
            'a835b1c96a731694628b8d3950edfc4171c75f711ecd7feef91f3d9b9eac4a73'
            '2b758beb056019daa92caf19a9d35f33ab2c90b4f422e5ab4f0791c72a3f7ed0'
            '492c06eb11f26d3eff6742b88f2024be85eff05cf80d57a691cd3420ebdcb26c'
            '8e0e95065746d0309b60bb253879cd040b9adf76666830c28121c9610bb1e499'
            '04624c1188efb06e960503a4eec4f604114ff5ec11a63945e64ebfdb3b2c4dfb'
            'c30b180e2e571d1f052df0b82c51f261bc4e48dbaf8806c5bc897c07e939f575')

pkgver() {
  _build="$(curl "https://hub.spigotmc.org/versions/$_pkgver.json" 2> /dev/null | \
           grep '"name"' | sed 's/.*: "\([^"]*\)",/\1/')"
  # Force three version numbers. %d becomes 0 if too few arguments
  printf "%d.%d.%d." ${_pkgver//./ }
  echo "${_build//-/_}"
}

build() {
  MAVEN_OPTS="-Dmaven.repo.local=$srcdir/m2/repository" \
      java -jar "BuildTools-${_buildtoolver}.jar" --rev "$_build" --compile craftbukkit,spigot
}

package() {
  install -Dm755 "$srcdir/craftbukkit-mcrcon.sh" "$pkgdir/usr/bin/craftbukkit-mcrcon"
  install -Dm755 "$srcdir/craftbukkit-save.sh" "$pkgdir/usr/bin/craftbukkit-save"

  install -Dm644 "$srcdir/CraftBukkit/target"/craftbukkit*.jar "$pkgdir/usr/share/java/$pkgname/craftbukkit.jar"
  install -Dm644 "$srcdir/spigot-${_pkgver}.jar" "$pkgdir/usr/share/java/$pkgname/spigot.jar"
  install -Dm644 "$srcdir/work/minecraft_server.${_pkgver}.jar" "$pkgdir/usr/share/java/$pkgname/minecraft.jar"

  install -Dm755 "$srcdir/init-rcon.sh" "$pkgdir/usr/share/$pkgname/init-rcon.sh"
  install -Dm755 "$srcdir/notify-shutdown.sh" "$pkgdir/usr/share/$pkgname/notify-shutdown.sh"

  install -Dm755 "$srcdir/backup.sh" "$pkgdir/usr/share/doc/$pkgname/backup.sh"
  install -Dm644 "$srcdir/readme.md" "$pkgdir/usr/share/doc/$pkgname/readme.md"

  install -Dm644 "$srcdir/craftbukkit.service" "$pkgdir/usr/lib/systemd/system/minecraft.service"
  install -Dm644 "$srcdir/craftbukkit.service" "$pkgdir/usr/lib/systemd/system/craftbukkit.service"
  install -Dm644 "$srcdir/craftbukkit.service" "$pkgdir/usr/lib/systemd/system/spigot.service"
  install -Dm644 "$srcdir/craftbukkit@.service" "$pkgdir/usr/lib/systemd/system/minecraft@.service"
  install -Dm644 "$srcdir/craftbukkit@.service" "$pkgdir/usr/lib/systemd/system/craftbukkit@.service"
  install -Dm644 "$srcdir/craftbukkit@.service" "$pkgdir/usr/lib/systemd/system/spigot@.service"

  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  install -dm755 "$pkgdir/srv/craftbukkit/"
}
