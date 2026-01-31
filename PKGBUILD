# Maintainer: Thomas J Faughnan Jr <thomas@faughnan.net>
# pkgbuild based on caddy package in official repos

pkgname=caddy-he
_pkgname=caddy
pkgver=2.10.2
pkgrel=1
pkgdesc='Fast web server with automatic HTTPS (with Hurricane Electric DNS module)'
provides=(caddy)
conflicts=(caddy)
url='https://github.com/caddyserver/caddy'
arch=(x86_64)
license=(Apache-2.0)
depends=(
    glibc
    mailcap
)
makedepends=(
    git
    go
)
backup=(
    etc/caddy/Caddyfile
)
options=(!lto)
source=("git+https://github.com/caddyserver/caddy.git#tag=v${pkgver}?signed"
    caddy-dist::"git+https://github.com/caddyserver/dist.git#tag=v${pkgver}"
    caddy.service
    caddy-api.service
    caddy.tmpfiles
    caddy.sysusers
    Caddyfile
    use-data-dir-for-autosave.patch
    override-main-module-version.patch
    import-he-module.patch)
sha512sums=('400f6557f2677aa5e7a9d07a67707bf2fdb70599877715fbf75ce1d63fed0a2e887d08f66254bea9f7f6e3c76e313be2f4c32ea30b1a3ba99cb8f578a5a498b5'
            '7efc04ac67c5c4829a97da54d1e647bb324d227a75aa5cefa0450aa12a28dc39eb91de8b65234f084666dcdc431a0ede9f0b04a8d6df8acc8eae02d53fbd00a9'
            'e6cdf5f81af01d0a6290ef9503d0bd90244684a6305e5638f079c234b2bc6454688daea3ea9d1b6a6f00eeba0375e9c4372e64c5cb49b5d1206384d2a7201273'
            '6c9d5dce22f1f0f4e222d4adeccd93c486b3be2ac221a7f8a58933b22ce91fe3da8ad38e6db7212846e4ab6336ebc058df16215a43636b965dfed469b3aaa2f6'
            '55ee8d3f8b14f9adddc7a1026addcea4f85b4bae4cd512fd4da2a5e8adaae4b6fd0f486d2e3847f75518f4710a897b4fca84e48ee15700b968bad762125c4742'
            'c893d88fec89e37da6596030c8dce7103e7e575371e8542a24d2a0741e877358d85219f2d8ade9d6aa0f515efe1156a4badd9fef5f65f553a5b0c72330c4728f'
            '4be1ed23e6600d8072c7f4fabd2bd926708502a55d84ae4f62aff9885c7b8e45ad0554503d0fc796338577adfca9e467c468a82ba56ffd69e4ec2778d69bc198'
            '563d6b45e91fc584fb5a27caaa382f59c140cb0a1b28b8d8faced4f7c7cad86d8671eb6ac10056f41518a842c8f606130d7e0c71df2b731d5eb0b4c868ea5d41'
            '0fedec714604566fb0da995cdfb2dd2cb8f3995bfa1d6c2e9a38ddd1da11634c3e37f2da381f715df4fc9ebd9653c3aa4806de47ae5094ea1fc19b7f5b795a30'
            '418d3da739d562de50eafa769729924a4537598a472374299783493b5c62435fc8c7a18ecaf5257d6b28e9781a9324608bae11870e3fbbe1c760a5c635fec42f')
validpgpkeys=(
    29D0817A67156E4F25DC24782A349DD577D586A5 # Matthew Holt <mholt@users.noreply.github.com>
)

prepare() {
    cd "${_pkgname}"
    # welcome page
    cp ../caddy-dist/welcome/index.html .
    sed 's|/var/www/html|/srv/http|g' -i index.html
    # do not write in /etc
    patch -Np1 < "${srcdir}/use-data-dir-for-autosave.patch"
    # fix version identifier if not built from a module
    patch -Np1 < "${srcdir}/override-main-module-version.patch"
    sed 's|"unknown"|"v'"${pkgver}"'"|g' -i caddy.go
    # use Hurricane Electric module
    patch -Np1 < "${srcdir}/import-he-module.patch"
    go mod tidy
}

build() {
    cd "${_pkgname}/cmd/caddy/"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build .

    for i in zsh bash fish; do
        ./caddy completion $i >caddy.$i
    done
}

check() {
    # Disabled for now, because of failing tests
    cd "${_pkgname}"
    go test ./...
    version=$(./cmd/caddy/caddy version)
    echo "Caddy version: ${version}"
    if [[ $version != v$pkgver ]]; then
        exit 1
    fi
}

package() {
    cd "${_pkgname}"
    install -Dm 755 cmd/caddy/caddy -t "${pkgdir}/usr/bin"

    install -Dm 644 "${srcdir}/caddy.service" "${srcdir}/caddy-api.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm 644 "${srcdir}/caddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/caddy.conf"
    install -Dm 644 "${srcdir}/caddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/caddy.conf"

    install -Dm 644 "${srcdir}/Caddyfile" -t "${pkgdir}/etc/caddy"
    install -d "${pkgdir}/etc/caddy/conf.d"

    install -Dm 644 index.html "${pkgdir}/usr/share/caddy/index.html"

    install -Dm 644 "${srcdir}/caddy/cmd/caddy/caddy.zsh" "${pkgdir}/usr/share/zsh/site-functions/_caddy"
    install -Dm 644 "${srcdir}/caddy/cmd/caddy/caddy.bash" "${pkgdir}/usr/share/bash-completion/completions/caddy"
    install -Dm 644 "${srcdir}/caddy/cmd/caddy/caddy.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
}
