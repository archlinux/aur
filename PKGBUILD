# Contributor: JC FRANCOIS <jc.francois.gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=craftbukkit-spigot
pkgver=1.13.2.1969
_pkgver=1.13.2
_build="$(echo "$pkgver" | awk -F \. '{print $4}')"
_build="${_build//_/-}"
# Specify BuildTools version explicitly (instead of using
# 'lastSuccessfulBuild') to let makepkg detect when needs to download an update
_buildtoolver=85
pkgrel=1
pkgdesc="CraftBukkit & Spigot Minecraft servers"
arch=(any)
url="http://www.spigotmc.org/"
license=("GPL3")
depends=("java-runtime-headless<=11" fontconfig)
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
        "start_server.sh"
        "readme.md"
        "sysusers.conf")
sha256sums=('83746eea0bdd49f87daa9e6c72ed1b337cfc9239b00d5fad79af2e0da23622dc'
            'cf72cf4af41000c9d04d00722097e609b57cd57d12a7eb3fd8b90ed7f408f4fd'
            '58a675cf0bd3c514f9e65a67e5ef1d7c688a70d23afe4da5bfebea5e622b6b35'
            '16d2281874c953eb94141994d5a4c4c31b0b3f7d51652ebdad1f2367fdeaea8c'
            'ea0a2185d4e846ed964fac7b60ff2ef10a978cecce65604a5fb2e7ed42b612af'
            '2b758beb056019daa92caf19a9d35f33ab2c90b4f422e5ab4f0791c72a3f7ed0'
            '492c06eb11f26d3eff6742b88f2024be85eff05cf80d57a691cd3420ebdcb26c'
            '5f4d945f461d33d634f64ebbefd83a55cc0619afd829a726b00b27269f4b1520'
            'dea0b5e4a2a5331413463f71b51e3c681c98c10e0bbfa1beb16c14e24fd6ae13'
            'd111d53bf0ec0579f48afb2775181861d60d704a45a8acf4575fcd95106cd102'
            'c30b180e2e571d1f052df0b82c51f261bc4e48dbaf8806c5bc897c07e939f575')

pkgver() {
  _build="$(curl "https://hub.spigotmc.org/versions/$_pkgver.json" 2> /dev/null | \
           grep '"name"' | sed 's/.*: "\([^"]*\)",/\1/')"
  echo "$_pkgver.${_build//-/_}"
}

build() {
  cat > old_send_command.sh <<EOF
#!/bin/sh
REPL="/usr/bin/craftbukkit-mcrcon"
echo "This script is deprecated and will be removed." 2>&1
echo "Use \$REPL instead" 2>&1
echo
exec "\$REPL" "\$@"
EOF
  cat > old_backup.sh <<EOF
#!/bin/sh
REPL="/usr/share/doc/$pkgname/backup.sh"
echo "This script is deprecated and will be removed." 2>&1
echo "Use \$REPL instead" 2>&1
echo
exec "\$REPL" "\$@"
EOF
  MAVEN_OPTS="-Dmaven.repo.local=$srcdir/m2/repository" \
      java -jar "BuildTools-${_buildtoolver}.jar" --rev "$_build"
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

  install -Dm644 "$srcdir/craftbukkit.service" "$pkgdir/usr/lib/systemd/system/minecraft.service"
  install -Dm644 "$srcdir/craftbukkit.service" "$pkgdir/usr/lib/systemd/system/craftbukkit.service"
  install -Dm644 "$srcdir/craftbukkit.service" "$pkgdir/usr/lib/systemd/system/spigot.service"
  install -Dm644 "$srcdir/craftbukkit@.service" "$pkgdir/usr/lib/systemd/system/minecraft@.service"
  install -Dm644 "$srcdir/craftbukkit@.service" "$pkgdir/usr/lib/systemd/system/craftbukkit@.service"
  install -Dm644 "$srcdir/craftbukkit@.service" "$pkgdir/usr/lib/systemd/system/spigot@.service"

  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  install -dm755 "$pkgdir/srv/craftbukkit/"
  install -m755 "$srcdir/old_backup.sh" "$pkgdir/srv/craftbukkit/backup.sh"
  install -m755 "$srcdir/old_send_command.sh" "$pkgdir/srv/craftbukkit/send_command.sh"
}
