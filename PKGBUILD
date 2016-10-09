# Maintainer: Web Dawg <webdawg@hackspherelabs.com>
# Copied from solr build: Tom Richards <tom@tomrichards.net> (InDirect)

# gpg statement:
# you will need to import keys for this to install
# official keys are located here:
# https://www.apache.org/dist/nutch/KEYS
# which after download you can import with:
# gpg --import KEYS
# or you can just import the one key used to
# sign this package from a key server:
# gpg --recv-keys DB7B5199121C08A5C8F4052B3A4717F048BAEBF6

# this package was tested with openjdk version "1.8.0_102"
# or v8...
# this package was also tested with ant version:
# Apache Ant(TM) version 1.9.7 compiled on April 24 2016

# READ THIS READ THIS READ THIS READ THIS READ THIS
# READ THIS READ THIS READ THIS READ THIS READ THIS
# READ THIS READ THIS READ THIS READ THIS READ THIS

# THE MOST IMPORTANT MESSAGE OF ALL:
# THIS PACKAGE DOES NOT BACKUP ANY CONFIGURATION FILES AT THIS POINT
# I AM NOT SURE WHAT TO PRESERVE AS NUTCH IS SO DYNAMIC

# READ THIS READ THIS READ THIS READ THIS READ THIS
# READ THIS READ THIS READ THIS READ THIS READ THIS
# READ THIS READ THIS READ THIS READ THIS READ THIS


validpgpkeys=("DB7B5199121C08A5C8F4052B3A4717F048BAEBF6")

pkgname=nutch
pkgver=2.3.1
pkgrel=1
pkgdesc="Highly extensible and scalable open source web crawler software project."
arch=('any')
license=('Apache')
url="https://nutch.apache.org/"
depends=('java-runtime-headless>=8')
makedepends=(
	'apache-ant'
	)

# current url syntax:  http://archive.apache.org/dist/nutch/2.3.1/apache-nutch-2.3.1-src.tar.gz

source=("https://archive.apache.org/dist/$pkgname/$pkgver/apache-$pkgname-$pkgver-src.tar.gz"
	"https://archive.apache.org/dist/$pkgname/$pkgver/apache-$pkgname-$pkgver-src.tar.gz.asc"
        "nutch-rest.service"
	"nutch-webapp.service"
	"StartNutchServerRest.bash"
	"StartNutchServerWebApp.bash"
	)

# I am keeping this here to remind me about the future
# backup=(opt/solr/server/etc/jetty{,-http,-https,-ssl}.xml
#        opt/solr/server/etc/webdefault.xml
#        opt/solr/server/solr/solr.xml
#        opt/solr/server/solr/zoo.cfg)

install="$pkgname.install"
options=(!strip)

sha512sums=('6abae11990f4bd6c71e06105e05c976fcc67e2829387863f052a66492e538fbe41ca095c891ca726c0b85c6ff27d153f89cb40fcb73830d48fd1de706179055f'
            'e0f0b587c4a5759181779cb5721fde83479dd31387aa76b0e377c486eb46e94290b35299670eea2bf8bea5c2d5ce312328994604d55cb5f6458f3d8eb563a262'
	    '6bd806037b1d15ec57b991ddf2ff02b57b983abb864140ca753689fa963b22a6553c99b4b2bd10faf82780fc511ab5b4ba257cbbaf731c9a2a5d702084e8eb3d'
	    '4b5455dd395ce01be17ab6ed79cd764e68307ba606d104df2843982d86c77a3ddea8aba48736fe9627233124fd8dabaf55b160eb6a044889263b8b0bec5dd69d'
	    'dd8b89087eb33e32faea757bf22556aa0e31c200f74953dfa1b1251429a2d7a5c84f6ce1294b1c7560fe26d87833d581d07df346297b3fb003dae3e7408017ad'
	    '256db0d75cc15bda5114032392f8d62755e8ecda0d08114326cd4ddfcd6b17ec0ccdc1e6eb6905cdb6d3a118220ac4157941c61d03cbb07f2604c03f3d242360'
	    )
build() {
  cd "$srcdir/apache-$pkgname-$pkgver"
#  rm *.cmd
#  rm install_solr_service.sh
#  rm -rf init.d
  ant
}

package() {
  cd "$srcdir/"
  chmod +x StartNutchServerRest.bash
  chmod +x StartNutchServerWebApp.bash
  cd "$srcdir/apache-$pkgname-$pkgver/runtime/local"
  mkdir -p "$pkgdir"/opt/nutch
  cp -R * "$pkgdir"/opt/nutch
  cp "$srcdir/StartNutchServerRest.bash" "$pkgdir/opt/nutch/bin/"
  cp "$srcdir/StartNutchServerWebApp.bash" "$pkgdir/opt/nutch/bin/" 
  chown -R 115:115 "$pkgdir/opt/nutch"
  install -Dm644 "$srcdir/nutch-rest.service" "$pkgdir/usr/lib/systemd/system/nutch-rest.service"
  install -Dm644 "$srcdir/nutch-webapp.service" "$pkgdir/usr/lib/systemd/system/nutch-webapp.service"
}
