# original source code from crian <crian84 at gmail dot com> / temp package till 1.8.1 out
# this will be deleted when 1.8.1 out
pkgname=auto-cpufreq-no-gnome-power
pkgver=1.8.0
pkgrel=1
pkgdesc='TEMP Automatic CPU speed & power optimizer with non-systemd-gnome-power. original source code from crian. this will be deleted when 1.8.1 out'
arch=('any')
url="https://github.com/AdnanHodzic/auto-cpufreq"
license=('LGPL-3.0')
depends=('python-distro' 'python-psutil' 'python-click' 'dmidecode')
optdepends=('cpufreqctl: CPU Power Manager'
            'gnome-shell-extension-cpufreq: CPU Power Manager for GNOME Shell')
makedepends=('git' 'python-setuptools')
conflicts=('auto-cpufreq' 'auto-cpufreq-git')
install="${pkgname}.install"
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/${pkgname}"
    git fetch
    git checkout non-systemd-gnome-power
    sed -i 's|usr/local|usr|g' "scripts/${pkgname}.service" auto_cpufreq/core.py
}

build() {
    cd "$srcdir/${pkgname}"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
    install -Dm755 scripts/cpufreqctl.sh -t "$pkgdir/usr/share/$pkgname/scripts"
    install -Dm644 "scripts/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system"
}
