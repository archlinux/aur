# Maintainer: Yegorius <yegorius@domic.us>

pkgname=teamcity
pkgver=2017.1.1
pkgrel=1
pkgdesc='Continuous integration server from JetBrains'
arch=('any')
url="http://www.jetbrains.com/teamcity/"
license=('custom:JetBrains TeamCity')
depends=('java-runtime-headless')
install="$pkgname.install"
source=("http://download.jetbrains.com/teamcity/TeamCity-${pkgver}.tar.gz"
        'teamcity-agent.service'
        'teamcity-server.service'
        'teamcity.conf'
        'teamcity.confd')
sha512sums=('f7af0cfe53297430667d80d2f83530820ff017454da8206fec1adae8739a1195ac01aaee01d5c833e0f65aa610af97dd70ac35896eb7f015e95641fef24a12f7'
            'bf8786f45d9b9101027b6efe2e1732988d032cb1ae1655b2188b61eda70d0df49d48c0de191e2eb00378fd44722a61592fcd26f5426ff150fc72d78b448a3223'
            '4cf06ff10623ede0e37fd76727845c9574ef52f2309f93bb44604422cbce633b0cfeed783bc1a5840c457cc8f3e602cb10e9b995a30ca94097d51da23534a063'
            '7f13bbb039741a66836d4a2e48ce348e2cc22bf198c932179017654f15275c8f811bed6cc131d4639b8f98ae72dbf7ecac0894b74cf287c5b1d4079da1191e1a'
            'c2997eafd5cefdb68340815d3286418dfb37e9ba9ab1f3147e89c21ebcdb7fdb5392b7a36b592ea1f4ab0f68da4f5bfc38ae25b475ac3ff10794e99049ea558b')
options=('!strip')
PKGEXT='.pkg.tar'

package() {
  mkdir -p "$pkgdir/usr/share/licenses"
  mkdir -p "$pkgdir/var/lib/teamcity/buildAgent/"{system,temp,work}
  mkdir -p "$pkgdir/opt/teamcity"

  install -Dm644 "$srcdir/teamcity-agent.service" "$pkgdir/usr/lib/systemd/system/teamcity-agent.service"
  install -Dm644 "$srcdir/teamcity-server.service" "$pkgdir/usr/lib/systemd/system/teamcity-server.service"
  install -Dm644 "$srcdir/teamcity.confd" "$pkgdir/etc/conf.d/teamcity"
  install -Dm644 "$srcdir/teamcity.conf" "$pkgdir/usr/lib/sysusers.d/teamcity.conf"

  cp -R "$srcdir/TeamCity"/* "$pkgdir/opt/teamcity"
  ln -s /opt/teamcity/licenses "$pkgdir/usr/share/licenses/teamcity"
  sed -e 's|=\.\.|=/var/lib/teamcity/buildAgent|g' -i "$pkgdir/opt/teamcity/buildAgent/conf/buildAgent.properties"

  rm "$pkgdir/opt/teamcity/bin/"*.{bat,cmd,exe}
  rm "$pkgdir/opt/teamcity/buildAgent/bin/"*.{bat,plist,dist}
  rm "$pkgdir/opt/teamcity/buildAgent/bin/mac.launchd.sh"
}
