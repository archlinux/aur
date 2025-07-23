# Maintainer: Tuure Piitulainen <tuure.piitulainen@gmail.com>

_pkgname="vivify"
pkgname="vivify-git"
provides=("vivify")
conflicts=("vivify")
pkgver="v0.6.2.r0.g23c3e71"
pkgrel=5
pkgdesc="Markdown preview tool which can be used standalone or plug into an editor like (Neo)Vim"
arch=("x86_64")
url="https://github.com/jannis-baum/vivify"
license=("GPL-3.0-or-later")
depends=("gcc-libs" "sh")
makedepends=("git" "yarn" "nvm" "zip")
source=("${pkgname}::git+${url}.git")
sha256sums=("SKIP")

# Stripping 'unneeded symbols' causes vivify-server executable to break
# (segmentation fault)
options=(!strip)

pkgver() {
        cd "$pkgname"
        git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# https://wiki.archlinux.org/title/Node.js_package_guidelines#Using_nvm
_ensure_local_nvm() {
        which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
        export NVM_DIR="${srcdir}/.nvm"
        source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

build() {
	cd "${srcdir}/${pkgname}"

        # This package uses Node SEA, which is alpha and experimental
        # https://nodejs.org/api/single-executable-applications.html
        # Using system node results in a segfaulting binary
        # As a workaround, use latest node from nvm
        _ensure_local_nvm
        nvm install node

        yarn install
        VIV_VERSION="${pkgver}-${pkgrel}-aur" make linux
}

package() {
	cd "${srcdir}/${pkgname}"

        install -Dm755 ./build/linux/viv           "${pkgdir}/usr/bin/viv"
        install -Dm755 ./build/linux/vivify-server "${pkgdir}/usr/bin/vivify-server"
        install -Dm644 ./LICENSE                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
