# Maintainer: Roman <roman at users.noreply.github.com>
# Based on upstream packaging by the Cross-Cleaner authors.
#
# NOTE: the license in this repository (the packaging files) is 0BSD, per the
# AUR submission guidelines. The packaged software itself is GPL-3.0-or-later,
# which is what the license= field below refers to.

# The `-bin` sibling of `cross-cleaner` (see ../PKGBUILD). That package
# compiles the release tag on the machine that installs it; this one downloads
# the executables the release workflow already published and installs them
# unchanged. Nothing is compiled here, so no Rust toolchain and no access to
# crates.io are involved, and the "build" takes a download rather than an hour.
#
# The assets taken are the `-no-updater` ones. release.yml builds those with
# `--no-default-features`, which switches the `self-update` feature off in
# crates/desktop, crates/tui and crates/cli, so an installed copy can neither
# advertise a newer release nor replace the file makepkg put on disk. That is
# the same reason ../PKGBUILD builds with `--no-default-features`; installing
# the plain `Linux-Cross_Cleaner_GUI` asset instead would put a program on the
# system that fights pacman over its own binaries.
#
# The tag archive is a source here as well, but only for metadata: the release
# uploads executables and nothing else, so the desktop entries, the AppStream
# file and the icon exist nowhere but in the tree. None of it is compiled.

pkgname=cross-cleaner-bin
# Everything between the markers is rewritten by .github/workflows/aur.yml on
# every publication -- the version, the pkgrel, and one checksum per source --
# so the block deliberately contains nothing else. The checksums committed here
# are the placeholders the workflow replaces: sha256sums accepts `SKIP` for a
# source nothing has hashed yet, and the workflow refuses to push while a SKIP
# is left.
#
# One source array per architecture, which is how makepkg chooses the right
# upload: it reads the array named after the machine it runs on, and compares
# the files against the matching sha256sums array. The tag archive is listed in
# both, because both architectures share it; the uploads are not, because the
# arm64 assets carry an extra `Arm64` marker in their names.
#
# The uploads are written as full URLs rather than renamed with `::`, so the
# local file name stays the name the asset has on the release page: a checksum
# in the AUR can then be checked by hand against the download with the same
# name. Only the archive is renamed, because GitHub calls it
# v${pkgver}.tar.gz and ../PKGBUILD already established the longer name.
# ---AUR-VERSION-BEGIN---
pkgver=2.0.4.5.1
pkgrel=1
source_x86_64=(
    "cross-cleaner-v${pkgver}.tar.gz::https://github.com/Cross-Cleaner/Cross-Cleaner/archive/refs/tags/v${pkgver}.tar.gz"
    "https://github.com/Cross-Cleaner/Cross-Cleaner/releases/download/v${pkgver}/Linux-Cross_Cleaner_GUI-no-updater"
    "https://github.com/Cross-Cleaner/Cross-Cleaner/releases/download/v${pkgver}/Linux-Cross_Cleaner_TUI-no-updater"
    "https://github.com/Cross-Cleaner/Cross-Cleaner/releases/download/v${pkgver}/Linux-Cross_Cleaner_CLI-no-updater"
)
sha256sums_x86_64=(
    '685ba02acbafa13ae90c5a9a12393cd65748f3425483015e49860f375d1fa6e7'
    '745a23f989eb4301d827f6120a68edd744de4088aef0b84ae6f77e3209b827ae'
    'aa5e9878800ee411befad10d6e1d2ab6a90ecd2929403e670d9d09b777380efa'
    '1a6e83a836a309151146b347c031d414016dc1541fb0520be811ae99e18445e2'
)
source_aarch64=(
    "cross-cleaner-v${pkgver}.tar.gz::https://github.com/Cross-Cleaner/Cross-Cleaner/archive/refs/tags/v${pkgver}.tar.gz"
    "https://github.com/Cross-Cleaner/Cross-Cleaner/releases/download/v${pkgver}/Linux-Arm64-Cross_Cleaner_GUI-no-updater"
    "https://github.com/Cross-Cleaner/Cross-Cleaner/releases/download/v${pkgver}/Linux-Arm64-Cross_Cleaner_TUI-no-updater"
    "https://github.com/Cross-Cleaner/Cross-Cleaner/releases/download/v${pkgver}/Linux-Arm64-Cross_Cleaner_CLI-no-updater"
)
sha256sums_aarch64=(
    '685ba02acbafa13ae90c5a9a12393cd65748f3425483015e49860f375d1fa6e7'
    'af2a3cccd11e9fdc482279e1437385d0ed901e22df89921c93a0063cdfcbe4a9'
    '3e5af3921c6c13bbffd51a525120c9ad18e7034effdcdf40a727f526e7592f8c'
    'e0b0f2a94eb2c976114dafb88ff968f4af3398f237903b208508253824247995'
)
# ---AUR-VERSION-END---
pkgdesc='Addon-style system cleanup tool that removes temporary files, cache and other system junk (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/Cross-Cleaner/Cross-Cleaner'
license=('GPL-3.0-or-later')
# The two packages own the same paths, so a system can hold one of them and
# not both. Without this, installing either over the other fails on a file
# conflict from pacman instead of replacing it.
provides=('cross-cleaner')
conflicts=('cross-cleaner')
# Copied from ../PKGBUILD, and for its reason rather than because anything
# here links them at build time: winit reaches the X11 and Wayland stacks
# through x11-dl and wayland-backend's dlopen, so ldd cannot see those
# libraries and neither can any automatic dependency sweep. The prebuilt
# binary dlopens them exactly like the compiled one does.
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
# icoutils is the only build-side dependency, and it is here for the icon: the
# .ico that ships in the tag holds a single 96px frame that has to be pulled
# out of it before it can be installed.
#
# desktop-file-utils and appstream are deliberately absent, unlike in
# ../PKGBUILD. Nothing here writes a desktop entry or an AppStream file -- both
# come from the tag -- and the release pipeline validates those exact files
# with those exact tools before it uploads anything, so a second validation
# would only add build dependencies to every user's machine (see
# .github/actions/linux-package/action.yml).
makedepends=('icoutils')
optdepends=('gtk-update-icon-cache: update the icon cache without restarting the session')

