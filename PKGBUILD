# Maintainer: Daniel Kessler <dkess@dkess.me>

pkgname=alertmanager-matrix
pkgver=0.0.4
pkgrel=1
pkgdesc='Alertmanager webhook receiver that sends to a Matrix channel'
arch=('x86_64' 'i686')
url='http://github.com/dkess/alertmanager_matrix'
license=('Apache')
makedepends=('go' 'git')
backup=('etc/ammatrix.yml')
provides=('alertmanager-matrix')
conflicts=('alertmanager-matrix')
source=("alertmanager_matrix-$pkgver.tar.gz::https://github.com/dkess/alertmanager_matrix/archive/v${pkgver}.tar.gz"
        alertmanager-matrix.service
        alertmanager-matrix.sysusers
        alertmanager-matrix.tmpfiles)
sha256sums=('036e32685d2e83f1e63fb628c92d9bae438705eeee82630718b105666632518c'
            '20c89a35a4af468d99ee16a9960a8d00e90c47fd377e83b0c77e89864829b5d4'
            '7214f94ad898305e8054c0382eca49136ba82d4f97fc3e747a5e2a9a18fa7573'
            'e91e9be3b0c25daddf38cb18ad792bffe040e88074b49043c9a49638e17d73bc')

build() {
    cd "alertmanager_matrix-$pkgver"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    make PREFIX=/usr
}

package() {
    install -Dm644 alertmanager-matrix.service "$pkgdir"/usr/lib/systemd/system/alertmanager-matrix.service
    install -Dm644 alertmanager-matrix.sysusers "$pkgdir"/usr/lib/sysusers.d/alertmanager-matrix.conf
    install -Dm644 alertmanager-matrix.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/alertmanager-matrix.conf
    cd "alertmanager_matrix-$pkgver"
    install -Dm644 ammatrix.example.yml "$pkgdir"/etc/ammatrix.yml
    make PREFIX=/usr DESTDIR=$pkgdir install
}
