# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=auto-cpufreq
pkgver=1.6.2
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
b2sums=('155293178e790e449e50a9b2e49cb73556664e307e5e97b40c2ab2bb4dec48e1ae1065de80c53f8e447e24de6d797b981a4097fb10e6ba7f206d780eeff8f70a')

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
