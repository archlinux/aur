# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=screamingfrogseospider
pkgver=24.1
pkgrel=1
pkgdesc="spiders websites’ links, images, CSS, script and apps from an SEO perspective."
arch=('x86_64' 'aarch64')
url="https://www.screamingfrog.co.uk/seo-spider/"
license=('custom')
depends=('java-runtime-openjdk>=21' 'ttf-font')
makedepends=('tar' 'python')
source=(
  "LICENSE"
  "screamingfrogseospider"
  "patch-java-check.py"
)
source_x86_64=("screamingfrogseospider_${pkgver}_amd64.deb::https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${pkgver}_amd64.deb")
source_aarch64=("screamingfrogseospider_${pkgver}_arm64.deb::https://download.screamingfrog.co.uk/products/seo-spider/screamingfrogseospider_${pkgver}_arm64.deb")
b2sums=('6cde786ef5e5bf0e2d1cb9403eb9bbe6923731e22263e1cd2b3c3f0258d6efb4151eba5b59ee9e87894d17af75f1f72509bd389d1425a9fcab37ba51d9b50cd7'
        '30d4dae44d6388046bd0ebd1e36b3d4c9889b451ce2ca75483c6cac57813c9f20faeae38be35c7da86917b81802b6b1e1c950fa7bd406242bb4f4e97b63e140e'
        '297204e5385359137534c7e031da006b510915140cc5e35b18cde0a12dc1b1eed1281d76420a7563df13df97d7d55eec7aa1671f97a973f7333664d59714d5d5')
b2sums_x86_64=('0a41099a9cce3da86f026785997b7f809018badc25a3e45adcd7b8cfc6edf2bf7394d2522c0334a630ba6d188e8496118e3eb611f9c1c4597f02f0440ce5e53d')
b2sums_aarch64=('530f57bee353df8a4aea2d7b7fca077e31371489501615ee158c836b4cbd8cbbbf874af7b0ba8d4a028a5e16c2e7e84465e8af2fece489593b2a9e61931a2d38')

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
