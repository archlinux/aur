# Maintainer: David Parrish <daveparrish@gmail.com>

pkgname=nxt-git
pkgver=1.11.5+0+gfc25fd5a2
pkgrel=2
pkgdesc="The Nxt Reference Software Client for use with the Nxt Cryptocurrency"
arch=('any')
url="http://nxt.org"
license=('MIT' 'GPL' 'MPL' 'APACHE')
depends=('java-runtime-headless>=8' 'systemd')
makedepends=('java-environment>=8')
source=('git+https://bitbucket.org/JeanLucPicard/nxt.git'
        'logging.properties'
        'nxt.properties'
        'nxt.sysusers'
        'nxt.tmpfiles'
        'nxt.service'
        'nxt.desktop'
        'nxt.sh')
backup=('etc/nxt/nxt.properties'
        'etc/nxt/logging.properties')
sha256sums=('SKIP'
            'e00b9e5a605653faec8a4582ba004eff54c3692f60dc5a8c13c98119041195b1'
            'a65abe20dcec9ab4e7f39b5f16daee3e10a0b93dd78cadea47d45289ea145cbf'
            'd73213fe300346c548e991af0797b23b3c608e803f741cd0ae89d3bb0549bfe3'
            '2f4775688213f0948364f1594162c12a6ec865501f7434847ce9bb7c73b11c59'
            '9c3ba3fff584e4baae3d9af88aa62418fd701094d2256e6e687300ce35b1f6f8'
            '9c5cd343af10ba63d024280e79453fa92a1c0864b47c77020eaa86fc316f5661'
            'c3beaaf62b9d499e023426d4206d8eb775d7dcf6f7b005b3bb34b12d64d9c1af')

pkgver() {
  cd nxt
  git describe --long --tags | sed 's/-/+/g; s/^v//'
}

build() {
  cd nxt

  mkdir classes
  shopt -s globstar
  javac -encoding utf8 -sourcepath src/java/nxt -classpath "lib/*:classes" -d classes src/java/nxt/**/*.java
  jar cf nxt.jar -C classes .
}

package() {
  cd nxt

  install -d "$pkgdir/usr/share/java/nxt"
  cp     -rt "$pkgdir/usr/share/java/nxt" nxt.jar lib conf addons
  rm     -rf "$pkgdir/usr/share/java/nxt/"{addons/src,conf/.gitignore}

  install -d "$pkgdir/usr/share/nxt"
  cp     -rt "$pkgdir/usr/share/nxt" ./html

  install -Dm644 -t "$pkgdir/etc/nxt" ../{nxt,logging}.properties

  # Service files
  install -Dm644 ../nxt.service  "$pkgdir/usr/lib/systemd/system/nxt.service"
  install -Dm644 ../nxt.sysusers "$pkgdir/usr/lib/sysusers.d/nxt.conf"
  install -Dm644 ../nxt.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/nxt.conf"

  # Desktop files
  install -Dm644 html/www/img/nxt_logo.png "${pkgdir}/usr/share/pixmaps/nxt.png"
  install -Dm644 ../nxt.desktop            "${pkgdir}/usr/share/applications/nxt.desktop"
  install -Dm755 ../nxt.sh                 "$pkgdir/usr/bin/nxt"

  # License files
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" ./{COPYING,3RD-PARTY-LICENSES,LICENSE}.txt
}
