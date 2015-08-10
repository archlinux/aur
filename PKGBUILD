# Maintainer: Markus Plangg <plangg at ifs.tuwien.ac.at>
pkgname=photohawk-git
pkgver=0.0.2.r29.gcc219b7
pkgrel=1
pkgdesc="Java image comparison for SSIM, AE, MAE, MSE, PAE, Equals"
arch=('any')
url="http://datascience.github.io/photohawk/"
license=('APACHE')
depends=('java-runtime' 'dcraw' 'libcups' 'fontconfig')
makedepends=('git' 'maven' 'ruby-ronn')
provides=('photohawk')
conflicts=('photohawk')
source=('git+https://github.com/datascience/photohawk.git')
md5sums=('SKIP')

pkgver() {
  cd "photohawk"	
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "photohawk"
  mvn -pl photohawk-commandline -am -Dmaven.test.skip=true clean package
}

package() {
  install -D -m755 "$srcdir"/photohawk/photohawk-commandline/src/arch/usr/bin/photohawk "$pkgdir/usr/bin/photohawk"

  ronn "$srcdir/photohawk/photohawk-commandline/src/man/photohawk.1.ronn"
  install -D -m644 "$srcdir"/photohawk/photohawk-commandline/src/man/photohawk.1 "$pkgdir/usr/share/man/man1/photohawk.1"

  install -D -m755 "$srcdir"/photohawk/photohawk-commandline/target/photohawk-commandline-*-jar-with-dependencies.jar "$pkgdir/usr/share/java/photohawk/photohawk-commandline-$pkgver.jar"
}
