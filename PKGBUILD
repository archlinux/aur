# Maintainer: Jacob McSwain <jacob@mcswain.dev>
pkgname=cuttlefish-user-git
pkgver=0.9.25
pkgrel=1
pkgdesc="Cuttlefish Android Virtual Device companion package contains set of tools and binaries required to boot up and manage Cuttlefish Android Virtual Device that are used in all deployments."
arch=(any)
license=(Apache)
url="https://github.com/google/android-cuttlefish"
makedepends=("git" "go")
depends=(
    "cuttlefish-base-git"
    "openssl"
    "start-stop-daemon"
)
source=("${pkgname%-git}::git+https://github.com/google/android-cuttlefish.git")
sha256sums=('SKIP')
install="install.sh"

prepare() {
    patch "$srcdir/${pkgname%-git}"/frontend/debian/cuttlefish-user.cuttlefish-operator.init < ../0001-Fixup-init.d-service-to-be-used-in-usr-bin-for.patch
}

package() {
    install -Dm0644 ../cuttlefish-operator.service "$pkgdir/usr/lib/systemd/system/cuttlefish-operator.service"

    cd "$srcdir/${pkgname%-git}"

    install -Dm0644 frontend/debian/cuttlefish-user.cuttlefish-operator.default "$pkgdir/etc/default/cuttlefish-operator"
    install -Dm0755 frontend/debian/cuttlefish-user.cuttlefish-operator.init "$pkgdir/usr/bin/cuttlefish-operator"

    install -Dm0644 frontend/src/operator/intercept/js/server_connector.js "$pkgdir/usr/share/cuttlefish-common/operator/intercept/js/server_connector.js"

    cd frontend
    ./build-webui.sh

    mkdir -p "$pkgdir/usr/share/cuttlefish-common/operator/static"
    find src/operator/webui/dist/static -type f -exec install -Dm0644 "{}" "$pkgdir/usr/share/cuttlefish-common/operator/static/" \;

    cd src/operator
    go get
    go build -trimpath -o operator
    install -Dm0755 operator "$pkgdir/usr/lib/cuttlefish-common/bin/operator"

    cd ../../..

    install -Dm0644 frontend/debian/copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm0644 frontend/debian/copyright "$pkgdir"/usr/share/doc/$pkgname/copyright
    install -Dm0644 frontend/debian/changelog "$pkgdir"/usr/share/doc/$pkgname/changelog
}

# vim: ft=sh:ts=4:sw=4:et:nowrap
