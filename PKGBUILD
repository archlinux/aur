# Maintainer: Jacob McSwain <jacob@mcswain.dev>
pkgname=cuttlefish-user-git
epoch=1
pkgver=r6181.20240702.8b6907327
pkgrel=1
pkgdesc="Cuttlefish Android Virtual Device companion package contains set of tools and binaries required to boot up and manage Cuttlefish Android Virtual Device that are used in all deployments."
arch=(any)
license=(Apache)
url="https://github.com/google/android-cuttlefish"
makedepends=("git" "go")
depends=(
    "cuttlefish-base-git"
    "openssl"
)
provides=(
  "${pkgname%-git}"
)
conflicts=(
  "${pkgname%-git}"
)
source=(
  "${pkgname%-git}::git+https://github.com/google/android-cuttlefish.git"
  "0001-Fixup-init.d-service-to-be-used-in-usr-bin-for.patch"
  "cuttlefish-operator.service"
  "cuttlefish-user.install"
)
sha256sums=(
  'SKIP'
  'c833d37fc97d0a26be71cd068bf7788d1e1f038dbca74f307b7e944f745fec41'
  '6e5e9bf246c45031aea13256fd7b36df797f031ea8952a65ca2f3c4d8a149877'
  '9317ba70f2948d9117bd75d9040b75a5c2b7834f7e3eb682d8a7ada91c7e7e18'
)
install="cuttlefish-user.install"

prepare() {
  cd "$srcdir/${pkgname%-git}"

  patch frontend/debian/cuttlefish-user.cuttlefish-operator.init < "${srcdir}"/0001-Fixup-init.d-service-to-be-used-in-usr-bin-for.patch
  git log > git.log
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Could not determine git commit count."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
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
