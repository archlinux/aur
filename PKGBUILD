# Maintainer: Adam <adam@atlas-sw.com>
pkgname=razer-fn-fix-git
_basever=1.2.0
pkgver=1.2.0.r14.gb70ba3a
pkgrel=1
pkgdesc="JIT low-level hypershift key layer fix for Razer Keyboards."
arch=('x86_64' 'aarch64')
url="https://github.com/Adam-AtlasSoftware/razer-fn-fix"
license=('GPL-3.0-only AND MIT')
depends=('glibc')
makedepends=('gcc' 'git')
provides=('razer-fn-fix')
conflicts=('razer-fn-fix')
install=razer-fn-fix.install

source=("${pkgname}::git+https://github.com/Adam-AtlasSoftware/razer-fn-fix.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "%s.r%s.g%s" "$_basever" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/${pkgname}"
    gcc $CPPFLAGS $CFLAGS -O3 $LDFLAGS razer_driver.c cJSON.c -lm -o razer_driver
}

package() {
    install -Dm755 "$srcdir/${pkgname}/razer_driver" "$pkgdir/usr/bin/razer_driver"
    install -Dm644 "$srcdir/${pkgname}/razer-fn.service" "$pkgdir/usr/lib/systemd/system/razer-fn.service"
    install -Dm644 "$srcdir/${pkgname}/99-razer-input.rules" "$pkgdir/usr/lib/udev/rules.d/99-razer-input.rules"
    install -Dm644 "$srcdir/${pkgname}/LICENSE.cJSON" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.cJSON"
}
