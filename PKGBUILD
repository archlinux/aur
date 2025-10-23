# Maintainer: Tuure Piitulainen <tuure.piitulainen@gmail.com>

pkgname="vivify"
pkgver="0.11.0"
pkgrel=1
pkgdesc="Markdown preview tool which can be used standalone or plug into an editor like (Neo)Vim"
arch=("x86_64")
url="https://github.com/jannis-baum/vivify"
license=("GPL-3.0-or-later")
depends=("gcc-libs" "sh")
makedepends=("yarn" "nvm" "zip")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("8fb7a6bfd3d7fc4cc41bceadb75901f992321abb2250a17575f60a343717955b")

# Stripping 'unneeded symbols' causes vivify-server executable to break
# (segmentation fault)
options=(!strip)

# https://wiki.archlinux.org/title/Node.js_package_guidelines#Using_nvm
_ensure_local_nvm() {
        which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
        export NVM_DIR="${srcdir}/.nvm"
        source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

build() {
	cd "Vivify-${pkgver}"

        # This package uses Node SEA, which is alpha and experimental
        # https://nodejs.org/api/single-executable-applications.html
        # Using system node results in a segfaulting binary
        # As a workaround, use latest node from nvm
        _ensure_local_nvm
        nvm install node

        yarn install
        VIV_VERSION="v${pkgver}-${pkgrel}-aur" make linux
}

package() {
	cd "Vivify-${pkgver}"

        install -Dm755 ./build/linux/viv           "${pkgdir}/usr/bin/viv"
        install -Dm755 ./build/linux/vivify-server "${pkgdir}/usr/bin/vivify-server"
        install -Dm644 ./LICENSE                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
