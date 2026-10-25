# Maintainer: Inox contributors <https://github.com/Inox-desktop/inox>
#
# GENERATED FILE — the source of truth is packaging/aur/PKGBUILD.in in
# https://github.com/Inox-desktop/inox. It is rendered by packaging/aur/publish.sh
# and published by .github/workflows/release.yml after a GitHub Release is
# created. Editing the published copy in the AUR repository by hand achieves
# nothing: the next release overwrites it.
#
# Two AUR packages share this recipe (decision: docs/adr/0043):
#
#   inox          stable tags   vX.Y.Z
#   inox-canary   pre-releases  vX.Y.Z-canary.N (also -alpha/-beta/-rc/-dev)
#
# AUR forbids hyphens in pkgver, so a pre-release tag is rendered with `_` where
# the tag has `-` (0.1.1-canary.2 -> pkgver 0.1.1_canary.2). The tag itself is
# still the upstream one, see the source= URL below.
#
# This package builds from the tagged source tree. It is deliberately NOT a
# `-bin` package built from the release tarball: that tarball is linked against
# the Ubuntu runner's glibc/Qt, and an Arch user needs a binary linked against
# Arch's own system libraries.
#
# `check()` is load-bearing. inox-compositor has a `test-input` feature that
# compiles a socket accepting injected keyboard and pointer events; a binary a
# user runs must not carry it. `cargo build` below therefore uses the default
# feature set, and check() runs the built compositor to prove it rejects the
# option — the same assertion packaging/package.sh makes for the release tarball
# (ADR 0042 §4). Compiling it out is not provable from the source tree alone.

pkgname=inox-canary
pkgver=0.1.1_canary.1
pkgrel=1
pkgdesc="Canary channel of the Inox Wayland desktop environment"
arch=('x86_64')
url="https://github.com/Inox-desktop/inox"
license=('LGPL-3.0-only')
depends=(
  'gcc-libs'
  'libdrm'
  'libinput'
  'libxkbcommon'
  'mesa'
  'pam'
  'qt6-base'
  'qt6-declarative'
  'seatd'
  'systemd-libs'
  'wayland'
  'xkeyboard-config'
)
makedepends=(
  'clang'
  'lld'
  'rust'
)
provides=('inox')
conflicts=('inox')
optdepends=(
  'greetd: fall back to greetd when the Inox login screen cannot start'
  'xwayland-satellite: run X11 applications inside an Inox session'
)
# `lto` must stay off, and this is not a preference.
#
# makepkg's default OPTIONS include `lto`, which appends `-flto=auto` (LTOFLAGS)
# to CFLAGS, CXXFLAGS *and* LDFLAGS. cxx-qt compiles the Rust<->C++ bridge with
# that C++ compiler, so with LTO on those object files become GCC LTO bytecode:
# `.gnu.lto_*` sections, `nm` reports "no symbols". Rust links the final binary
# through rust-lld (qt-build-utils selects it), and rust-lld cannot read GCC's
# LTO bytecode, so every `cxxbridge1$…` / `cxx_qt_init_*` definition in
# libcxx-qt-lib-cxxqt-generated.a becomes an undefined symbol and the link fails
# for inox-lock, inox-settings, inox-greet, inox-launcher and inox-qml-prototype.
#
# This is verified, not inferred: building the same tag with `-flto=auto` in
# CFLAGS/CXXFLAGS/LDFLAGS reproduces the undefined-symbol link failure, and the
# same build without it succeeds. Turning lto off for this package is the
# supported path; an LTO-linking C++ toolchain that rust-lld understands does not
# exist yet.
options=('!lto')

# The install hook only prints how to switch the boot chain; it enables nothing.
install=inox.install
source=("inox-canary-0.1.1_canary.1.tar.gz::https://github.com/Inox-desktop/inox/archive/refs/tags/v0.1.1-canary.1.tar.gz")
sha256sums=('0a344061b71e576fa2af29dce7a24ca5146591f203e89d3aab0b4684568d1b99')

