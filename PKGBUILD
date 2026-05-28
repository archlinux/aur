# Maintainer: Aaron Coach <aur@awc.id.au>

pkgname=koito
_pkgname=Koito
pkgver=0.3.1
pkgrel=1
pkgdesc='Modern, themeable scrobbler that you can use with any program that scrobbles to ListenBrainz'
arch=('x86_64')
url='https://koito.io/'
license=('MIT')
depends=('libvips' 'libheif' 'imagemagick' 'openslide' 'poppler-glib')
install=koito.install
backup=('etc/koito.env')
makedepends=('go' 'npm' 'yarn' 'nodejs>=16' 'corepack')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/gabehf/Koito/archive/refs/tags/v$pkgver.tar.gz"
  "koito.service"
  "koito.env"
)
sha256sums=('0ceb6f933fe8000eab711f565f875a55aebd175038fee8abf99931062cb6dbdb'
            'f82dc31307d11b402dc1a3466aee6b5cb8a4560105e3595ef411e7f4e1fdea43'
            'd9cc7b0adcf4ee0094388697ddd5645cc8c76252985fd71a03c1d4d7a904bcfd')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # --- Corepack Sandbox Setup ---
  mkdir -p "$srcdir/corepack-bin"
  export COREPACK_HOME="$srcdir/.corepack"
  corepack enable --install-directory "$srcdir/corepack-bin"
  export PATH="$srcdir/corepack-bin:$PATH"
  # ------------------------------

  export VITE_KOITO_VERSION="$pkgver"
  export BUILD_TARGET="docker"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  sed -i "s/-ldflags='-s -w'/-ldflags='-linkmode=external -X main.Version=$pkgver'/g" Makefile

  make build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -Dm755 koito "$pkgdir"/usr/bin/koito

  install -d "$pkgdir/usr/share/koito"
  cp -a assets client \
    "$pkgdir/usr/share/koito/"

  install -Dm0640 ../koito.env "$pkgdir"/etc/koito.env
  install -Dm0644 ../koito.service "$pkgdir"/usr/lib/systemd/system/koito.service
}
