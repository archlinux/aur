# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# VCS package: builds from the latest main. Useful for testing
# unreleased changes; tracks the current development tip.

pkgname=awob-git
pkgver=0.0.1.r0.gunknown
pkgrel=1
pkgdesc="Another Wayland Overlay Bar (VCS build of latest main)"
arch=('x86_64' 'aarch64')
url="https://github.com/jmylchreest/awob"
license=('MIT')
depends=('pipewire' 'libudev.so')
makedepends=('cargo' 'git' 'pkgconf')
optdepends=(
    'pactl: volume / mute keybinds'
    'brightnessctl: brightness keybinds'
)
# awob-git is the "kitchen sink" source build — it installs the daemon,
# the CLI, every official listener, the systemd unit, and the stock
# themes. So it conflicts with every binary package that ships any of
# the same files.
provides=(
    'awob'
    'awob-daemon'
    'awob-listener-pipewire'
    'awob-listener-battery'
    'awob-listener-backlight'
    'awob-listener-keyboard-backlight'
    'awob-listener-wob'
)
conflicts=(
    'awob'
    'awob-bin'
    'awob-listener-pipewire-bin'
    'awob-listener-battery-bin'
    'awob-listener-backlight-bin'
    'awob-listener-keyboard-backlight-bin'
    'awob-listener-wob-bin'
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    # Use git describe if any tag exists, otherwise commit count + hash.
    (git describe --long --tags 2>/dev/null \
        | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g') \
        || printf "0.0.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    # Fetch deps up front so the build step doesn't need network.
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    # `--locked` makes the build reproducible against Cargo.lock.
    # `--frozen` would be stricter but conflicts with cargo's
    # behaviour when the registry needs to be re-read.
    export RUSTFLAGS="${RUSTFLAGS:--C target-cpu=native}"
    cargo build --release --locked --workspace
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    for bin in awob awob-daemon \
               awob-listener-pipewire \
               awob-listener-battery \
               awob-listener-backlight \
               awob-listener-keyboard-backlight \
               awob-listener-wob; do
        install -Dm755 "target/release/${bin}" "${pkgdir}/usr/bin/${bin}"
    done

    install -dm755 "${pkgdir}/usr/share/awob"
    cp -r themes "${pkgdir}/usr/share/awob/"

    install -Dm644 contrib/systemd/awob.service \
        "${pkgdir}/usr/lib/systemd/user/awob.service"
    # The shipped unit defaults to %h/.cargo/bin/awob-daemon for users
    # who `cargo install`. The Arch package installs to /usr/bin, so
    # rewrite the path here.
    sed -i 's|^ExecStart=%h/.cargo/bin/awob-daemon$|ExecStart=/usr/bin/awob-daemon|' \
        "${pkgdir}/usr/lib/systemd/user/awob.service"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
