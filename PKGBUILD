# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

# Copyright Sebastian Wiesner <sebastian@swsnr.de>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

pkgname=git-gone
pkgver=1.3.1
pkgrel=2
pkgdesc='Prune stale local Git branches'
arch=('i686' 'x86_64')
url="https://codeberg.org/swsnr/git-gone"
license=('EUPL-1.2')
depends=()
conflicts=('git-gone-git')
makedepends=('rust' 'cargo' 'git')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('1b41b172418f22aed98c6b7c92e41dcfc0ecaa1e94ea94869912d6caaa6e484a')

prepare() {
    cd "${pkgname}" || return 1
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}" || return 1
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
