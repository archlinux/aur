# Maintainer: Paul Bastian <paul.bastian@posteo.de>
pkgname=librespot-java-git
pkgver=v1.5.2.r26.g26818c6
pkgrel=1
pkgdesc="A Spotify Connect enabled headless client"
arch=('any')
url="https://github.com/librespot-org/librespot-java"
license=('APACHE')
depends=('java-runtime')
makedepends=('git'
             'maven')
conflicts=('librespot-java')
backup=(etc/librespot-java/config.toml)
source=("${pkgname}::git+https://github.com/librespot-org/librespot-java#branch=dev"
        "https://raw.githubusercontent.com/paulbastian/aur/master/librespot-java/config.toml"
        "https://raw.githubusercontent.com/paulbastian/aur/master/librespot-java/librespot-java.service")
sha256sums=('SKIP'
            '732a44a47780420484fdddff0c2ec206f58af3b4eddd71aa871e5b755890e3ee'
            '4d0b3452768be2eb380f6ae49c5d7fdfb0a095f699f71ce2a1697260b0c89b3a')

pkgver() {
  cd "$pkgname"
printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname}"
	mvn package
}

package() {	
  cd "$srcdir"

  mkdir -p "${pkgdir}"/usr/share/java/librespot
  install -D -m644 ${pkgname}/player/target/librespot-player-*-SNAPSHOT.jar "$pkgdir/usr/share/java/librespot/librespot-player.jar" 
  
  mkdir -p "${pkgdir}"/etc/librespot-java
  install -m644 -Dt "$pkgdir/etc/librespot-java" config.toml

  install -m644 -Dt "$pkgdir/usr/lib/systemd/system" librespot-java.service
}
