# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

pkgname='matterircd'
_github_path="github.com/42wim/${pkgname}"
_go_pkg_path="src/${_github_path}"
pkgver='0.28.0'
pkgrel='1'
pkgdesc='Minimal IRC server which integrates with mattermost and slack'
arch=('x86_64' 'armv7h')
url='https://github.com/42wim/matterircd'
license=('MIT')
depends=('glibc')
makedepends=('go>=1.8')
backup=("etc/${pkgname}/config.toml")
validpgpkeys=('CC7D978417C1AEA1E4CDD7240E41AB4BF4C610B4')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://${_github_path}/archive/v${pkgver}.tar.gz"
    "${pkgname}-${pkgver}.tar.gz.sig::https://${_github_path}/releases/download/v${pkgver}/v${pkgver}.tar.gz.asc"
    "${pkgname}.service"
    "${pkgname}.sysusers"
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

sha512sums=('73cd5f0802e4f94933b642458e98ee26c6a8aefb0a3fd6b5ffc082a1fd791465bc581c14ed9dfc9b942c02114869d8b3adcbae1e28332fb6b98906cb10274397'
            'SKIP'
            'a5cc900193814ffdf602b7df767c976794926733d6dea43221aca44a732bb426d11468ef05f26e04bf32b8942ef1cc006e6f8d6ac9532375fdb801bd2dce8a87'
            '80db251f5b087ba6bcdd6f266063fb749107a441f794678d645acf32d44aba7b53c2c9ef7a9c3962abfd6e8af20a2d29e93bde1c15358d9f2011ce98b68e56dc')
