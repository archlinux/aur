# Maintainer: Greg Hurrell <greg@hurrell.net>
pkgname=clipper-git
pkgver=2.0.0_15_ge6fd460
pkgrel=1
pkgdesc="Clipboard access for local and remote tmux sessions"
arch=(x86_64)
url="https://github.com/wincent/clipper"
license=('BSD')
depends=('glibc')
makedepends=(
  'git'
  'go'
)
optdepends=('xclip: access to X11 clipboard')
source=(
  "${pkgname}::git+https://github.com/wincent/clipper.git"
  "service-path.patch"
)
sha256sums=(
  'SKIP'
  '2295aa32f28f1aeeec1ddb375fd8bf0e138d58f239bc00634df7d1f71b04ba5e'
)

prepare() {
  cd "$pkgname"
  echo "$LDFLAGS"
  git reset --hard master
  patch --strip 1 --input="${srcdir}/service-path.patch"
}

pkgver() {
  cd "$pkgname"
  git describe | sed s/-/_/g
}

build() {
  cd "$pkgname"
  LDFLAGS="-extldflags \"${LDFLAGS}\"" make DESTDIR="$pkgdir" PREFIX=/usr build
}

check() {
  true
}

package() {
  cd "$pkgname"
  LDFLAGS="-extldflags \"${LDFLAGS}\"" make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 contrib/linux/systemd-service/clipper.service "$pkgdir/usr/lib/systemd/system/clipper.service"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/clipper-git/LICENSE"
}
