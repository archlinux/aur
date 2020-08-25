# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

pkgname='matterircd-git'
_name='matterircd'
_github_path="github.com/42wim/${_name}"
_go_pkg_path="src/${_github_path}"
pkgver=0.19.4.63.gb0eefb2
pkgrel=2
pkgdesc='Minimal IRC server which integrates with mattermost and slack'
arch=('x86_64' 'armv7h')
url='https://github.com/42wim/matterircd'
license=('MIT')
depends=('glibc')
makedepends=('go>=1.8' 'git')
provides=('matterircd')
conflicts=('matterircd')
backup=("etc/${pkgname}/config.toml")
validpgpkeys=('CC7D978417C1AEA1E4CDD7240E41AB4BF4C610B4')

source=(
    "${_name}::git+https://${_github_path}"
    "${_name}.service"
    "${_name}.sysusers"
)

sha512sums=(
    'SKIP'
    'a1c8947ca8ed510b0abd94e1eb3f049a7179a596e20975f343f1fd6a034512b3e7d5daa082ed0e7662757d416b3b10f318de5a8fe9c44923d2cfbd15742d3ba0'
    '80db251f5b087ba6bcdd6f266063fb749107a441f794678d645acf32d44aba7b53c2c9ef7a9c3962abfd6e8af20a2d29e93bde1c15358d9f2011ce98b68e56dc'
)

prepare() {
    export GOPATH="${srcdir}"
    export PATH="$PATH:$GOPATH/bin"
    mkdir -p "$(dirname "${_go_pkg_path}")"
    mv "${_name}" "${_go_pkg_path}"
    cd "${_go_pkg_path}"
    go get ./...
}

pkgver() {
    cd "${_go_pkg_path}"
    git describe --tags | sed 's/^v//;s/-/./g'
}


build() {
    cd "${_go_pkg_path}"
    go build -o "${_name}"
}

package() {
    install -Dm644 "${_name}.service" "${pkgdir}/usr/lib/systemd/system/${_name}.service"
    install -Dm644 "${_name}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_name}.conf"

    cd "${_go_pkg_path}"
    install -Dm755 "${_name}" "${pkgdir}/usr/bin/${_name}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 matterircd.toml.example "${pkgdir}/etc/${_name}/config.toml"
}
