# Maintainer: Felix Esch <felix_esch at alice dot de>

# Upstream name of extension:
_extname=Mathoid
# Variant valid as package name without suffix and prefix
_basepkgname=mathoid

pkgname=mediawiki-$_basepkgname-git
pkgver=0.2.4.r1713.g1706720
pkgrel=4
pkgdesc="Service for creating MathMl and SVGs."
install="mediawiki-mathoid.install"
source=("git+https://gerrit.wikimedia.org/r/mediawiki/services/$_basepkgname"
        "mathoid.service")
sha256sums=('SKIP'
            '8a7d362ac475319356412c09dd4067bc46006940c86fa7c259b4f55e95ad040b')
arch=("any")
url="https://www.mediawiki.org/wiki/$_extname"
license=("GPL")
depends=(nodejs)
optdepends=("mediawiki-math: Extension that can use Mathoid.")
makedepends=(git npm)
provides=("mediawiki-$_basepkgname")
conflicts=("mediawiki-$_basepkgname")
backup=("usr/share/webapps/mediawiki/services/mathoid/config.yaml")

pkgver() {
  cd "$_basepkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/.*\///'
}

package() {
  # Target service directory of MediaWiki:
  _extdir="$pkgdir/usr/share/webapps/mediawiki/services"
  mkdir -p "$_extdir" "$pkgdir/usr/lib/systemd/system"
  mv $_basepkgname "$_extdir/"
  rm -r $_extdir/$_basepkgname/.git
  cp mathoid.service "$pkgdir/usr/lib/systemd/system/mathoid.service"
}

build() {
  cd "$srcdir/$_basepkgname"
  npm install
}
