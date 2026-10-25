# Maintainer: Alex Indigo <ai@aegis.one>

pkgname=otk-git
_pkgname=otk
_release_ver=0.1.0.alpha.1.r0
pkgver=0.1.0.alpha.1.r0.g2201d86
pkgrel=1
pkgdesc='Open Terminal Kit, a browser UI for coding-agent backends (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/alexindigo/otk'
license=('LGPL-3.0-only')
depends=('deno')
makedepends=('git')
optdepends=('opencode: coding-agent backend; connect OTK to your running server')
provides=('otk')
conflicts=('otk')
options=('!debug')
source=("otk::git+${url}.git"
        'otk.sh'
        'otk.service')
sha256sums=('SKIP'
            'bb154f3edcd132254b05923b81aad940a34d2fd3ecc3768422ed381f29329ee4'
            '83b504049fa51c7d0c6089d5107a33dec11adf36647cba2ccc65dc13a0f87bfe')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    local version
    version=$(git describe --long --tags --match 'v[0-9]*' 2>/dev/null) || version=''
    if [[ -n $version ]]; then
        printf '%s\n' "$version" | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
    else
        printf '%s.g%s\n' "$_release_ver" "$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "${srcdir}/${_pkgname}"
    # Tasks invoke deno by name. Do not pick up a separate user installation.
    export PATH=/usr/bin:/bin
    export DENO_NO_UPDATE_CHECK=1
    export DENO_DIR="${srcdir}/build-cache"
    /usr/bin/deno install --frozen
    /usr/bin/deno task build:web

    # Pathfinder imports route modules dynamically; cache every route as well
    # as the static application graph. Deno also resolves configured npm imports;
    # preserve that complete dependency set for offline startup.
    export DENO_DIR="${srcdir}/runtime-cache"
    local -a routes
    mapfile -d '' routes < <(find core/http/routes -type f -name '*.ts' -print0)
    /usr/bin/deno cache --frozen --node-modules-dir=none main.ts "${routes[@]}"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -dm755 "${pkgdir}/usr/lib/otk/web"
    cp -a main.ts application.ts deno.json deno.lock core defaults packages \
        "${pkgdir}/usr/lib/otk/"
    cp -a web/dist "${pkgdir}/usr/lib/otk/web/"
    install -dm755 "${pkgdir}/usr/lib/otk/deno-cache"
    cp -a "${srcdir}/runtime-cache/npm" "${srcdir}/runtime-cache/remote" \
        "${pkgdir}/usr/lib/otk/deno-cache/"
    # Caches are read-only package assets, never a build-user private directory.
    chmod -R u=rwX,go=rX "${pkgdir}/usr/lib/otk"
    install -Dm755 "${srcdir}/otk.sh" "${pkgdir}/usr/bin/otk"
    install -Dm644 "${srcdir}/otk.service" "${pkgdir}/usr/lib/systemd/user/otk.service"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/otk/README.md"
    install -Dm644 defaults/otk.toml "${pkgdir}/usr/share/doc/otk/otk.toml.example"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
