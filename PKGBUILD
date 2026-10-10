# Maintainer: Roman <roman at users.noreply.github.com>
# Based on upstream packaging by the Cross-Cleaner authors.
#
# NOTE: the license in this repository (the packaging files) is 0BSD, per the
# AUR submission guidelines. The packaged software itself is GPL-3.0-or-later,
# which is what the license= field below refers to.

# Built from source with the distribution package's own flags, mirroring the
# reasoning in packaging/linux/nfpm.yaml: the package manager owns the installed
# version, so every binary is compiled with --no-default-features and the
# self-update path is not part of the build at all. `crates/desktop`,
# `crates/tui` and `crates/cli` each document this in their own Cargo.toml.

pkgname=cross-cleaner
pkgver=2.0.4.2
pkgrel=5
pkgdesc='Addon-style system cleanup tool that removes temporary files, cache and other system junk'
arch=('x86_64' 'aarch64')
url='https://github.com/Cross-Cleaner/Cross-Cleaner'
license=('GPL-3.0-or-later')
# ~636 crates in the lock file, all of them needed by the window app. Without a
# lower bound the resolver picks a version the sources have never been built
# against; with one, an Arch update that breaks the build is a visible bisect
# rather than a silent surprise.
depends=('gcc-libs'
         'alsa-lib'
         'mesa'
         'libdrm'
         'wayland'
         'wayland-protocols'
         'libx11'
         'libxcursor'
         'libxrandr'
         'libxi'
         'libxinerama'
         'libxrender'
         'libxext'
         'libxkbcommon'
         'libxkbcommon-x11'
         'fontconfig')
# rust, cargo, git, pkgconf and make are base-devel members and so are not
# listed here; they are named above only to record why the build needs them.
makedepends=('icoutils'
             'desktop-file-utils'
             'appstream'
             # alsa-sys, khronos-egl and wayland-sys all resolve their native
             # libraries through pkg-config at compile time, so the -dev side of
             # each has to be present while building, not only afterwards.
             'alsa-lib'
             'mesa'
             'wayland')
optdepends=('gtk-update-icon-cache: update the icon cache without restarting the session')
# VCS package: AUR tracks the upstream repository rather than a release tarball,
# so a new tag is picked up by the orphanage without this file being touched.
source=('git+https://github.com/Cross-Cleaner/Cross-Cleaner.git')
sha256sums=('SKIP')

# The upstream tags carry a `v` prefix only from 2.0 onwards -- 1.9.0 and
# earlier are bare numbers -- so the prefix is stripped rather than required.
# A checkout that is not exactly on a tag gets the usual .rN.gHASH suffix, so
# the version still moves forward when a commit lands between two tags.
pkgver() {
    cd "$srcdir/Cross-Cleaner"
    local tag
    tag=$(git describe --tags --abbrev=0)
    if git describe --tags --exact-match >/dev/null 2>&1; then
        printf '%s' "${tag#v}"
    else
        printf '%s.r%s.g%s' "${tag#v}" \
            "$(git rev-list --count "$tag"..HEAD)" \
            "$(git rev-parse --short HEAD)"
    fi
}

prepare() {
    cd "$srcdir/Cross-Cleaner"

    # crates/winicon/assets/icon.ico holds a single 96px frame, so this is a
    # straight extraction rather than a resize. Unlike the AppImage build, which
    # upscales to 128 and 256 with ImageMagick, nothing is invented here: the
    # one real size is installed as-is. Dropping a >=512px master PNG into
    # crates/winicon/assets is what makes the larger hicolor slots worth filling.
    #
    # Extraction goes to a throwaway directory rather than straight to
    # $srcdir/icons: prepare() has to be idempotent, because makepkg reuses an
    # existing $srcdir whenever only the PKGBUILD changed. Writing the frame
    # next to its destination and then `mv`-ing it onto itself fails the second
    # time round, with "mv: ... and ... are the same file".
    local extract
    extract=$(mktemp -d)
    icotool -x -o "$extract" crates/winicon/assets/icon.ico
    # icotool names its output after the source and the frame's geometry, so
    # glob rather than hardcode the name.
    local frame
    frame=$(find "$extract" -name '*.png' -print -quit)
    if [[ -z "$frame" ]]; then
        rm -rf "$extract"
        printf 'icotool extracted no frame from icon.ico\n' >&2
        return 1
    fi
    install -Dm644 "$frame" "$srcdir/icons/cross-cleaner.png"
    rm -rf "$extract"

    # packaging/linux/cross-cleaner.appdata.xml carries %%VERSION%% and %%DATE%%
    # for the release workflow to fill in. AUR builds from a git checkout rather
    # than a release, so the same substitution happens here, against the
    # resolved pkgver and the commit the source was cloned at.
    sed -e "s/%%VERSION%%/$pkgver/g" \
        -e "s/%%DATE%%/$(date -u -d "@$(git log -1 --format=%ct)" +%Y-%m-%d)/g" \
        packaging/linux/cross-cleaner.appdata.xml > "$srcdir/cross-cleaner.appdata.xml"
    if grep -q '%%' "$srcdir/cross-cleaner.appdata.xml"; then
        printf 'unsubstituted placeholder left in the AppStream metadata\n' >&2
        return 1
    fi

    desktop-file-validate packaging/linux/cross-cleaner.desktop
    desktop-file-validate packaging/linux/cross-cleaner-tui.desktop
    # Non-fatal, matching the release workflow: a metadata lint should be
    # visible without being able to block an install.
    appstreamcli validate --pedantic "$srcdir/cross-cleaner.appdata.xml" || :
}

