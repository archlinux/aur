# Maintainer: Alex Indigo <ai@aegis.one>

pkgname=otk
epoch=1
pkgver=0.1.0beta1
_version=0.1.0-beta.1
pkgrel=1
pkgdesc='Open Terminal Kit, a browser UI for coding-agent backends'
arch=('x86_64' 'aarch64')
url='https://github.com/alexindigo/otk'
license=('LGPL-3.0-only')
depends=('glibc' 'libgcc')
makedepends=('deno')
optdepends=('opencode: coding-agent backend; connect OTK to your running server')
provides=('otk')
conflicts=('otk-bin' 'otk-git')
options=('!strip' '!debug')
source=("otk-${_version}.tar.gz::${url}/archive/refs/tags/v${_version}.tar.gz")
sha256sums=('1dff8ebf3247fa53d83a49cb02a1a9d822435aaaa8a02cfeab4e600ad45c115d')

build() {
    cd "${srcdir}/otk-${_version}"
    export PATH=/usr/bin:/bin
    export DENO_NO_UPDATE_CHECK=1
    export DENO_DIR="${srcdir}/build-cache"
    deno task compile "${CARCH}-unknown-linux-gnu" "${srcdir}/otk-compiled"
}

package() {
    cd "${srcdir}/otk-${_version}"
    install -Dm755 "${srcdir}/otk-compiled" "${pkgdir}/usr/bin/otk"
    install -Dm644 packaging/systemd/otk.service "${pkgdir}/usr/lib/systemd/user/otk.service"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/otk/README.md"
    install -Dm644 defaults/otk.toml "${pkgdir}/usr/share/doc/otk/otk.toml.example"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
