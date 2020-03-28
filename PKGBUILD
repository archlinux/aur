# $Id$
# Maintainer: Max Mazurov <fox.cpp at disroot dot org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>
pkgname='maddy-git'
pkgver=v0.1.1.r0.g8f1d572
pkgrel=1
pkgdesc='Composable all-in-one mail server (Development version)'
arch=('x86_64')
url='https://github.com/foxcpp/maddy'
license=('MIT')
depends=('glibc')
makedepends=('go' 'git' 'scdoc')
optdepends=(
    "bash: For rspamd-hook script"
)
# Upstream 'master' branch is frozen at the latest release. 'dev' branch is
# where pending changes are pushed.
source=(
    "${pkgname}::git+https://github.com/foxcpp/maddy.git#branch=dev"
    'maddy.sysusers'
    'maddy.tmpfiles'
)
backup=('etc/maddy/maddy.conf')
sha512sums=(
    'SKIP'
    '750346110adb8caa61f537560018497f73543dc01ff26aceed2f052f281a35fdc659c9c478cc55775eadf8a3d17b511d5bed86334d1c455732dcb9a273120589'
    'f33135b81129d6ef3006d8e9f410ec0d7e44226ae640dea77d756268d0e97828d8965ac75d0d9b49604a19b8b9e0384d15007d33c4b813f359108d28a10702b5'
)

pkgver() {
    cd "${srcdir}/${pkgname}"

    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/${pkgname}"
    export GOPATH="$PWD/gopath"

    ./build.sh --version "v${pkgver}" --prefix /usr package
}

check() {
    export GOPATH="$PWD/gopath"
    cd "${srcdir}/${pkgname}"

    go test ./...

    cd tests/
    ./run.sh
}

package() {
    cd "${srcdir}/${pkgname}"
    export GOPATH="$PWD/gopath"

    ./build.sh \
        --version "v${pkgver}" \
        --prefix /usr \
        --destdir "${pkgdir}" \
        install_pkg

    install -Dm 0644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 0644 "${srcdir}/maddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/maddy.conf"
    install -Dm 0644 "${srcdir}/maddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/maddy.conf"
}
