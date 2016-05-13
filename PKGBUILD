# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=alacryd-git
pkgver=20160513
pkgrel=1
pkgdesc="Expedient Perl6 module installation"
arch=('any')
depends=('perl6')
makedepends=('git')
groups=('perl6')
url="https://github.com/atweiden/alacryd"
license=('UNLICENSE')
source=(git+https://github.com/atweiden/alacryd
        git+https://github.com/timo/json_fast)
sha256sums=('SKIP' 'SKIP')
provides=('alacryd')
conflicts=('alacryd')
install=alacryd.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg2 'Copying JSON::Fast into lib for bootstrapping...'
  find "$srcdir/json_fast/lib" -exec cp -dpr --no-preserve=ownership '{}' lib \;
}

check() {
  cd ${pkgname%-git}

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 UNLICENSE -t "$pkgdir/usr/share/licenses/alacryd"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/alacryd"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/perl6/vendor"
  export RAKUDO_LOG_PRECOMP=1
  PERL6LIB=lib perl6 \
    -I"inst#$pkgdir/usr/share/perl6/vendor" \
    -MAlacryd -e 'install()'

  msg2 'Removing redundant precomp file dependencies...'
  _precomp=($(pacman -Qqg perl6 | pacman -Qql - | grep -E 'dist|precomp' || true))
  for _pc in "${_precomp[@]}"; do
    [[ -f "$pkgdir/$_pc" ]] && rm -f "$pkgdir/$_pc"
  done

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name "*.lock" -exec rm '{}' \;
  find "$pkgdir" -type f -print0 | xargs -0 sed -i "s,$pkgdir,,g"
  find "$pkgdir" -type f -print0 | xargs -0 sed -i "s,$srcdir,,g"
}
