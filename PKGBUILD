# Maintainer: Rinne <aur@rinne.in>
pkgname=your-szu-life-git
pkgver=20261024.r572cce5
pkgrel=1
pkgdesc='Shenzhen University campus life application (git)'
arch=('x86_64')
url='https://github.com/rinnein/your-szu-life'
license=('MIT')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3')
provides=('your-szu-life')
conflicts=('your-szu-life-bin' 'your-szu-life')
makedepends=('base-devel' 'git' 'pnpm' 'rust' 'libarchive')
source=("$pkgname::git+https://github.com/rinnein/your-szu-life.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Must agree with the version auto-aur publishes: UTC date + short sha.
  printf '%s.r%s\n' \
    "$(TZ=UTC git log -1 --date=format-local:%Y%m%d --format=%cd)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  pnpm install --frozen-lockfile
  pnpm tauri build --ci --bundles deb

  local debs=(src-tauri/target/release/bundle/deb/*.deb)
  if (( ${#debs[@]} != 1 )); then
    error "expected one Debian package, found ${#debs[@]}"
    return 1
  fi
  rm -rf "$srcdir/package-root"
  bsdtar -xf "${debs[0]}" data.tar.* -O | bsdtar -xf - -C "$srcdir/package-root"
}

package() {
  cp -a "$srcdir/package-root/usr" "$pkgdir/"
}
