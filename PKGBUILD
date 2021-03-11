# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=auto-cpufreq
pkgver=1.6.3
pkgrel=1
pkgdesc="Automatic CPU speed & power optimizer"
arch=('any')
url="https://github.com/AdnanHodzic/auto-cpufreq"
license=('LGPL3')
depends=('python-distro' 'python-psutil' 'python-click' 'dmidecode')
optdepends=(
	'cpufreqctl: CPU Power Manager'
	'gnome-shell-extension-cpufreq: CPU Power Manager for GNOME Shell'
)
makedepends=('python-setuptools' 'gcc')
provides=("$pkgname")
conflicts=("$pkgname")
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('ab1f6e9ef279cbb4489dd378e950dd4858c63767cbe5b6081cb569fe42ddf253773d6d8f9a70b1c6982d524f399c2feef2b812790c621ec6290796ae2360360f')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's|usr/local|usr|g' "scripts/${pkgname}.service" auto_cpufreq/core.py
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm755 scripts/cpufreqctl.sh -t "$pkgdir/usr/share/$pkgname/scripts"
	install -Dm644 "scripts/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system"
}