# No pkgver() function, for the reason spelled out in ../PKGBUILD: the version
# names one tag, and a pkgver() that computes anything at build time is what
# made this package family unusable on the AUR before.

# GitHub names a tag archive's top-level directory after the tag without its
# leading `v`, the same directory ../PKGBUILD expects.
_srcdir_tag="Cross-Cleaner-${pkgver}"

# Which upload belongs to this machine. A function rather than two `case`
# blocks because prepare(), which checks the file, and package(), which
# installs it, must not be able to disagree: a disagreement would not fail the
# build, it would install a binary for the other architecture.
_asset_prefix() {
    case "$CARCH" in
        x86_64)  printf '%s' 'Linux' ;;
        aarch64) printf '%s' 'Linux-Arm64' ;;
        *)
            printf 'no asset is published for %s\n' "$CARCH" >&2
            return 1
            ;;
    esac
}

prepare() {
    local prefix
    prefix=$(_asset_prefix) || return 1

    cd "$srcdir/$_srcdir_tag"

    # Unchanged from ../PKGBUILD. crates/winicon/assets/icon.ico holds one
    # 96px frame, so this is a straight extraction rather than a resize, and
    # only that one real size is installed: the AppImage build upscales to 128
    # and 256, this one does not invent sizes upstream never provided.
    #
    # The extraction goes through a throwaway directory because prepare() has
    # to be idempotent: makepkg reuses an existing $srcdir whenever only the
    # PKGBUILD changed, and writing the frame next to its destination and then
    # `mv`-ing it onto itself fails the second time round with
    # "mv: ... and ... are the same file".
    local extract frame
    extract=$(mktemp -d)
    icotool -x -o "$extract" crates/winicon/assets/icon.ico
    frame=$(find "$extract" -name '*.png' -print -quit)
    if [[ -z "$frame" ]]; then
        rm -rf "$extract"
        printf 'icotool extracted no frame from icon.ico\n' >&2
        return 1
    fi
    install -Dm644 "$frame" "$srcdir/icons/cross-cleaner.png"
    rm -rf "$extract"

    # packaging/linux/cross-cleaner.appdata.xml carries %%VERSION%% and %%DATE%%
    # for whoever packages it. The date comes from the build date here as well
    # as in ../PKGBUILD: the source is a tag archive, not a git checkout, so
    # there is no .git to ask for the commit's timestamp.
    #
    # The version is where the two packages part company. ../PKGBUILD rewrites
    # the sources so that `--version` reports the full four-component release
    # version; a prebuilt binary cannot be rewritten, so this substitution only
    # changes what the metadata claims. The uploads were compiled against the
    # three-component version upstream puts in Cargo.toml, which is 2.0.4 for
    # this 2.0.4.2.5 package -- the fourth component has no representation
    # inside a cargo version at all. See the README.
    local release_date
    release_date=$(date -u +%Y-%m-%d)
    sed -e "s/%%VERSION%%/$pkgver/g" \
        -e "s/%%DATE%%/$release_date/g" \
        packaging/linux/cross-cleaner.appdata.xml > "$srcdir/cross-cleaner.appdata.xml"
    if grep -q '%%' "$srcdir/cross-cleaner.appdata.xml"; then
        printf 'unsubstituted placeholder left in the AppStream metadata\n' >&2
        return 1
    fi

    # Two properties of the downloads are worth checking, because both are
    # silent when they go wrong and only show up in someone's install:
    #
    # 1. the architecture. A URL that lost its `Arm64` marker resolves happily
    #    on the wrong machine, and pacman reports a successful installation of
    #    a binary it cannot execute. file(1) spells this machine "x86-64" with
    #    a hyphen, which is not the Rust spelling of the same architecture, so
    #    the expected string is worked out here rather than reusing $CARCH.
    # 2. the feature set. The `-no-updater` suffix is the whole reason this
    #    package exists: a self-updating binary would replace its own file
    #    behind pacman's back and drift from the version the database records.
    #    Nothing else in a -bin package can notice that, so `strings` is asked
    #    for the `selfupdate` crate -- the same canary the release pipeline
    #    applies to the .deb it builds from this same code (see
    #    linux-package/action.yml). Matching lines are printed rather than just
    #    counted, so a false positive names itself.
    #
    # `canary=$(... || :)` rather than a pipeline into `if`: a grep that finds
    # nothing exits 1, which is the answer being asked for and not an error.
    local elf_arch
    case "$CARCH" in
        x86_64)  elf_arch='x86-64' ;;
        aarch64) elf_arch='aarch64' ;;
    esac

    local component asset desc canary
    for component in GUI TUI CLI; do
        asset="$srcdir/${prefix}-Cross_Cleaner_${component}-no-updater"
        # -L is not decoration. makepkg does not copy a source into $srcdir, it
        # symlinks it there -- the download stays in the directory holding the
        # PKGBUILD -- and file(1) does not follow symlinks unless it is told to
        # (that is its POSIXLY_CORRECT behaviour, not its default). Reading the
        # link instead of the binary gives "symbolic link to ...", which matches
        # neither architecture, so the check below rejected every build of the
        # first published version of this package. -b drops the file name,
        # which is printed here anyway.
        desc=$(file -Lb "$asset")
        printf '%s: %s\n' "${asset##*/}" "$desc"
        if [[ "$desc" != *"$elf_arch"* ]]; then
            printf '%s is not a %s binary\n' "$asset" "$elf_arch" >&2
            return 1
        fi
        canary=$(strings "$asset" | grep -i 'selfupdate' || :)
        if [[ -n "$canary" ]]; then
            printf '%s carries self-update code:\n%s\n' "$asset" "$canary" >&2
            return 1
        fi
    done
}

