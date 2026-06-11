# Maintainer: 5unekku <jimmy.bungalo8@gmail.com>

pkgname=lyar-git
_pkgname=lyar
pkgver=r1.bd49956
pkgrel=1
pkgdesc="memory-safe tui display manager — rust rewrite of ly"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://gitlab.com/5unekku/lyar"
license=('MIT-0')
depends=('pam' 'gcc-libs' 'glibc')
makedepends=('git' 'rust')
optdepends=(
    'xorg-xinit: xinitrc session support'
    'xorg-server: x11 session support'
)
provides=("${_pkgname}")
backup=(
    'etc/lyar/config.ini'
    'etc/pam.d/lyar'
    'etc/pam.d/lyar-autologin'
)
install=lyar.install
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR="${HOME}/.cache/cargo-builds/lyar-git"
    mkdir -p "${CARGO_TARGET_DIR}"
    cargo build --frozen --release
}

package() {
    cd "${pkgname}"

    install -Dm755 "${HOME}/.cache/cargo-builds/lyar-git/release/${_pkgname}" \
        "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # default config (backed up — user edits survive upgrades)
    install -Dm644 contrib/config.ini \
        "${pkgdir}/etc/lyar/config.ini"
    install -Dm644 contrib/lang/en.ini \
        "${pkgdir}/etc/lyar/lang/en.ini"

    # pam
    install -Dm644 contrib/pam.d/lyar \
        "${pkgdir}/etc/pam.d/lyar"
    install -Dm644 contrib/pam.d/lyar-autologin \
        "${pkgdir}/etc/pam.d/lyar-autologin"

    # systemd
    install -Dm644 contrib/lyar@.service \
        "${pkgdir}/usr/lib/systemd/system/lyar@.service"

    # openrc
    install -Dm755 contrib/lyar-openrc \
        "${pkgdir}/etc/init.d/lyar"

    # dinit
    install -Dm644 contrib/lyar-dinit \
        "${pkgdir}/usr/lib/dinit.d/lyar"

    # runit
    install -Dm755 contrib/lyar-runit/run \
        "${pkgdir}/usr/lib/runit/sv/lyar/run"
    install -Dm755 contrib/lyar-runit/finish \
        "${pkgdir}/usr/lib/runit/sv/lyar/finish"

    # s6
    install -Dm755 contrib/lyar-s6/run \
        "${pkgdir}/usr/lib/s6/adminsv/lyar/run"
    install -Dm755 contrib/lyar-s6/finish \
        "${pkgdir}/usr/lib/s6/adminsv/lyar/finish"
    install -Dm644 contrib/lyar-s6/type \
        "${pkgdir}/usr/lib/s6/adminsv/lyar/type"

    # helper scripts (installed as examples; not executed by the package)
    install -Dm755 contrib/setup.sh \
        "${pkgdir}/etc/lyar/setup.sh"
    install -Dm755 contrib/startup.sh \
        "${pkgdir}/etc/lyar/startup.sh"
}
