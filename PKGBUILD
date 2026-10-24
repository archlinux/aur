# Maintainer: Rinne <aur@rinne.in>
pkgname=your-szu-life-git
pkgver=20261024.r572cce5
pkgrel=3
pkgdesc="泥深 - 你的SZU助手（自动描述测试）"
arch=('x86_64')
url='https://github.com/rinnein/your-szu-life'
license=('MIT')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3' 'aria2')
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
  # A .deb is an ar archive holding control.tar.* and data.tar.*; the payload
  # has to be unpacked in two steps (bsdtar -O cannot stream a named member).
  rm -rf "$srcdir/package-root"
  mkdir -p "$srcdir/package-root"
  cd "$srcdir"
  local inner
  inner=$(bsdtar -tf "${debs[0]}" | grep -E '^data\.tar\.')
  if [[ -z "${inner}" ]]; then
    error "no data.tar.* inside ${debs[0]}"
    return 1
  fi
  bsdtar -xf "${debs[0]}" "${inner}"
  bsdtar -xf "${inner}" -C "$srcdir/package-root"
  rm -f "${inner}"
}

package() {
  cp -a "$srcdir/package-root/usr" "$pkgdir/"
  # Drop the bundled aria2c: it collides with the aria2 package and needs a
  # libaria2.so.0 that this package does not ship.
  rm -f "${pkgdir}/usr/bin/aria2c"
}
