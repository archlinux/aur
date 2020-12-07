# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=auto-cpufreq
pkgver=1.5.1
pkgrel=1
pkgdesc="Automatic CPU speed & power optimizer"
arch=('any')
url="https://github.com/AdnanHodzic/auto-cpufreq"
license=('LGPL3')
depends=('python-distro' 'python-psutil' 'python-click')
makedepends=('python-setuptools')
provides=("$pkgname")
conflicts=("$pkgname")
install="$pkgname.install"
source=( "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('846d0ec46f82d1545aac63807c22086dbd3956c25e5398e39f709ccfc8c1f327')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's|usr/local|usr|g' "scripts/${pkgname}.service" source/core.py
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
