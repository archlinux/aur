# Maintainer: WindustH <windusth2006@gmail.com>

_pkgname=wish-agent
pkgname=$_pkgname-git
pkgver=0.2.0.r0.gced6623
pkgrel=1
pkgdesc="Self-hosted AI agent server and web app: long-lived sessions, shell tools and many model providers"
arch=('x86_64' 'aarch64')
url="https://github.com/WindustH/wish-core"
license=('MIT')
depends=('glibc' 'libgcc')
# The web app's build fetches its pinned packages and fonts, and subsets the fonts.
makedepends=('git' 'cargo' 'nodejs' 'corepack' 'python' 'python-fonttools' 'python-brotli' 'python-numpy' '7zip')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin" 'tk')
options=('!lto' '!debug')
source=("wish-core::git+https://github.com/WindustH/wish-core.git"
        "wish-web::git+https://github.com/WindustH/wish-web.git"
        "wish-agent.service")
sha256sums=('SKIP'
            'SKIP'
            '932ff80ab90865dbeb39168c36293738af32ec5f197c7630930d0a54c2bac0d0')

pkgver() {
  cd wish-core
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd wish-web
  ./pnpmw install --frozen-lockfile
  # Downloads the pinned fonts into .cache; the build reuses them.
  python3 tools/fonts.py
  cd ../wish-core
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd wish-web
  ./pnpmw build
  cd ../wish-core
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  # The program finds its web app beside it; /usr/bin holds a link. Tk's `wish` is the same path.
  install -Dm755 wish-core/target/release/wish "$pkgdir/usr/lib/$_pkgname/wish"
  cp -r wish-web/dist "$pkgdir/usr/lib/$_pkgname/web"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname/wish" "$pkgdir/usr/bin/wish"
  install -Dm644 wish-agent.service "$pkgdir/usr/lib/systemd/user/wish-agent.service"
  install -Dm644 wish-core/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 wish-core/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
