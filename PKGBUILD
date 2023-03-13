# Maintainer: Charles Leclerc <charles@la-mouette.net>
# Co-Maintainer: Polarian <polarian@polarian.dev>

pkgname=reposilite
pkgver=3.4.0
pkgrel=1
pkgdesc="Reposilite (formerly NanoMaven) - lightweight repository manager for Maven artifacts. It is a simple solution to replace managers like Nexus, Archiva or Artifactory."
arch=(any)
url="https://github.com/dzikoysk/$pkgname"
license=('Apache')
depends=('jre11-openjdk-headless')
makedepends=('jdk11-openjdk' 'nodejs' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "$pkgname.env"
        "$pkgname.wrapper")
sha256sums=('bbaa0ff8ec32718433d9ff8906b1dc8bce3a814b8580569e7bcb64aa1fb72c43'
            '1e543e7ef39d64ae683156aaa6aad8f164f30de999d15717416410e1750b9a8e'
            '92ccfeff429aa4757ef353677dd99ad7aebe7483d4824706a27250e81efd6323'
            '9587fa49dd66d5f31dee33aa1a9da269a34666b63f62e2550a66c3bc1d397aa7'
            '7affcf3ef54c9c05326281c3496a8744221be312675fd7d4ab17fd50eb320521'
            'd06d5686dace4d74dd788ea9f755536678e614af481206969aa457ef79dec400')
backup=('etc/reposilite/configuration.cdn'
        'etc/reposilite/default.env')

build() {
  cd "$pkgname-$pkgver"
  sed -i -r -e "s/(\\s+)version\\s*=.*/\\1version = \"$pkgver\"/" build.gradle.kts
  chmod a+x gradlew
  JAVA_HOME="/usr/lib/jvm/java-11-openjdk" ./gradlew :reposilite-backend:shadowJar --no-daemon --stacktrace
}

package() {
  install -Dm 644 $pkgname.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 $pkgname.sysusers "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm 644 $pkgname.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm 644 $pkgname-$pkgver/reposilite-backend/build/libs/$pkgname-$pkgver.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm 644 $pkgname.env "${pkgdir}/etc/reposilite/default.env"
  /usr/lib/jvm/java-11-openjdk/bin/java -jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar" -wd "${pkgdir}/etc/reposilite" -gc configuration.cdn
  install -Dm 755 $pkgname.wrapper "${pkgdir}/usr/bin/reposilite"
}
