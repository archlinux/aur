# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>

# The compositor and the reference greeter, which is the only one with no
# toolkit dependency — so this package builds with nothing but the display
# stack. The GTK, WebKitGTK and Qt greeters are separate AUR packages precisely
# so that installing one does not make you build the others, and so that `wdm`
# itself never drags GTK4, WebKitGTK or Qt 6 into a build chroot.
# `wdm-wayland` rather than `wdm` because the AUR name `wdm` belongs to the
# WINGs Display Manager. The binary, unit, and config paths are still `wdm`,
# hence the provides/conflicts on the main package.
pkgbase=wdm-wayland
pkgname=('wdm-wayland' 'wdm-greeter')
pkgver=0.9.0
pkgrel=1
pkgdesc='A Wayland display manager that is its own compositor'
arch=('x86_64' 'aarch64')
url='https://github.com/quinnjr/wdm'
license=('MIT')
makedepends=('cargo' 'libinput' 'seatd' 'systemd-libs' 'mesa' 'libdrm'
             'libxkbcommon' 'pam')
source=("wdm-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# The published tarball's checksum, not one computed from a local `git archive`:
# GitHub's generated archives are not byte-reproducible from the repository, so
# a locally derived value fails integrity checking for everyone else. All four
# wdm packages build from this one tarball and share this one value. Regenerate
# with `updpkgsums` after each tag, before publishing.
#
# Never SKIP. SKIP would let makepkg accept whatever arrives, which for a source
# that is a URL is the wrong failure — a tarball substituted upstream would be
# built and installed without a word.
sha256sums=('49e70b577665bf4fb7c78f5d9319febaf0a8268a80bdb8eb01ff95ed0db8b9f7')

# The tarball is the whole workspace whatever the pkgbase is, so the source
# directory is named for the project rather than for this package.
_src="wdm-$pkgver"

prepare() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Only this package's crates. A bare `cargo build` would compile the GTK and
  # WebKitGTK greeters too, which is what forced this package to build-depend on
  # both toolkits before the AUR packaging was split.
  #
  # Not --all-targets: nothing installed here is a test, example or bench, and
  # check() builds the test targets itself.
  cargo build --frozen --release -p wdm -p wdm-greeter
}

check() {
  cd "$_src"
  export RUSTUP_TOOLCHAIN=stable
  # Scoped for the same reason as build(); the toolkit greeters are tested by
  # their own packages. wdm-protocol is here because both crates depend on it
  # and nothing else in this package would exercise it.
  #
  # Tests are in-file unit tests; a few read the real passwd database and the
  # session directories, and assert invariants rather than specific contents,
  # so they are safe in a clean chroot.
  cargo test --frozen --release -p wdm -p wdm-greeter -p wdm-protocol
}

package_wdm-wayland() {
  # wdm needs *a* greeter, and each of the four provides the virtual, so pacman
  # prompts for a choice when only `wdm` is requested. Three of the four now live
  # in other AUR packages; pacman resolves a virtual regardless of which pkgbase
  # provides it, and `wdm-greeter` below satisfies it with no toolkit at all.
  # The greeters deliberately do not depend on wdm in return: that would make
  # the pair circular.
  #
  # The virtual is declared only in the greeter package_*() functions, never at
  # pkgbase level — a pkgbase provides= is inherited by every split package, and
  # `unset provides` cannot be expressed in .SRCINFO, since makepkg emits no
  # clearing line, so a helper resolving from .SRCINFO would see `wdm` providing
  # the virtual it depends on and install no greeter at all.
  #
  # namcap reports "Split PKGBUILD needs additional makedepends
  # ['wdm-greeter-implementation']" for the dependency below. It is a false
  # positive — namcap does not resolve a virtual provided by a sibling package,
  # and adding it to makedepends would make the package unbuildable, since
  # nothing in the repositories provides it.
  depends=('libinput' 'seatd' 'systemd-libs' 'mesa' 'libdrm' 'libxkbcommon'
           'pam' 'wdm-greeter-implementation')
  provides=('wdm')
  conflicts=('wdm')
  optdepends=('wdm-gtk-greeter: GTK4 greeter'
              'wdm-webkit-greeter: WebKitGTK greeter, themed in HTML and CSS'
              'wdm-plasma-greeter: Qt6/QML greeter, themed in QML')
  backup=('etc/pam.d/wdm' 'etc/wdm/wdm.toml')
  install=wdm.install

  cd "$_src"

  install -Dm755 target/release/wdm "$pkgdir/usr/bin/wdm"

  # PAM is required, not optional: without it every login attempt fails with
  # "Authentication failure".
  install -Dm644 packaging/pam.d-wdm "$pkgdir/etc/pam.d/wdm"
  install -Dm644 packaging/wdm.service "$pkgdir/usr/lib/systemd/system/wdm.service"

  # The shipped example is a working configuration, so it is installed as the
  # config rather than as documentation.
  install -Dm644 packaging/wdm.toml.example "$pkgdir/etc/wdm/wdm.toml"

  # wdm.service's Documentation= already points at man:wdm(1), so shipping the
  # page is what makes `systemctl help wdm` resolve to something.
  install -Dm644 packaging/wdm.1 "$pkgdir/usr/share/man/man1/wdm.1"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

  # Shared with the deb and rpm packaging rather than written inline here, so
  # the three cannot drift apart on who the greeter account is.
  install -Dm644 packaging/wdm.sysusers "$pkgdir/usr/lib/sysusers.d/wdm.conf"
  install -Dm644 packaging/wdm.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/wdm.conf"
}

package_wdm-greeter() {
  pkgdesc='Reference greeter for wdm, software-rendered with no toolkit'
  # Deliberately does not depend on wdm: wdm depends on the virtual this
  # provides, and naming wdm here would make the pair circular.
  depends=('libxkbcommon')
  provides=('wdm-greeter-implementation')
  backup=('etc/wdm/greeter.toml')

  cd "$_src"
  install -Dm755 target/release/wdm-greeter "$pkgdir/usr/lib/wdm/wdm-greeter"
  # Fully commented out, so the defaults are also the documentation. In
  # backup= above so pacman delivers a changed default as a .pacnew instead
  # of clobbering an edited one.
  install -Dm644 packaging/greeter.toml.example "$pkgdir/etc/wdm/greeter.toml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