# GitHub's tag archive extracts to <repository>-<tag without the leading v>.
_srcdir_name='inox-0.1.1-canary.1'

build() {
  cd "$srcdir/$_srcdir_name"
  # Default features, whole workspace: the same build the release tarball is made
  # from (packaging/package.sh). Two build definitions would be two artifacts that
  # can drift apart. `--locked` builds from the committed Cargo.lock, which is the
  # project's compatibility record.
  #
  # Do not add `--all-features` here: it compiles inox-compositor/test-input,
  # the input-injection socket, into the binary this package installs.
  cargo build --release --locked --workspace
}

check() {
  cd "$srcdir/$_srcdir_name"
  local probe="$srcdir/test-input-probe.sock"
  local log="$srcdir/test-input-probe.log"
  local status=0
  # The timeout is load-bearing: a compositor built WITH the feature accepts the
  # option and starts an event loop that never returns. Without the timeout this
  # check would hang the build instead of failing it.
  timeout 30 ./target/release/inox-compositor --test-input "$probe" >"$log" 2>&1 || status=$?
  if [ "$status" -eq 0 ]; then
    error "inox-compositor accepted --test-input: this build carries the input-injection feature and must not be packaged"
    return 1
  fi
  if [ "$status" -eq 124 ]; then
    error "inox-compositor did not refuse --test-input within 30 s: it started instead"
    return 1
  fi
  if ! grep -q 'test-input' "$log"; then
    error "inox-compositor refused --test-input but did not say why; expected an error naming it"
    cat "$log" >&2
    return 1
  fi
  msg "inox-compositor rejects --test-input: this is a default-features build"
}

package() {
  cd "$srcdir/$_srcdir_name"

  # The 14 shipped binaries. inox-integration (test aggregator) and
  # inox-qml-prototype (binding prototype) are built by --workspace but not
  # installed: they are not part of a desktop.
  local binary
  local binaries=(
    inox-auth
    inox-host
    inox-compositor
    inox-greet
    inox-session
    inox-shell
    inox-panel
    inox-lock
    inox-wallpaper
    inox-notifications
    inox-idle
    inox-xwayland
    inox-launcher
    inox-settings
  )
  install -d "$pkgdir/usr/bin"
  for binary in "${binaries[@]}"; do
    install -m 0755 "target/release/$binary" "$pkgdir/usr/bin/$binary"
  done

  install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Bundled wallpapers are runtime data: inox-wallpaper and inox-settings look
  # them up under <datadir>/inox/wallpapers, so a package without them installs a
  # desktop whose wallpaper chooser is empty.
  install -d "$pkgdir/usr/share/inox/wallpapers"
  install -m 0644 data/wallpapers/* "$pkgdir/usr/share/inox/wallpapers/"

  # The login chain's PAM stacks, three files for three different jobs. Missing
  # any of them turns a correct password into a session that ends immediately,
  # which on the login screen looks exactly like a rejected password.
  install -Dm 0644 packaging/pam.d/inox-auth "$pkgdir/etc/pam.d/inox-auth"
  install -Dm 0644 packaging/pam.d/inox-auth-session "$pkgdir/etc/pam.d/inox-auth-session"
  install -Dm 0644 packaging/pam.d/inox-greeter "$pkgdir/etc/pam.d/inox-greeter"

  install -Dm 0644 packaging/systemd/inox-auth.service \
    "$pkgdir/usr/lib/systemd/system/inox-auth.service"
  install -Dm 0644 packaging/systemd/inox-greeter@.service \
    "$pkgdir/usr/lib/systemd/system/inox-greeter@.service"
  install -Dm 0644 packaging/systemd/inox-login-fallback.service \
    "$pkgdir/usr/lib/systemd/system/inox-login-fallback.service"

  # The greeter's system account, created by pacman's systemd-sysusers hook. It
  # must stay identical to packaging/install.sh's useradd --system invocation: a
  # different shell or home directory would make the two installation routes
  # produce different accounts.
  install -Dm 0644 packaging/sysusers/inox.conf \
    "$pkgdir/usr/lib/sysusers.d/inox.conf"
}
