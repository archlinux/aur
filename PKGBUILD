# Maintainer: Juerg Georg Hallenbarter <jgh@jgh.ch>
# Contributor: Juerg Georg Hallenbarter <jgh@jgh.ch>
# Arch Linux maintainer notes: this PKGBUILD builds jtop from the latest commit on the main branch.
# When upstream tags a release, switch to stable releases instead.

pkgname=jtop
pkgver=0.1.0.r46.g5f1cb85
pkgrel=1
epoch=
pkgdesc="A lightweight, terminal-based system monitoring tool written in Java"
arch=('x86_64' 'aarch64')
url="https://github.com/JGH0/jtop"
license=('MIT')
depends=(
    'java-runtime>=21'
)
makedepends=(
    'java-environment>=21'
    'git'
)
optdepends=()
install="${pkgname}.install"
provides=("${pkgname}")
conflicts=()
replaces=()
source=("${pkgname}::git+${url}.git")
noextract=()
validpgpkeys=()
sha256sums=('SKIP')
b2sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}"
}

build() {
    cd "${srcdir}/${pkgname}"
    ./build.sh
}

package() {
    cd "${srcdir}/${pkgname}"

    # Install the JAR to the system library directory
    install -Dm644 jtop.jar "${pkgdir}/usr/local/lib/jtop/jtop.jar"

    # Install the default config
    install -Dm644 config/default.conf "${pkgdir}/usr/local/lib/jtop/config/default.conf"

    # Install a wrapper script that does NOT include the --update feature.
    # pacman handles updates; the --update flag from the upstream script is
    # omitted to prevent users from accidentally overriding the package-managed
    # installation with a git-cloned one.
    install -Dm755 /dev/stdin "${pkgdir}/usr/local/bin/jtop" <<'WRAPPER'
#!/usr/bin/env bash
# jtop launcher - AUR version (no self-update)
# Updates are handled by pacman, not by the tool itself.

JTOP_DIR="/usr/local/lib/jtop"
JTOP_JAR="$JTOP_DIR/jtop.jar"

exec java -jar "$JTOP_JAR" "$@"
WRAPPER
}
