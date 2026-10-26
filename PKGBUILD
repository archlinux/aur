# Maintainer: Alex Indigo <ai@aegis.one>

pkgname=otk-git
epoch=1
pkgver=0.1.0beta1.r0.gb0d9350
pkgrel=2
pkgdesc='Open Terminal Kit, a browser UI for coding-agent backends (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/alexindigo/otk'
license=('LGPL-3.0-only')
depends=('glibc' 'libgcc')
makedepends=('deno' 'git')
optdepends=('opencode: coding-agent backend; connect OTK to your running server')
provides=('otk')
conflicts=('otk' 'otk-bin')
options=('!strip' '!debug')
source=("otk::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/otk"
    local version tag distance hash
    version=$(git describe --long --tags --match 'v[0-9]*' 2>/dev/null) || version=''
    if [[ -n $version ]]; then
        hash=${version##*-g}
        version=${version%-g*}
        distance=${version##*-}
        tag=${version%-*}
        # Pacman treats a dotted prerelease as newer than the final release.
        # v0.1.0-beta.1 -> 0.1.0beta1; retain the VCS distance separately.
        tag=${tag#v}
        tag=${tag//-alpha./alpha}
        tag=${tag//-beta./beta}
        tag=${tag//-rc./rc}
        printf '%s.r%s.g%s\n' "$tag" "$distance" "$hash"
    else
        printf 'r%s.g%s\n' "$(git log -1 --format=%cd --date=format:%Y%m%d)" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "${srcdir}/otk"
    export PATH=/usr/bin:/bin
    export DENO_NO_UPDATE_CHECK=1
    export DENO_DIR="${srcdir}/build-cache"
    deno task compile "${CARCH}-unknown-linux-gnu" "${srcdir}/otk-compiled"
}

package() {
    cd "${srcdir}/otk"
    install -Dm755 "${srcdir}/otk-compiled" "${pkgdir}/usr/bin/otk"
    install -Dm644 packaging/systemd/otk.service "${pkgdir}/usr/lib/systemd/user/otk.service"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/otk/README.md"
    install -Dm644 defaults/otk.toml "${pkgdir}/usr/share/doc/otk/otk.toml.example"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
