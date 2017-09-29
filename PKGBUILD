# Maintainer: Yegorius <yegorius@domic.us>

pkgname=teamcity
pkgver=2017.1.4
pkgrel=1
pkgdesc='Continuous integration server from JetBrains'
arch=('any')
url="http://www.jetbrains.com/teamcity/"
license=('custom:JetBrains TeamCity')
depends=('java-runtime-headless')
install="$pkgname.install"
source=('https://download.jetbrains.com/teamcity/TeamCity-2017.1.4.tar.gz'
        'teamcity-agent.service'
        'teamcity-server.service'
        'teamcity-sysusers.conf'
        'teamcity-tmpfiles.conf'
        'teamcity.confd')
sha512sums=('86372026f01def31f7c25dbb007b1615437df0ad26feea7e11435edf471702d4d8ec39f82abd007be7b8e7e1363ad3ef8e631e19d983f4103d6625bf0c7da104'
            'bf8786f45d9b9101027b6efe2e1732988d032cb1ae1655b2188b61eda70d0df49d48c0de191e2eb00378fd44722a61592fcd26f5426ff150fc72d78b448a3223'
            '4cf06ff10623ede0e37fd76727845c9574ef52f2309f93bb44604422cbce633b0cfeed783bc1a5840c457cc8f3e602cb10e9b995a30ca94097d51da23534a063'
            '7f13bbb039741a66836d4a2e48ce348e2cc22bf198c932179017654f15275c8f811bed6cc131d4639b8f98ae72dbf7ecac0894b74cf287c5b1d4079da1191e1a'
            'f220e31a1b4420db181010c2f8267d2b5fcf90dbb6d5352b191b504850372c161582e5f99e06dde1b3bcb7c69b25575378a35a91564b2905b3dcc3238c906976'
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
  install -Dm644 "$srcdir/teamcity-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/teamcity.conf"
  install -Dm644 "$srcdir/teamcity-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/teamcity.conf"

  cp -R "$srcdir/TeamCity"/* "$pkgdir/opt/teamcity"
  ln -s /opt/teamcity/licenses "$pkgdir/usr/share/licenses/teamcity"
  sed -e 's|=\.\.|=/var/lib/teamcity/buildAgent|g' -i "$pkgdir/opt/teamcity/buildAgent/conf/buildAgent.properties"

  rm "$pkgdir/opt/teamcity/bin/"*.{bat,cmd,exe}
  rm "$pkgdir/opt/teamcity/buildAgent/bin/"*.{bat,plist,dist}
  rm "$pkgdir/opt/teamcity/buildAgent/bin/mac.launchd.sh"
}
