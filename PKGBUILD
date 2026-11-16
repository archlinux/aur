# Maintainer: Finn Künstner <finn dot kuenstner at gmail dot com>
# Contributor: Johannes Joens <johannes@joens.email>
# Contributor: Misterio <eu@misterio.me>
# Contributor: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Philip Abernethy <chais.z3r0@gmail.com>
# Contributor: sowieso <sowieso@dukun.de>

pkgname=bungeecord
pkgver=2111
pkgrel=1
pkgdesc='Proxy and API for teleporting players between multiple Minecraft servers'
arch=('any')
url='https://www.spigotmc.org/wiki/bungeecord/'
license=('LicenseRef-BungeeCord')
depends=(
  'bash'
  'coreutils'
  'gawk'
  'grep'
  'java-runtime-headless>=17'
  'procps-ng'
  'screen'
  'sed'
  'sudo'
  'util-linux'
)
optdepends=(
  'gzip: create world backups'
  'nmap: suspend idle servers'
  'tar: create world backups'
)
backup=(
  'etc/conf.d/bungeecord'
  'srv/bungeecord/servers/proxy.conf'
)
install=$pkgname.install
_server_root=/srv/bungeecord
_subserver=proxy
source=("$pkgname.$pkgver.jar::https://hub.spigotmc.org/jenkins/job/BungeeCord/$pkgver/artifact/bootstrap/target/BungeeCord.jar"
        "$pkgname-backup@.service"
        "$pkgname-backup@.timer"
        "$pkgname@.service"
        "$pkgname.conf"
        "$pkgname.sh"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "$_subserver.conf")
noextract=("$pkgname.$pkgver.jar")
sha256sums=('1d9dbc31b57b22a37553f160ac1b61762717e9e4a6a1341f3dd27a1f6f2671fd'
            '2b98cc9285a83d17c86189b8fe44eed3b7101b90bd07df556b95a3e488a5afa9'
            '10316c2c479abdfdd60026714976ed692facf2630beac83e282a705e1a239514'
            'ce58471d1a8fd2f9118d73dc7676522a64926d527e8c787af05df737a569a9e4'
            '6ac4eba82c44f926e3d592c65a30cf1e750f8696f2082d799dfb3e9095d0ca92'
            '753e456f287977f74f6ed327b004ef30e9b642953556b0a308110827abc22366'
            '76a7101d3f5803f1b8fbd5b629da05c11b1e7bde10b972412c17fbc2ef04d90d'
            '8401dc062f01d3b87179f068b867709d9507a279be8e032a0c1c10a7c5774b92'
            '73e821b2527671df679ae226dac3f0d299fbc1cf061baf3ced472406be9fbb98')

prepare() {
  bsdtar -xf "$pkgname.$pkgver.jar" LICENSE
}

package() {
  install -Dm644 "$pkgname.conf" "$pkgdir/etc/conf.d/$pkgname"
  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname@.service" "$pkgname-backup@.service" "$pkgname-backup@.timer" \
    -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  install -Dm644 "$pkgname.$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/BungeeCord.jar"
  install -Dm644 "$_subserver.conf" -t "$pkgdir$_server_root/servers"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
