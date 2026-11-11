# Maintainer: Jingrong Chen <crazyboycjr at gmail dot com>
#
# The repository's packaging/arch/PKGBUILD builds its working tree with the
# same dependencies, check() and package(); keep the two alike, and this
# gpui-greeter.install the same as the repository's. To release:
#   1. with the repository public, push the tag v$pkgver to
#      github.com/crazyboycjr/gpui-greeter, and set pkgver here and pkgrel=1;
#   2. updpkgsums, which puts the tarball's sha256 in place of SKIP;
#   3. makepkg --printsrcinfo > .SRCINFO;
#   4. makepkg -f, a test build whose check() runs the tests, and
#      namcap PKGBUILD gpui-greeter-*.pkg.tar.*;
#   5. git commit -am "gpui-greeter $pkgver", and git push.
pkgname=gpui-greeter
pkgver=1.0.0
pkgrel=1
pkgdesc='A greeter for greetd on X11, drawn with GPUI'
arch=('x86_64')
url='https://github.com/crazyboycjr/gpui-greeter'
# gpui-greeter's code is under Apache-2.0, as is gpui's, whose backends are
# vendored. The bundled fonts are under the SIL Open Font License, whose
# texts are installed.
license=('Apache-2.0' 'OFL-1.1')
depends=('bash' 'glibc' 'greetd' 'greetd-agreety' 'hicolor-icon-theme'
         'libgcc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'pam' 'systemd'
         'vulkan-driver' 'vulkan-icd-loader' 'xorg-server' 'xorg-xinit')
# fontconfig for a build script of gpui's font loading, which the greeter
# does not use at run time.
makedepends=('cargo' 'fontconfig')
optdepends=('accountsservice: avatars, and the session LightDM last used, before the first login here'
            'polkit: gpui-greeter settings asks for the password to apply what root keeps'
            'xdg-desktop-portal: the file dialogs of gpui-greeter settings'
            'noto-fonts-cjk: Chinese text'
            'xorg-server-xvfb: gpui-greeter preview --shot, without a display'
            'vulkan-swrast: drawing previews on the CPU (lavapipe)'
            'xss-lock: gpui-greeter lock on suspend and when idle')
provides=('greetd-greeter')
backup=("etc/$pkgname/config.toml" "etc/greetd/$pkgname.toml" "etc/pam.d/$pkgname-lock")
install=$pkgname.install
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4e0f92a0f2470e44b3cb88bea620479d8779d81eaacb25fd47c71b2597cc4d1b')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Paths in panic messages name the source, not this build's directory.
  export RUSTFLAGS="${RUSTFLAGS-} --remap-path-prefix=$srcdir=/"
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS-} --remap-path-prefix=$srcdir=/"
  # The library's tests; tests/ drives apply-settings --root, which only a
  # debug build takes.
  cargo test --frozen --release --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "dist/$pkgname-switch" "$pkgdir/usr/bin/$pkgname-switch"
  install -Dm644 dist/config.toml "$pkgdir/etc/$pkgname/config.toml"
  install -Dm644 dist/greetd.toml "$pkgdir/etc/greetd/$pkgname.toml"
  install -Dm644 dist/lock.pam "$pkgdir/etc/pam.d/$pkgname-lock"
  install -Dm644 dist/greetd-service.conf \
    "$pkgdir/usr/lib/systemd/system/greetd.service.d/$pkgname.conf"
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" \
    "dist/$pkgname-bing.service" "dist/$pkgname-bing.timer"
  install -Dm644 dist/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm644 "dist/$pkgname-settings.desktop" \
    "$pkgdir/usr/share/applications/$pkgname-settings.desktop"
  # The icon the desktop file names, in every size it is drawn at.
  local file
  while IFS= read -r -d '' file; do
    install -Dm644 "$file" "$pkgdir/usr/share/icons/${file#assets/icon/linux/}"
  done < <(find assets/icon/linux/hicolor -type f -print0)
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" assets/fonts/OFL-*.txt
  # The skill for designing themes with an agent, and its example theme.
  while IFS= read -r -d '' file; do
    install -Dm644 "$file" "$pkgdir/usr/share/$pkgname/$file"
  done < <(find skills -type f -print0)
  install -Dm644 skills/gpui-greeter-theme/dial/fonts/OFL.txt \
    "$pkgdir/usr/share/licenses/$pkgname/OFL-NotoSerifDisplay.txt"
}
