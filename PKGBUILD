# Maintainer: JC FRANCOIS <jc.francois.gmail.com>

pkgname=craftbukkit-spigot
pkgver=1.12.2
pkgbuild=75
pkgrel=3
pkgdesc="CraftBukkit & Spigot Minecraft servers"
arch=(any)
url="http://www.spigotmc.org/"
license=("BSD")
depends=(java-runtime-headless fontconfig git mcrcon)
conflicts=(bukkit craftbukkit craftbukkit-stable)
provides=(craftbukkit=${pkgver} minecraft-server=${pkgver})
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
md5sums=('f9ad685c926b577869835a252d66410f'
         'ec1fa48d148fc3967e516772f6b7ca7b'
         'dd8955f7f9f19715ddfd6aefa697f845'
         'f9f56e25b7a31004a723ba1884e79c28'
         'f44a30a3e72aa138b40d02246e40c77b'
         'f09bc4db52eae9b41220c39a5dc9e429'
         'dc210f0284dff6865cafbca5990f0e2d'
         'a5978eb14131a6b02e566b4b6225659c'
         '28ba7da9e8488c7da2fd25ec16512d4a')

prepare() {
  # Get license approval
  echo "By installing this package you indicate that you are in agreement with the Minecraft EULA (https://account.mojang.com/documents/minecraft_eula)"
  echo "# By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." > eula.txt
  echo "# `date`" >> eula.txt
  echo "eula=true" >> eula.txt
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
