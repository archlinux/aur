# Maintainer: James An <james@jamesan.ca>
# Contributor: stef312 <stef312_at_gmail_dot_com>

_pkgname=CipherShed
pkgname=${_pkgname,,}-nogui-git
pkgver=tc7.1a.r107.ge8529e9
pkgrel=2
pkgdesc="Free encryption software for keeping your data secure and private, a fork of the now-discontinued TrueCrypt Project (CLI)"
url="https://ciphershed.org/"
arch=('i686' 'x86_64')
license=('custom:truecrypt')
depends=(
    'fuse>=2.8.0'
    'device-mapper'
)
makedepends=('nasm' 'git')
optdepends=('sudo: mounting encrypted volumes as nonroot users')
conflicts=('truecrypt' 'truecrypt-utils', 'truecrypt-nogui', "${_pkgname,,}", "${_pkgname,,}-nogui")
replaces=('truecrypt' 'truecrypt-utils', 'truecrypt-nogui')
changelog='ChangeLog'
source=(
    "git+https://github.com/${_pkgname}/${_pkgname}.git"
    'https://github.com/wxWidgets/wxWidgets/archive/WX_2_8_12.tar.gz'
    'ChangeLog'
)
md5sums=(
    'SKIP'
    '063c8519d4216a7fed9de8fd1b4fee3e'
    'd93642c780ce59a41afa77dff13decd2'
)

pkgver() {
  cd "${_pkgname}"
    (
        set -o pipefail
        git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
  cd "${_pkgname}/src"

    export LIBS="-ldl"
    make NOGUI=1 WX_ROOT="${srcdir}/wxWidgets-WX_2_8_12" wxbuild
    make NOGUI=1 WXSTATIC=1
}

package() {
  cd "${_pkgname}/src"

  install -Dm755 "Main/${_pkgname,,}" "${pkgdir}/usr/bin/${_pkgname,,}"
  install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${_pkgname,,}-nogui/LICENSE"
}
