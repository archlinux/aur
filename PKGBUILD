# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-rpi-device-ds18b20
pkgver=0.2.0
pkgrel=1
pkgdesc="Provides support for the DS18B20 family of temperature sensors"
arch=('any')
depends=('perl6' 'perl6-rpi')
checkdepends=('perl')
makedepends=('alacryd' 'git')
groups=('perl6')
url="https://github.com/cspencer/perl6-raspberry-pi-device-ds18b20"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/cspencer/perl6-raspberry-pi-device-ds18b20)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/perl6/vendor"
  export RAKUDO_LOG_PRECOMP=1
  export PERL6LIB="inst#$pkgdir/usr/share/perl6/vendor"
  alacryd install

  msg2 'Removing redundant precomp file dependencies...'
  _precomp=($(pacman -Qg perl6 \
    | awk '{print $2}' \
    | xargs pacman -Ql \
    | awk '{print $2}' \
    | grep precomp))
  for _pc in "${_precomp[@]}"; do
    [[ -f "$pkgdir/$_pc" ]] && rm -f "$pkgdir/$_pc"
  done
  _short=($(pacman -Qg perl6 \
    | awk '{print $2}' \
    | xargs pacman -Ql \
    | awk '{print $2}' \
    | grep short))
  for _s in "${_short[@]}"; do
    [[ -f "$pkgdir/$_s" ]] && rm -f "$pkgdir/$_s"
  done

  msg2 'Removing test bin examples...'
  rm -rf "$pkgdir/usr/share/perl6/vendor/bin"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name "*.lock" -exec rm '{}' \;
  find "$pkgdir" -type f -print0 | xargs -0 sed -i "s,$pkgdir,,g"
}
