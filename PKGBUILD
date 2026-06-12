# Maintainer: taotieren <admin@taotieren.com>

pkgname=sigma-file-manager
_tagname=2.1.0
pkgver="${_tagname//-/_}"
pkgrel=1
pkgdesc="\"Sigma File Manager\" is a free, open-source, quickly evolving, modern file manager (explorer / finder) app for Windows and Linux."
arch=($CARCH)
url="https://github.com/aleksey-hoffman/sigma-file-manager"
license=('GPL-3.0-or-later')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
replaces=()
depends=(
    glibc
    libgcc
    nodejs
    # AUR 
    zx
)
makedepends=(
    git
    electron-builder
    npm
    node-gyp
)
backup=()
options=('!strip' '!debug')
install=
source=("${pkgname}::git+${url}.git#tag=v${_tagname}")
sha256sums=('6647899578dee80ff8a60a2bcacd1bc7e3e7ed3bacc84d90a0fcd7803b28e0e4')
noextract=("${pkgname}-${_tagname}.tar.gz")

prepare() {
	git -C "${srcdir}/${pkgname}" clean -dfx
}

package() {
    cd "${srcdir}/${pkgname}"
    npm install -g --prefix "${pkgdir}/usr" $(npm pack)

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