# No build() on purpose: the executable this package installs is already built
# and is downloaded by makepkg as a source. That also means no check(): there is
# no source tree here to run a test suite against.

package() {
    local prefix
    prefix=$(_asset_prefix) || return 1

    cd "$srcdir"

    # Installed under the same hyphenated names ../PKGBUILD uses. cargo names
    # the uploads after their packages (desktop, tui, cli) while every desktop
    # entry and both project-packaged installers say `cross-cleaner`,
    # `cross-cleaner-tui` and `cross-cleaner-cli`; renaming here keeps Exec=
    # lines valid across releases and keeps the two AUR packages
    # interchangeable.
    install -Dm755 "${prefix}-Cross_Cleaner_GUI-no-updater" \
        "$pkgdir/usr/bin/cross-cleaner"
    install -Dm755 "${prefix}-Cross_Cleaner_TUI-no-updater" \
        "$pkgdir/usr/bin/cross-cleaner-tui"
    install -Dm755 "${prefix}-Cross_Cleaner_CLI-no-updater" \
        "$pkgdir/usr/bin/cross-cleaner-cli"

    install -Dm644 "$srcdir/$_srcdir_tag/packaging/linux/cross-cleaner.desktop" \
        "$pkgdir/usr/share/applications/cross-cleaner.desktop"
    install -Dm644 "$srcdir/$_srcdir_tag/packaging/linux/cross-cleaner-tui.desktop" \
        "$pkgdir/usr/share/applications/cross-cleaner-tui.desktop"

    install -Dm644 "$srcdir/icons/cross-cleaner.png" \
        "$pkgdir/usr/share/icons/hicolor/96x96/apps/cross-cleaner.png"

    install -Dm644 "$srcdir/cross-cleaner.appdata.xml" \
        "$pkgdir/usr/share/metainfo/cross-cleaner.appdata.xml"
}
