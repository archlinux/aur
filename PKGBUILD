# Maintainer: Landon Porter <dev@mazylol.com>

_pkgname=crain
pkgname="${_pkgname}-bin"
pkgver=0.1.0
pkgrel=2
pkgdesc="the worst storm this side of the silicon (terminal-based rain)"
url="https://codeberg.org/mazylol/crain"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('ncurses')
makedepends=('curl' 'unzip' 'zstd')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=('!strip')
source=()
sha256sums=()

prepare() {
    local artifact_url
    artifact_url="$(
        curl --fail --silent --show-error \
            'https://codeberg.org/api/v1/repos/mazylol/crain/actions/artifacts?name=crain-arch-x86_64&limit=1' |
            sed -n 's/.*"archive_download_url":"\([^"]*\)".*/\1/p'
    )"

    [[ -n "${artifact_url}" ]] || {
        printf 'Could not find the latest crain Arch artifact\n' >&2
        return 1
    }

    curl --fail --location --output "${srcdir}/artifact.zip" "${artifact_url}"
    unzip -j "${srcdir}/artifact.zip" '*.pkg.tar.zst' -d "${srcdir}"

    local package_file
    package_file="$(find "${srcdir}" -maxdepth 1 -name '*.pkg.tar.zst' -print -quit)"
    [[ -n "${package_file}" ]] || {
        printf 'The artifact did not contain an Arch package\n' >&2
        return 1
    }

    mkdir -p "${srcdir}/package"
    tar --use-compress-program=zstd -xf "${package_file}" -C "${srcdir}/package"
}

package() {
    mkdir -p "${pkgdir}/usr"
    cp -a "${srcdir}/package/usr/." "${pkgdir}/usr/"
}
