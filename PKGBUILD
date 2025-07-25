# Maintainer: tarball <bootctl@gmail.com>

pkgbase=ttf-iosevka-low
pkgname=(
  "$pkgbase"
  "$pkgbase-slab"
)
pkgver=33.2.7
pkgrel=1
pkgdesc='Custom build of Iosevka with lower line height (1.1 rem)'
arch=('any')
url='https://typeof.net/Iosevka'
license=('OFL-1.1')
makedepends=('nodejs' 'npm' 'ttfautohint')
source=("$pkgname-$pkgver.zip::https://github.com/be5invis/Iosevka/archive/refs/tags/v$pkgver.tar.gz"
        "private-build-plans.toml")
sha256sums=('ce176e4d7b7c0ac49210911af3c5216cf65113ca15082d9ec89110ed6cb7b62f'
            '2490dffd783e88ffd57689cb0f39eccfc58d916a757bbf0222aa1dfd9f121770')

prepare() {
  cd "$srcdir/Iosevka-$pkgver"
  npm install
  cp ../private-build-plans.toml .
}

# skip build(), avoid wasting time on unused variants
_package() {
  local _var="IosevkaLow$1"
  cd "$srcdir/Iosevka-$pkgver"
  npm run build -- ttf::"$_var"
  install -Dvm644 "dist/$_var/TTF"/*.ttf -t "$pkgdir/usr/share/fonts/$_var/"
  install -Dvm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_ttf-iosevka-low() {
  _package ''
}

package_ttf-iosevka-low-slab() {
  _package Slab
}
