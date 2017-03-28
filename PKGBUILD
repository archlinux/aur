# Maintainer: Duarte David <deltaduartedavid@gmail.com>

pkgname=nexus3
pkgver=3.2.1
patchver=01
pkgrel=1
pkgdesc="Nexus 3 Repository Manager OSS"
url="http://nexus.sonatype.org"
arch=('i686' 'x86_64')
depends=('java-runtime=8')

install="$pkgname.install"

source=("http://download.sonatype.com/nexus/3/nexus-$pkgver-$patchver-unix.tar.gz" 
              "$pkgname.service")

sha1sums=('3aa5a12beba9b0c35d7cea1d774a2117398f5c5b' '8ad863b2c1c4e264dcd766864b53ee3ba732c6c4')

package() {
  mkdir -p $pkgdir/opt/

  #License
  install -Dm644 $srcdir/nexus-$pkgver-$patchver/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
  rm $srcdir/nexus-$pkgver-$patchver/LICENSE.txt
  
  #Nexus
  cp -r $srcdir/nexus-$pkgver-$patchver $pkgdir/opt/$pkgname

  #Sonatype-work
  cp -r $srcdir/sonatype-work/nexus3 $pkgdir/opt/$pkgname/data
  sed -i "s/\(Dkaraf.data*= *\).*/\1data/" $pkgdir/opt/$pkgname/bin/nexus.vmoptions
  sed -i "s/\(Djava.io.tmpdir*= *\).*/\1data\/tmp/" $pkgdir/opt/$pkgname/bin/nexus.vmoptions
  sed -i "s/\(LogFile= *\).*/\1data\/log\/jvm.log/" $pkgdir/opt/$pkgname/bin/nexus.vmoptions
  
  install -Dm644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
  
}

