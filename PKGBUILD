# Maintainer: Dmitri Sosnik <dimavs@gmail.com>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: Mastacheata <benedikt "at" xenzilla "dot" de>
# Contributor: Yegorius <yegorius@domic.us>

pkgname=teamcity
pkgver=2023.11
pkgrel=1
pkgdesc='Continuous integration server from JetBrains'
arch=('any')
url="http://www.jetbrains.com/teamcity/"
license=('custom:JetBrains TeamCity')
depends=('java-runtime-headless')
install="$pkgname.install"
source=('https://download.jetbrains.com/teamcity/TeamCity-2023.11.tar.gz'
        'teamcity-agent.service'
        'teamcity-server.service'
        'teamcity-sysusers.conf'
        'teamcity-tmpfiles.conf'
        'teamcity.conf')
sha256sums=('4a7f9784bcbc1aa0eb86851e8f79b8f652ef3c6559911062d5a8b81720572b5f'
            'abe89ea6be4cb54750568f27c2173cd1b46b49b4aac0cc727d3604b1178cd8fb'
            '59e68ab2524e66f7c074ac4215a0449ed9242160946ef3364d378e015525e749'
            'b74128251ac1943ff48956bb2849731423b712d078ec76f1a8959532f0161c91'
            'f6d9b522a2730f9e6b6e044cb6f76fa31767788a4f7f21ab4e751dc1f88f6143'
            '7d140cac121eb725990edc2323682a0dbaeb15393b8fda10fb043af994843248')
options=('!strip')

package() {
  mkdir -p "$pkgdir/usr/share/licenses"
  mkdir -p "$pkgdir/var/lib/teamcity/buildAgent/"{system,temp,work}
  mkdir -p "$pkgdir/opt/teamcity"

  install -Dm644 "$srcdir/teamcity-agent.service" "$pkgdir/usr/lib/systemd/system/teamcity-agent.service"
  install -Dm644 "$srcdir/teamcity-server.service" "$pkgdir/usr/lib/systemd/system/teamcity-server.service"
  install -Dm644 "$srcdir/teamcity.conf" "$pkgdir/etc/conf.d/teamcity"
  install -Dm644 "$srcdir/teamcity-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/teamcity.conf"
  install -Dm644 "$srcdir/teamcity-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/teamcity.conf"

  cp -R "$srcdir/TeamCity"/* "$pkgdir/opt/teamcity"
  ln -s /opt/teamcity/licenses "$pkgdir/usr/share/licenses/teamcity"
  sed -e 's|=\.\.|=/var/lib/teamcity/buildAgent|g' -i "$pkgdir/opt/teamcity/buildAgent/conf/buildAgent.properties"

  rm "$pkgdir/opt/teamcity/bin/"*.{bat,cmd,exe}
  rm "$pkgdir/opt/teamcity/buildAgent/bin/"*.{bat,plist,dist}
  rm "$pkgdir/opt/teamcity/buildAgent/bin/mac.launchd.sh"
}
