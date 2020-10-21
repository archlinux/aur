# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Yosef Langer (vasilevich1234 dot gmail dot ...)

_commit=734ff631f254d8f17661d81e43927ba68e69f545
pkgname=nginxbeautifier
pkgver=1.0.19
pkgrel=1
pkgdesc="nginx config file formatter and beautifier"
arch=(any)
url="https://github.com/vasilevich/nginxbeautifier"
license=("Apache")
depends=("nodejs")
makedepends=("git" "npm")
source=("$pkgname::git+https://github.com/vasilevich/nginxbeautifier.git#commit=${_commit}")
sha512sums=('SKIP')


prepare() {
    cd "${pkgname}"

    # remove junk
    rm -rf ".idea/"
}

build() {
    cd "${pkgname}"

    # We create a taball of the project as "npm installing" (see package()) the directory itself only creates symlinks
    npm pack
}

package() {
    cd "${pkgname}"

    npm install -g --user root --prefix "${pkgdir}/usr" "${pkgname}-${pkgver}.tgz"
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    ln -s "/usr/lib/node_modules/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
