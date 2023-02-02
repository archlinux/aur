# Maintainer: Your Name <youremail@domain.com>
# Co-Maintainer: Polarian <polarian@polarian.dev>

pkgname=reposilite
pkgver=3.2.7
pkgrel=1
pkgdesc="Reposilite (formerly NanoMaven) - lightweight repository manager for Maven artifacts. It is a simple solution to replace managers like Nexus, Archiva or Artifactory."
arch=(any)
url="https://github.com/dzikoysk/$pkgname"
license=('Apache')
depends=('java-runtime')
makedepends=('java-environment' 'nodejs' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
sha256sums=('930a9a9c5a8b2b54602ee017facb056262898421339b2f230d0345bd6ae78474'
            'a90d98915a867ae8b2569d124d0f625908e490284d26005cd47c041c75ef3db4'
            '92ccfeff429aa4757ef353677dd99ad7aebe7483d4824706a27250e81efd6323'
            '9587fa49dd66d5f31dee33aa1a9da269a34666b63f62e2550a66c3bc1d397aa7')

build() {
  cd "$pkgname-$pkgver"
  sed -i -e "s/version\\s*=.*/version = \"$pkgver\"/" build.gradle.kts
  chmod a+x gradlew
  ./gradlew :reposilite-backend:shadowJar --no-daemon --stacktrace
}

package() {
  install -Dm 644 $pkgname.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 $pkgname.sysusers "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm 644 $pkgname.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm 644 $pkgname-$pkgver/reposilite-backend/build/libs/$pkgname-$pkgver.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
}
