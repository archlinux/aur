# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=screamingfrogseospider
pkgver=24.0
pkgrel=1
pkgdesc="spiders websites’ links, images, CSS, script and apps from an SEO perspective."
arch=('x86_64' 'i686')
url="https://www.screamingfrog.co.uk/seo-spider/"
license=('custom')
depends=('java-runtime-openjdk>=17' 'ttf-font')
makedepends=('tar' 'python')
source=(
  "screamingfrogseospider_${pkgver}_all.deb::https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${pkgver}_all.deb?noredirect"
  "LICENSE"
  "screamingfrogseospider"
  "patch-java-check.py"
)
b2sums=('b804bfda181ab2cb84419edce3be33051ad81c20c45bf69d5fde735fbd268d13ca285e9e90ecd03a54dd550eccd4767a6c3dde6f75023d6e78c3057b98925031'
        '6cde786ef5e5bf0e2d1cb9403eb9bbe6923731e22263e1cd2b3c3f0258d6efb4151eba5b59ee9e87894d17af75f1f72509bd389d1425a9fcab37ba51d9b50cd7'
        '354e603d6eb1a2a2c47905ab79f1e47be345215815d0f37fbd998aeb209c94aa857b7aaef32e31f2289764e67a9d156fd5070ae21f5b553a7805f8673e3ed17e'
        '297204e5385359137534c7e031da006b510915140cc5e35b18cde0a12dc1b1eed1281d76420a7563df13df97d7d55eec7aa1671f97a973f7333664d59714d5d5')

build() {
  msg "Extracting deb data..."
  tar xf "$srcdir/data.tar.xz" -C "$srcdir"
  rm -rf "$srcdir/usr/share/screamingfrogseospider/jre"
  rm "$srcdir/usr/bin/screamingfrogseospider"

  msg "Patching Java vendor check to work with OpenJDK..."
  python3 "$srcdir/patch-java-check.py" "$srcdir/usr/share/screamingfrogseospider/ScreamingFrogSEOSpider.jar"
}

package() {
  cp -dpr --no-preserve=ownership "$srcdir/usr" "$pkgdir"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "$srcdir/screamingfrogseospider" "$pkgdir/usr/bin/screamingfrogseospider"
}

# vim:set ts=2 sw=2 et:
