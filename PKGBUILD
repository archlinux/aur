# Contributor: JC FRANCOIS <jc.francois.gmail.com>
# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=craftbukkit-spigot
pkgver=1.19.3.3658
#### Minecraft version to build. Just change this to build a different branch.
#### Makepkg will automatically (unless --holdver is specified) select the most
#### recent Spigot version for this Minecraft version.
_pkgver=1.19.3
_build="$(echo "$pkgver" | awk -F \. '{print $4}')"
_build="${_build//_/-}"
# Specify BuildTools version explicitly (instead of using
# 'lastSuccessfulBuild') to let makepkg detect when needs to download an update
_buildtoolver=156
pkgrel=1
pkgdesc="CraftBukkit, Spigot, and vanilla Minecraft servers"
arch=(any)
url="https://www.spigotmc.org/"
license=("GPL3")
depends=(bash "java-runtime-headless-openjdk>=17" "java-runtime-headless-openjdk<21" fontconfig)
makedepends=(git)
optdepends=("mcrcon: Notify users before shutdown and consistent backups")
conflicts=(bukkit craftbukkit craftbukkit-stable)
provides=("craftbukkit=${_pkgver}" "minecraft-server=${_pkgver}")
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
        "sysusers.conf"
        "tmpfiles.conf")
sha256sums=('3d7edc0da5cb1f57ae3a7526d14d8e080014b75f29e5d7ce972790f392bc003c'
            '6694a8cccb1b8da8a3ae2d05dfea693364678fc0b097f5c589b7063f9a42c392'
            'cbaaa76357925bb9e2db8ff2da31901f03c16d5a14f7c4ec05eb2cfdeba63fd7'
            '16d2281874c953eb94141994d5a4c4c31b0b3f7d51652ebdad1f2367fdeaea8c'
            'a835b1c96a731694628b8d3950edfc4171c75f711ecd7feef91f3d9b9eac4a73'
            '2b758beb056019daa92caf19a9d35f33ab2c90b4f422e5ab4f0791c72a3f7ed0'
            '492c06eb11f26d3eff6742b88f2024be85eff05cf80d57a691cd3420ebdcb26c'
            '8e0e95065746d0309b60bb253879cd040b9adf76666830c28121c9610bb1e499'
            '04624c1188efb06e960503a4eec4f604114ff5ec11a63945e64ebfdb3b2c4dfb'
            'c30b180e2e571d1f052df0b82c51f261bc4e48dbaf8806c5bc897c07e939f575'
            'b0d9b2592d22bd42d738002ea1509d6db93cbeef615f95b35dd8345ff971e321')

pkgver() {
  _build="$(curl "https://hub.spigotmc.org/versions/$_pkgver.json" 2> /dev/null | \
           grep '"name"' | sed 's/.*: "\([^"]*\)",/\1/')"
  _build="$(echo "$_build" | sed 's/\([0-9]\+\)\([a-z]\)/\1-\2/')"
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

  install -Dm644 "$srcdir/craftbukkit-${_pkgver}.jar" "$pkgdir/usr/share/java/$pkgname/craftbukkit.jar"
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
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
