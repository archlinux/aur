# Maintainer: Polarian <polarian@polarian.dev>

# Below maintain openfire within official repository:
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=openfire-beta
pkgver=4.8.0
pkgrel=2
pkgdesc="High performance XMPP (Jabber) server, beta edition."
arch=('any')
url='https://www.igniterealtime.org/projects/openfire/'
license=('APACHE')
depends=('java-runtime-headless<19')
makedepends=('maven' 'jre11-openjdk-headless' 'jdk11-openjdk')
provides=('openfire')
conflicts=('openfire')
backup=('etc/conf.d/openfire'
        'etc/openfire/openfire.xml'
        'etc/openfire/security.xml'
        'etc/openfire/crowd.properties'
        'etc/openfire/security/truststore'
        'etc/openfire/security/client.truststore'
        'etc/openfire/security/keystore')
source=("$pkgname-$pkgver.tar.gz::https://github.com/igniterealtime/Openfire/archive/refs/tags/v${pkgver}beta.tar.gz"
        'openfire.sh'
        'openfire.conf'
        'openfire.service'
        'user.conf'
        'tmpfile.conf')
sha256sums=('2b4a5e6e91e97951bcb4817b23f33443d18e0cdc8a960b3f3fcfdbdf9eac59ba'
            'c850f376d53134ccc8d1035322dea792ba9145a5ab37f1801598c60bc70d0ed1'
            'c8a612abee90bdc9a2869e562a4bbbf596159c60adcd23368833a0e2ca27c1d4'
            'bc58f7e80cbdaee8523874990bf061cfd0e6480c676102e2131fe487d2782061'
            '8bfa51cf8cc88fc69547a8f6e9e3fb242926ca2a100659363e1a6b332f223ba9'
            'c63396991984a067d05e21094a664255d6aed2bf294bddd3885a7da75472b886')

build() {
  cd "$srcdir"/Openfire-${pkgver}beta
  make
}

package() {
  cd "$pkgdir"
  install -dm755 usr/share/openfire/resources usr/share/{doc,java}
  install -dm750 etc/openfire

  cd "$srcdir"
  install -Dm0755 openfire.sh "$pkgdir"/usr/bin/openfire
  install -Dm0644 openfire.conf "$pkgdir"/etc/conf.d/openfire
  install -Dm0644 openfire.service "$pkgdir"/usr/lib/systemd/system/openfire.service
  install -Dm0644 user.conf "$pkgdir"/usr/lib/sysusers.d/openfire.conf
  install -Dm0644 tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/openfire.conf

  cd Openfire-${pkgver}beta/distribution/target/distribution-base

  cp -R conf/* "$pkgdir"/etc/openfire/

  cp -R resources/security "$pkgdir"/etc/openfire/
  ln -s /etc/openfire/security "$pkgdir"/usr/share/openfire/resources/security

  cp -R plugins "$pkgdir"/usr/share/openfire/
  cp -R resources/{database,spank,nativeAuth} "$pkgdir"/usr/share/openfire/resources/
  rm -rf "$pkgdir"/usr/share/openfire/resources/nativeAuth/{osx,win}*
  cp -R lib "$pkgdir"/usr/share/java/openfire
  cp -R documentation "$pkgdir"/usr/share/doc/openfire
}
