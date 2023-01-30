# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

# This is a split package since most people only need the VST3 plugin right now
pkgbase=diopser-git
pkgname=('diopser-clap-git' 'diopser-vst3-git')
_repo=nih-plug
# The name of the package in the Cargo worksapce
_package=diopser
# The prefix used for for version tags
_tag_prefix=diopser-
# The name of the built plugin bundle or library
_bundle=Diopser
pkgver=0.0.1.r1877.efff43d
pkgrel=1
pkgdesc='A totally original phase rotation plugin - part of NIH-plug'
arch=('x86_64')
url="https://github.com/robbert-vdh/nih-plug/tree/master/plugins/diopser"
license=('GPL3')
groups=('nih-plug')
depends=('libglvnd' 'xcb-util-wm')
makedepends=('git' 'cargo-nightly')
source=('git+https://github.com/robbert-vdh/nih-plug.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_repo"

    # Currently there's no tagged commit, so the only way to get this `git
    # describe` to output something would be using `--always`, and then you just
    # get a plain commit hash. So if that's the case, we'll just use
    # `0.0.1.rXXX-deadbee`. We'll also need to filter the considered tags by the
    # plugin's name, since this repo contains multiple plugins with separate
    # version tags.
    set -o pipefail
    git describe --long --tags --match "$_tag_prefix*" 2>/dev/null | sed "s/^v//;s/$_tag_prefix//;s/\\([^-]*-g\\)/r\\1/;s/-/./g" ||
      printf "0.0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_repo"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target

    cd "$srcdir/$_repo"
    cargo xtask bundle "$_package" --frozen --release --all-features
}

package_diopser-clap-git() {
    provides=('diopser-clap')

    cd "$srcdir/$_repo"
    install -Dm0755 -t "$pkgdir/usr/lib/clap/" "target/bundled/$_bundle.clap"
}

package_diopser-vst3-git() {
    provides=('diopser-vst3')

    cd "$srcdir/$_repo"
    install -dm755 "$pkgdir/usr/lib/vst3"
    cp -r "target/bundled/$_bundle.vst3" "$pkgdir/usr/lib/vst3/"
}
