# Maintainer: czyt <czytcn@gmail.com>
pkgname=gitea-cli-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="The official CLI for Gitea: manage repositories, issues, pull requests, releases and Actions from the command line"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://gitea.com/gitea/cli"
license=('MIT')
depends=('git')
provides=('gitea-cli')
conflicts=('gitea-cli')
# The program is a static Go build: stripping it would rewrite upstream's
# binary for no gain, and a debug package would be just as large.
options=('!strip' '!debug')

_deb_x86_64="gitea-cli_${pkgver}_amd64.deb"
_deb_aarch64="gitea-cli_${pkgver}_arm64.deb"
_deb_armv7h="gitea-cli_${pkgver}_armhf.deb"

_releases="https://gitea.com/gitea/cli/releases/download/v${pkgver}"

source_x86_64=("${_deb_x86_64}::${_releases}/${_deb_x86_64}")
source_aarch64=("${_deb_aarch64}::${_releases}/${_deb_aarch64}")
source_armv7h=("${_deb_armv7h}::${_releases}/${_deb_armv7h}")

noextract=("${_deb_x86_64}" "${_deb_aarch64}" "${_deb_armv7h}")

sha256sums_x86_64=('6869816e73605ec4d6dbac924ce2b4b320568fd6a5e943d8f1a897af559f229f')
sha256sums_aarch64=('15c405274bb05690c6e2c5994eda198b144f501e7ebbaec19b29989711155232')
sha256sums_armv7h=('7df62bb2fb306aa1fd902283502e3787b4f64afe8e4d4f02a3492b4d10da71a4')

package() {
    local deb_var="_deb_${CARCH}"
    local deb="${!deb_var}"
    local data_archive

    data_archive="$(bsdtar -tf "${srcdir}/${deb}" | sed -n '/^data\.tar/{p;q;}')"
    [[ -n "$data_archive" ]] || { echo "No data.tar.* member in ${deb}" >&2; return 1; }
    bsdtar -xOf "${srcdir}/${deb}" "$data_archive" | bsdtar --no-same-owner -xf - -C "${pkgdir}"

    # The program, the completions and the manual pages land in the places
    # Arch expects them already; only the licence has to move.
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/licenses/gitea-cli/LICENSE" \
       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rmdir "${pkgdir}/usr/share/licenses/gitea-cli"
}
