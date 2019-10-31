# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

pkgname='matterircd'
_github_path="github.com/42wim/${pkgname}"
_go_pkg_path="src/${_github_path}"
pkgver='0.19.2'
pkgrel='2'
pkgdesc='Minimal IRC server which integrates with mattermost and slack'
arch=('x86_64')
url='https://github.com/42wim/matterircd'
license=('MIT')
depends=('glibc')
makedepends=('go-pie>=1.8')
backup=("etc/${pkgname}/config.toml")

source=(
    "${pkgname}-${pkgver}.tar.gz::https://${_github_path}/archive/v${pkgver}.tar.gz"
    "${pkgname}-${pkgver}.tar.gz.sig::https://${_github_path}/releases/download/v${pkgver}/v${pkgver}.tar.gz.asc"
    "${pkgname}.service"
    "${pkgname}.sysusers"
)

sha512sums=(
    '43f9f73a2932a3be3c843d3325ecc8787f55647b89834cde93afff07f98cf6a1c76cb660390f6875802f56e0b59090df6b7972c6a0c424c54bac3ae4821c2b7e'
    'SKIP'
    'a1c8947ca8ed510b0abd94e1eb3f049a7179a596e20975f343f1fd6a034512b3e7d5daa082ed0e7662757d416b3b10f318de5a8fe9c44923d2cfbd15742d3ba0'
    '80db251f5b087ba6bcdd6f266063fb749107a441f794678d645acf32d44aba7b53c2c9ef7a9c3962abfd6e8af20a2d29e93bde1c15358d9f2011ce98b68e56dc'
)

prepare() {
    export GOPATH="${srcdir}"
    export PATH="$PATH:$GOPATH/bin"
    mkdir -p "$(dirname "${_go_pkg_path}")"
    mv "${pkgname}-${pkgver}" "${_go_pkg_path}"
    cd "${_go_pkg_path}"
    go get ./...
}

build() {
    cd "${_go_pkg_path}"
    go build -o "${pkgname}-${pkgver}"
}

package() {
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

    cd "${_go_pkg_path}"
    install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 matterircd.toml.example "${pkgdir}/etc/${pkgname}/config.toml"
}
