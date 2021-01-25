# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=auto-cpufreq
pkgver=1.5.3
pkgrel=2
pkgdesc="Automatic CPU speed & power optimizer"
arch=('any')
url="https://github.com/AdnanHodzic/auto-cpufreq"
license=('LGPL3')
depends=('python-distro' 'python-psutil' 'python-click')
optdepends=(
	'cpufreqctl: CPU Power Manager'
	'gnome-shell-extension-cpufreq: CPU Power Manager for GNOME Shell'
)
makedepends=('python-setuptools' 'gcc')
provides=("$pkgname")
conflicts=("$pkgname")
install="$pkgname.install"
source=( "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d1d93698b2fbce8814ef1f1d92c277d93e2375757627739172cae15ab34bacdd')

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
