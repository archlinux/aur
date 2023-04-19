# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>

pkgname="surface-dtx-daemon"
pkgver=0.3.4
pkgrel=1
_pkgrel=1
pkgdesc="Surface Detachment System (DTX) Daemon"
url="https://github.com/linux-surface/surface-dtx-daemon"
license=('MIT')
arch=('x86_64')
depends=('dbus' 'gcc-libs')
makedepends=('rust' 'cargo')
provides=('surface-dtx-daemon')
install=surface-dtx-daemon.install

source=(
    "${pkgname}-${pkgver}-${_pkgrel}.tar.gz::https://github.com/linux-surface/surface-dtx-daemon/archive/refs/tags/v${pkgver}-${_pkgrel}.tar.gz"
)

sha256sums=('4e25bdff10aed0c2a6aa7dbec1c617e353d9dfdbfbdf90296e93d6f096efebba')

backup=(
    'etc/surface-dtx/surface-dtx-daemon.conf'
    'etc/surface-dtx/surface-dtx-userd.conf'
    'etc/surface-dtx/detach.sh'
    'etc/surface-dtx/attach.sh'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}"
    env CARGO_TARGET_DIR="$PWD/target" CARGO_INCREMENTAL=0 cargo build --release --locked
    strip --strip-all "target/release/surface-dtx-daemon"
    strip --strip-all "target/release/surface-dtx-userd"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}"

    # binary files
    install -D -m755 "target/release/surface-dtx-daemon" "$pkgdir/usr/bin/surface-dtx-daemon"
    install -D -m755 "target/release/surface-dtx-userd" "$pkgdir/usr/bin/surface-dtx-userd"

    # application files
    install -D -m644 "etc/dtx/surface-dtx-daemon.conf" "$pkgdir/etc/surface-dtx/surface-dtx-daemon.conf"
    install -D -m644 "etc/dtx/surface-dtx-userd.conf" "$pkgdir/etc/surface-dtx/surface-dtx-userd.conf"
    install -D -m755 "etc/dtx/attach.sh" "$pkgdir/etc/surface-dtx/attach.sh"
    install -D -m755 "etc/dtx/detach.sh" "$pkgdir/etc/surface-dtx/detach.sh"

    # systemd service files
    install -D -m644 "etc/systemd/surface-dtx-daemon.service" "$pkgdir/usr/lib/systemd/system/surface-dtx-daemon.service"
    install -D -m644 "etc/systemd/surface-dtx-userd.service" "$pkgdir/usr/lib/systemd/user/surface-dtx-userd.service"

    # dbus config file
    install -D -m644 "etc/dbus/org.surface.dtx.conf" "$pkgdir/etc/dbus-1/system.d/org.surface.dtx.conf"

    # udev rules
    install -D -m644 "etc/udev/40-surface_dtx.rules" "$pkgdir/etc/udev/rules.d/40-surface_dtx.rules"

    # completion files
    install -D -m644 "target/surface-dtx-daemon.bash" "$pkgdir/usr/share/bash-completion/completions/surface-dtx-daemon"
    install -D -m644 "target/surface-dtx-userd.bash" "$pkgdir/usr/share/bash-completion/completions/surface-dtx-userd"

    install -D -m644 "target/_surface-dtx-daemon" "$pkgdir/usr/share/zsh/site-functions/_surface-dtx-daemon"
    install -D -m644 "target/_surface-dtx-userd" "$pkgdir/usr/share/zsh/site-functions/_surface-dtx-userd"

    install -D -m644 "target/surface-dtx-daemon.fish" "$pkgdir/usr/share/fish/completions/surface-dtx-daemon.fish"
    install -D -m644 "target/surface-dtx-userd.fish" "$pkgdir/usr/share/fish/completions/surface-dtx-userd.fish"

    # license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/surface-dtx-daemon/LICENSE"
}
