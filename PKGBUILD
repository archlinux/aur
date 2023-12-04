# Maintainer: Tuure Piitulainen <tuure.piitulainen@gmail.com>

pkgname="vivify"
pkgver="0.1.3"
pkgrel=1
pkgdesc="Markdown preview tool which can be used standalone or plug into an editor like (Neo)Vim"
arch=("x86_64")
url="https://github.com/jannis-baum/vivify"
license=("GPL3")
depends=("jq" "gcc-libs" "sh")
makedepends=("yarn")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jannis-baum/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=("5b8a6e258ebdb057c1be57a371ecdb4f")

# Stripping 'unneeded symbols' causes vivify-server executable to break
# (exits with error `Pkg: Error reading from file`)
options=(!strip)

build() {
	cd "${pkgname}-${pkgver}"
        yarn install

        node_modules/.bin/tsc --project . \
            && node_modules/.bin/pkg . \
            || exit 1
}

package() {
	cd "${pkgname}-${pkgver}"
        install -Dm755 ./viv                     "${pkgdir}/usr/bin/viv"
        install -Dm755 ./bin/vivify-server-linux "${pkgdir}/usr/bin/vivify-server"
        install -Dm644 ./LICENSE                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
