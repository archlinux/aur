# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=goresym-bin
pkgver=3.4.1
pkgrel=1
pkgdesc='Go symbol recovery tool'
# Upstream publishes only an x86-64 Linux build.
arch=('x86_64')
url='https://github.com/mandiant/GoReSym'
license=('MIT')
provides=('goresym')
conflicts=('goresym')
options=('!debug')

source=("goresym-${pkgver}.zip::${url}/releases/download/v${pkgver}/GoReSym-linux.zip"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('a557124857f95a589f8ce3525119c2d18c7c7fc7c4225c92ff94e3effb38748d'
            'd7341d45c966aa10eba9d7f31bedb95db370acaf928fcaafdaa51ad29a0217b0')

latestver() {
    gh api --paginate repos/mandiant/GoReSym/releases \
        --jq '.[] | select(.prerelease == false and .draft == false) | .tag_name' \
    | sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

package() {
    install -Dm755 GoReSym "${pkgdir}/usr/bin/goresym"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Static executables get only --strip-debug from makepkg, which leaves .symtab and
    # .strtab behind; Go needs neither at runtime.
    strip --strip-unneeded "${pkgdir}/usr/bin/goresym"
}
