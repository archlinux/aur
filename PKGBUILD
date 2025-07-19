# Maintainer: Polarian <polarian@polarian.dev>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=openfire-git
pkgver=5.0.0.r82.g4de330c
pkgrel=1
pkgdesc="High performance XMPP (Jabber) server."
arch=('any')
url='https://www.igniterealtime.org/projects/openfire/'
license=('APACHE')
depends=('java-runtime-headless>=17')
makedepends=('java-environment=17' 'git')
backup=('etc/conf.d/openfire'
        'etc/openfire/openfire.xml'
        'etc/openfire/security.xml'
        'etc/openfire/crowd.properties'
        'etc/openfire/security/truststore'
        'etc/openfire/security/client.truststore'
        'etc/openfire/security/keystore')
source=("$pkgname::git+https://github.com/igniterealtime/Openfire"
        'openfire.sh'
        'openfire.conf'
        'openfire.service'
        'user.conf'
        'tmpfile.conf'
        'force-java17.patch')
sha256sums=('SKIP'
            'c850f376d53134ccc8d1035322dea792ba9145a5ab37f1801598c60bc70d0ed1'
            'c8a612abee90bdc9a2869e562a4bbbf596159c60adcd23368833a0e2ca27c1d4'
            'bc58f7e80cbdaee8523874990bf061cfd0e6480c676102e2131fe487d2782061'
            '8bfa51cf8cc88fc69547a8f6e9e3fb242926ca2a100659363e1a6b332f223ba9'
            'c63396991984a067d05e21094a664255d6aed2bf294bddd3885a7da75472b886'
            'a2842bb2f9e47a39a2c65359241cff2563525430badc220a4ffa0d5bae67d6cb')
provides=('openfire')
conflicts=('openfire')

pkgver() {
    cd "$pkgname"
      git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-
}

prepare() {
    patch -d $pkgname -Np2 -i ../force-java17.patch
}

build() {
  cd "$pkgname"
  make dist
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

  cd "$pkgname"/distribution/target/distribution-base

  cp -R conf/* "$pkgdir"/etc/openfire/

  cp -R resources/security "$pkgdir"/etc/openfire/
  ln -s /etc/openfire/security "$pkgdir"/usr/share/openfire/resources/security

  cp -R plugins "$pkgdir"/usr/share/openfire/
  cp -R resources/{database,spank,nativeAuth} "$pkgdir"/usr/share/openfire/resources/
  rm -rf "$pkgdir"/usr/share/openfire/resources/nativeAuth/{osx,win}*
  cp -R lib "$pkgdir"/usr/share/java/openfire
  cp -R documentation "$pkgdir"/usr/share/doc/openfire
}
