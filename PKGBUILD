# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=docker-pushmi-pullyu-git
_pkgname=docker-pushmi-pullyu
pkgver=r68.12d2893
pkgrel=1
provides=("$_pkgname")
conflicts=("$_pkgname")
pkgdesc='Copy Docker images directly to a remote host without using Docker Hub or a hosted registry'
arch=('x86_64')
url="https://github.com/mkantor/$_pkgname"
license=('Unlicense')
depends=('bash' 'docker' 'openssh')
makedepends=('git')
source=("git+${url}" plugin.patch)
sha256sums=('SKIP'
            '467abfc764c4a3177398be1edd8165816b21c730dde47fe435039a0643acccc3')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    patch --forward --strip=1 --input="$srcdir/plugin.patch"
    sed -i "s|%VENDOR%|$url|" "$_pkgname"
    sed -i "s|%VERSION%|$pkgver|" "$_pkgname"
    sed -i "s|%DESCRIPTION%|$pkgdesc|" "$_pkgname"
}

package() {
    cd "$_pkgname"
    install -Dm 755 "$_pkgname" "$pkgdir/usr/lib/docker/cli-plugins/docker-pushmi"
}
