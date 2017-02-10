# Maintainer: JC FRANCOIS <jc.francois@gmail.com>

pkgname=craftbukkit-spigot
pkgver=1.11.2
pkgbuild=59
pkgrel=2
pkgdesc="CraftBukkit & Spigot Minecraft servers"
arch=(any)
url="http://www.spigotmc.org/"
license=("BSD")
depends=(java-runtime-headless fontconfig git mcrcon)
conflicts=(bukkit craftbukkit craftbukkit-stable)
provides=(craftbukkit=1.10)
install=craftbukkit-spigot.install
noextract=('BuildTools.jar')
source=("https://hub.spigotmc.org/jenkins/job/BuildTools/${pkgbuild}/artifact/target/BuildTools.jar"
        "minecraft.service"
        "craftbukkit.service"
        "spigot.service"
        "send_command.sh"
        "start_server.sh"
        "stop_server.sh"
        "backup.sh"
        "readme.md")
md5sums=('8ad3f9152a92b70bd51dd8471a65d2a8'
         '8ac1ef7ff8be744fa0312ebb608fda42'
         '5bddd0dff4f3d25fd86c240f81078174'
         '32c6641316b0adc7e1f63e3cc8033700'
         'a8dc97fcf4ef62e279e9ea835a73b42d'
         '48e64eff8419e7f831513720885ebd6d'
         'dc210f0284dff6865cafbca5990f0e2d'
         'a5978eb14131a6b02e566b4b6225659c'
         '28ba7da9e8488c7da2fd25ec16512d4a')

prepare() {
  # Get license approval
  echo -n "Are you in agreement with the Minecraft EULA (https://account.mojang.com/documents/minecraft_eula)? (y/N) "
  read agree

  if [ "${agree^^}" = "Y" ]; then
    echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." > eula.txt
    echo "#`date`" >> eula.txt
    echo "eula=true" >> eula.txt
  else
    echo "Can't continue without agreement on license. Aborting."
    exit 1
  fi
}

build() {
  java -jar BuildTools.jar --rev $pkgver
}

package() {
  install -Dm644 "$srcdir/craftbukkit-${pkgver}.jar" "$pkgdir/srv/craftbukkit/craftbukkit.jar"
  install -Dm644 "$srcdir/spigot-${pkgver}.jar" "$pkgdir/srv/craftbukkit/spigot.jar"
  install -Dm644 "$srcdir/work/minecraft_server.${pkgver}.jar" "$pkgdir/srv/craftbukkit/minecraft.jar"
  install -Dm644 "$srcdir/minecraft.service" "$pkgdir/usr/lib/systemd/system/minecraft.service"
  install -Dm644 "$srcdir/craftbukkit.service" "$pkgdir/usr/lib/systemd/system/craftbukkit.service"
  install -Dm644 "$srcdir/spigot.service" "$pkgdir/usr/lib/systemd/system/spigot.service"
  install -Dm754 "$srcdir/send_command.sh" "$pkgdir/srv/craftbukkit/send_command.sh"
  install -Dm754 "$srcdir/start_server.sh" "$pkgdir/srv/craftbukkit/start_server.sh"
  install -Dm754 "$srcdir/stop_server.sh" "$pkgdir/srv/craftbukkit/stop_server.sh"
  install -Dm774 "$srcdir/backup.sh" "$pkgdir/srv/craftbukkit/backup.sh"
  install -Dm664 "$srcdir/eula.txt" "$pkgdir/srv/craftbukkit/eula.txt"
  install -Dm644 "$srcdir/readme.md" "$pkgdir/srv/craftbukkit/readme.md"
  install -Dm644 "$srcdir/Bukkit/LICENCE.txt" "$pkgdir/usr/share/licenses/craftbukkit+spigot/LICENSE"
  mkdir $pkgdir/srv/craftbukkit/backup
  chmod 770 $pkgdir/srv/craftbukkit/backup
}
