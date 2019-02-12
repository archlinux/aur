# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thayne McCombs <astrothayne@gmail.com>
pkgname=dart-sass
pkgver=1.17.0
pkgrel=1
pkgdesc="Sass makes CSS fun again (canonical implementation)"
arch=(any)
url="http://sass-lang.com/"
license=('MIT')
depends=(dart bash)
provides=('sass')
conflicts=('ruby-sass')
source=("https://github.com/sass/$pkgname/archive/$pkgver.tar.gz" "sass.sh")
sha256sums=('de2d05331cfcfb0dde57cb317882cae0d3da1dfce2142ab4a9ee2ade81202c77'
            'c3e819565846dba5e7dc855e1e3a8988c3fca782fac47858396604ae8e438567')

build() {
  cd "$pkgname-$pkgver"
  pub get
  # Create snapshot
  # This doesn't use the grinder script so it is compatible with dart 2
  dart --snapshot=sass.snapshot --snapshot-kind=app-jit bin/sass.dart tool/app-snapshot-input.scss > /dev/null
}

package() {
  install -D -m755 sass.sh "$pkgdir/usr/bin/sass"
  cd "$pkgname-$pkgver"
  install -D -m644 sass.snapshot "$pkgdir/usr/lib/sass/app.snapshot"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
