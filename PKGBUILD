# Maintainer: Vyacheslav Konovalov <echo dnlhY2hrb25vdmFsb3ZAZ21haWwuY29tCg== | base64 -d>

pkgname=freelan
pkgver=2.2
pkgrel=1
pkgdesc='A peer-to-peer, secure, easy-to-setup, multi-platform, open-source, highly-configurable VPN software.'
arch=('any')
url='https://freelan.org/'
license=('GPL')
depends=('boost' 'curl' 'miniupnpc' 'openssl')
makedepends=('git' 'scons')
source=("git+https://github.com/freelan-developers/freelan.git#tag=$pkgver"
        'patch.diff'
        'freelan.service')
sha256sums=('SKIP'
            '1258e88654dad23fc6defbe6e043e1ac77ef56d0f96f053e97ea775910ca664d'
            '8c1682c420b8e4291d486e073e339dd312af8033d59b7c5eaaada5c5e9bf4770')

prepare() {
  cd "$srcdir/freelan"
  git apply ../patch.diff
}

build() {
  cd "$srcdir/freelan"
  scons samples --mode=release
}

package() {
  cd "$srcdir/freelan"
  scons --mode=release install prefix="$pkgdir" bin_prefix="$pkgdir/usr"
  install -Dm644 "$srcdir/freelan.service" "$pkgdir/usr/lib/systemd/system/freelan.service"
  install -Dm644 "$srcdir/freelan/LICENSE" "$pkgdir/usr/share/licenses/freelan/LICENSE"
}
