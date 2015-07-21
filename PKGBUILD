# Maintainer: David Flemström <dflemstr@spotify.com>
pkgname=helios-git
pkgver=0.8.420.r0.ga0381bc
pkgrel=1
pkgdesc="Spotify Helios - Docker container orchestration platform"
license=('Apache')

arch=('any')
depends=('java-runtime' 'zookeeper')
makedepends=('git' 'maven')
source=("$pkgname::git+ssh://git@github.com/spotify/helios.git"
        'helios-master.service'
        'helios-agent.service'
        'helios-env.sh')
md5sums=('SKIP'
         '2aeb4f23cf3520abbffa230d50a96ce6'
         'a0f0cd98b3b3888aba00ff8436e22506'
         '584cdaa52f45e71d6d4dfc6c6c11e02a')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  mvn clean package -Dmaven.test.skip -Dmaven.javadoc.skip
}

package() {
  install -dm755 "$pkgdir/var/lib/helios-master"
  install -dm755 "$pkgdir/var/lib/helios-agent"

  install -Dm755 helios-env.sh -t "$pkgdir/etc/profile.d/"
  install -Dm644 helios-master.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 helios-agent.service -t "$pkgdir/usr/lib/systemd/system"

  cd "$pkgname"
  install -Dm644 helios-services/target/helios-services-*-shaded.jar -t "$pkgdir/usr/share/helios/lib/services/"
  install -Dm644 helios-tools/target/helios-tools-*-shaded.jar -t "$pkgdir/usr/share/helios/lib/tools/"
  install -Dm755 bin/helios-agent -t "$pkgdir/usr/bin/"
  install -Dm755 bin/helios-master -t "$pkgdir/usr/bin/"
  install -Dm755 bin/helios -t "$pkgdir/usr/bin/"

  install -Dm644 src/deb/helios-master/default "$pkgdir/etc/default/helios-master"
  install -Dm644 src/deb/helios-agent/default "$pkgdir/etc/default/helios-agent"
}
