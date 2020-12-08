# Maintainer: Greg Hurrell <greg@hurrell.net>
pkgname=clipper-git
pkgver=2.0.0_20_g3ab426d
pkgrel=2
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
  'e9f238ab3619091b3e191570f4cee46ecb56063d77dc7677bbe6f5b1013b901a'
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
