# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gitlab-workhorse
pkgver=0.4.0
pkgrel=2
pkgdesc="HTTP server to unload Git HTTP traffic from GitLab Rails app (Unicorn)"
arch=('i686' 'x86_64')
url="https://gitlab.com/gitlab-org/gitlab-workhorse"
license=('MIT')
depends=('gitlab')
conflicts=('gitlab-git-http-server')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/gitlab-org/${pkgname}/repository/archive.tar.gz?ref=${pkgver}"
        "gitlab-workhorse.service")
sha256sums=('1e260a6443ce09758028f1c65f48416680ee89fb9efad813097183b09aefabf5'
            'c9634b8b49f2baa4cb3a71db561e32f7426539f129c826529a8b0d4788774113')

prepare() {
    extract_loc=$(find ./ -maxdepth 1 -type d -name "${pkgname}-${pkgver}-*" )
    [[ -h "${pkgname}-${pkgver}" ]] || ln -s "$extract_loc" "${pkgname}-${pkgver}"
}

build() {
    cd "${pkgname}-${pkgver}"
    make gitlab-workhorse
}

package() {
    install -Dm755 "${pkgname}-${pkgver}/gitlab-workhorse" "${pkgdir}/usr/bin/gitlab-workhorse"
    install -Dm0644 gitlab-workhorse "${pkgdir}/usr/lib/systemd/system/gitlab-workhorse"
}
