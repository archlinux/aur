# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=auto-cpufreq
pkgver=1.9.8
pkgrel=1
pkgdesc="Automatic CPU speed & power optimizer"
arch=('any')
url="https://github.com/AdnanHodzic/auto-cpufreq"
license=('LGPL3')
depends=('python-setuptools' 'python-distro' 'python-psutil' 'python-click' 'dmidecode')
optdepends=(
	'cpufreqctl: CPU Power Manager'
	'gnome-shell-extension-cpufreq: CPU Power Manager for GNOME Shell'
	'thermald: recommended to have running alongside by upstream'
)
makedepends=('python-pip' 'python-wheel')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" "$pkgname.service")
b2sums=('dc4097cfe4117851a488f07b6393fd9f543ed7ce854cc214c7f67472e577bf7b618ac0cfdc5eeabe63b8488eb6575bad79248f1748cc85804ce833f3fb62522a'
        '90d9a6e0a86d01803527462e0ed0ce93d04d245c2c99ab773f31e1eb46dd86b209f98af50967bbdb6627563b0aae0ca4bbc861c812576a243b07c40a483c37db')

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
	install -Dm644 "$srcdir/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system"
}
