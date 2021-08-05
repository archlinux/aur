# Maintainer: Greg Hurrell <greg@hurrell.net>
pkgname=clipper-git
pkgver=2.0.0_11_gecb7766
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
  "service.patch"
)
sha256sums=('SKIP'
            '5cdc4f5262ca69c8530813e6a4b2555cf2b30d8c6489d45a16b7d94f1655a354')

prepare() {
  cd "$pkgname"
  echo "$LDFLAGS"
  git reset --hard main
  patch --strip 1 --input="${srcdir}/service.patch"
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
  install -Dm755 clipper "$pkgdir/usr/bin/clipper"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/clipper-git/LICENSE"
  install -Dm644 contrib/linux/systemd-service/clipper.service "$pkgdir/usr/share/clipper/clipper.service"
  echo
  echo "A sample systemd service has been installed to /usr/share/clipper/clipper.service"
  echo
  echo "To use it:"
  echo
  echo "    mkdir -p ~/.config/systemd/user"
  echo "    cp /usr/share/clipper/clipper.service ~/.config/systemd/user/clipper.service"
  echo "    systemctl --user daemon-reload"
  echo "    systemctl --user enable clipper.service"
  echo "    systemctl --user start clipper.service"
  echo
}