# One cargo invocation per binary, exactly as .github/workflows/release.yml does
# it. --locked keeps the pinned gpu-allocator git revision from Cargo.toml's
# [patch.crates-io] in place; without it the resolver is free to move, and that
# patch exists precisely because the published 0.28.0 resolves to an incompatible
# windows crate.
build() {
    cd "$srcdir/Cross-Cleaner"

    # Unset the compiler flags makepkg exports, and tell rustc not to read a
    # rustflags setting from anywhere. Arch's CFLAGS
    #
    #   -march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions
    #   -Wp,-D_FORTIFY_SOURCE=3 -fstack-clash-protection -fcf-protection ...
    #
    # are handed to the `cc` crate, which passes them straight to the C compiler
    # that ring's build.rs uses for its crypto core. At least one of them makes
    # that build produce objects whose symbols the final link cannot resolve,
    # and the whole binary then fails to link:
    #
    #   ld.lld: error: undefined symbol: ring_core_0_17_14__x25519_sc_mask
    #   ld.lld: error: undefined symbol: ring_core_0_17_14__aes_nohw_set_encrypt_key
    #   ... every symbol of ring's native core
    #
    # ring's own build.rs output is correct throughout -- it emits both
    # `rustc-link-lib=static=ring_core_0_17_14_` and `rustc-link-search`, and
    # the archive really does contain all 157 symbols. What breaks is the link
    # step, which sees the `-L` search path but not the `-l`.
    #
    # Verified by bisection on a reduced crate (ureq -> rustls -> ring): the
    # build passes with makepkg's CFLAGS removed and fails with them set, while
    # LTO, RUSTFLAGS, LDFLAGS and the rest of makepkg's environment are all
    # neutral. Note this is NOT upstream's fat LTO profile causing it -- the
    # release profile in Cargo.toml builds these binaries fine on Ubuntu.
    #
    # Clearing the variables is also the more correct behaviour for a package:
    # these are the distribution's hardening flags for distribution-built
    # software, not something a third-party package should silently inherit.
    unset CFLAGS CXXFLAGS CPPFLAGS FCFLAGS FFLAGS ARFLAGS LDFLAGS LTOFLAGS
    unset RUSTFLAGS CARGO_ENCODED_RUSTFLAGS

    cargo build --release --locked --no-default-features -p desktop
    cargo build --release --locked --no-default-features -p tui
    cargo build --release --locked --no-default-features -p cli
}

# No check() on purpose. The workspace release profile sets panic = "abort",
# which is not what the test harness wants, and the android crate in the
# workspace needs the NDK to build at all. The upstream CI does not run
# `cargo test` either, so there is no suite this package would be able to run
# that CI is not already running.
package() {
    cd "$srcdir/Cross-Cleaner"

    # cargo names each binary after its package. They are renamed to
    # hyphenated commands so the desktop entries and the AppImage agree with
    # this package: Exec lines and shell completions must not change per release.
    install -Dm755 target/release/desktop "$pkgdir/usr/bin/cross-cleaner"
    install -Dm755 target/release/tui "$pkgdir/usr/bin/cross-cleaner-tui"
    install -Dm755 target/release/cli "$pkgdir/usr/bin/cross-cleaner-cli"

    install -Dm644 packaging/linux/cross-cleaner.desktop \
        "$pkgdir/usr/share/applications/cross-cleaner.desktop"
    install -Dm644 packaging/linux/cross-cleaner-tui.desktop \
        "$pkgdir/usr/share/applications/cross-cleaner-tui.desktop"

    install -Dm644 "$srcdir/icons/cross-cleaner.png" \
        "$pkgdir/usr/share/icons/hicolor/96x96/apps/cross-cleaner.png"

    install -Dm644 "$srcdir/cross-cleaner.appdata.xml" \
        "$pkgdir/usr/share/metainfo/cross-cleaner.appdata.xml"
}
