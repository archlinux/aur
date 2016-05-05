# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Frederik AlkÃ¦rsig (FALKER) <havnelisten AT gmail.com>

pkgname=thinkfan
pkgver=0.9.3
pkgrel=1
pkgdesc="A minimalist fan control program. Supports the sysfs hwmon interface and thinkpad_acpi"
url="http://thinkfan.sourceforge.net/"
arch=('i686' 'x86_64')
makedepends=('cmake')
depends=('libatasmart')
optdepends=('lm_sensors: hwmon support')
license=('GPL')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz
        'thinkfan.service'
        'thinkpad_acpi.conf')
sha256sums=('b61c634996c450445d7e440bf41f7adcda86506063f832afa40d44e01061e45b'
            '90f0270b4044a41315feb7bc1447ce4a0d5ee50178682e9a1d2a36b07c1a494f'
            '28874576641b3cc1aa486e1bc9ed40eadfe8b13d6d3014016e31fedc5dc5195f')
install=thinkfan.install

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DUSE_ATASMART:BOOL=ON
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d -m755 "$pkgdir"/usr/{bin,lib/{modprobe.d,systemd/system},share/{doc/"$pkgname"/{,examples},man/man1}}
  install -D -m755 "$pkgname" "$pkgdir"/usr/bin
  install -D -m644 README NEWS "$pkgdir"/usr/share/doc/"$pkgname"
  install -D -m644 examples/* "$pkgdir"/usr/share/doc/"$pkgname"/examples
  install -D -m644 src/"$pkgname".1 "$pkgdir"/usr/share/man/man1
  install -D -m644 ../"$pkgname".service "$pkgdir"/usr/lib/systemd/system
  install -D -m644 ../thinkpad_acpi.conf "$pkgdir"/usr/lib/modprobe.d
}

# vim:set ts=2 sw=2 noet:
