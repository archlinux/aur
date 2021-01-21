# Maintainer: crian <crian84 at gmail dot com>

pkgname=auto-cpufreq-git
pkgver=1.5.2.r193.a91d4ba
pkgrel=1
pkgdesc='Automatic CPU speed & power optimizer'
arch=('any')
url="https://github.com/AdnanHodzic/auto-cpufreq"
license=('LGPL-3.0')
depends=('python-distro' 'python-psutil' 'python-click')
optdepends=('cpufreqctl: CPU Power Manager'
            'gnome-shell-extension-cpufreq: CPU Power Manager for GNOME Shell')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    local srcversion="$(grep "version: '" snap/snapcraft.yaml | cut -d "'" -f 2)"
    printf "%s.r%s.%s" $srcversion "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -i 's|usr/local|usr|g' "scripts/${pkgname%-git}.service" source/core.py
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README"
    install -Dm755 scripts/cpufreqctl.sh -t "$pkgdir/usr/share/${pkgname%-git}/scripts"
    install -Dm644 "scripts/${pkgname%-git}.service" -t "$pkgdir/usr/lib/systemd/system"
}
