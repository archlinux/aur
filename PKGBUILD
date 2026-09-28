# Maintainer: 1000Hz <1000Hz radiowave + aur at gmail>
pkgname=chill1
pkgver=0.0.0
pkgrel=1
pkgdesc="Run a command with disk I/O bandwidth limits applied to all block devices"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/dsvi/chill"
license=('zlib')
makedepends=('gcc')
install="${pkgname}.install"

# source file and tree keep the upstream name (chill), only the AUR
# package name is chill1
_source="chill"
source=("${_source}-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('473bec29dac26517553544b788f8149b96e27e639339c7c8587cac14dbdf6287')

_srcdir="${_source}-$pkgver"

# the binary is intentionally still named `chill`, not `chill1`
build() {
    cd "${srcdir}/${_srcdir}"
    gcc -Os -Wall -Wextra -o "${_source}" "${_source}.c"
}

package() {
    cd "${srcdir}/${_srcdir}"

    # setuid root: chill needs privileges only to create its cgroup, write its
    # io.max limits and remove the cgroup again; the command itself runs as the
    # invoking user.
    install -Dm4755 "${_source}" "${pkgdir}/usr/bin/${_source}"
}
