pkgname=auto-cpufreq-git

_pkgname=auto-cpufreq
pkgver=2.6.0.r24.g76ccb66
pkgrel=1
pkgdesc='Automatic CPU speed & power optimizer'
arch=('any')
url="https://github.com/AdnanHodzic/auto-cpufreq"
license=('LGPL-3.0')
depends=('python' 'python-setuptools' 'python-psutil' 'python-click' 'python-distro' 'python-requests' 'python-gobject' 'python-pyinotify' 'python-urwid' 'python-pyasyncore' 'dmidecode' 'gobject-introspection' 'gtk3')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry-core' 'python-poetry-dynamic-versioning' )
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=("git+${url}.git" "${pkgname%-git}.service" "001-fix-icon-n-style-locations.patch" "002-fix-other-icon-path.patch")
sha256sums=('SKIP'
            '3151795e5231780865b4523107478dd1998fe3c183bd59dee70ae68f470a7659'
            '227d85df7f71187c87e24388104f0127b13a680c1e859a90a14864a0d29e1fdf'
            '0db58e3a6185418677a5c4f2ea15d7a1becf08bc2d955b8ffb9783190dd4666c')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -i 's|usr/local|usr|g' "scripts/${pkgname%-git}.service" auto_cpufreq/core.py
    patch --strip=2 --input=../001-fix-icon-n-style-locations.patch
	patch --strip=2 --input=../002-fix-other-icon-path.patch

}

build() {
    cd "$srcdir/${pkgname%-git}"
    POETRY_DYNAMIC_VERSIONING_BYPASS=1 python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_pkgname"

	python -m installer --destdir="$pkgdir" dist/*.whl

	# install -Dm755 scripts/auto-cpufreq-venv-wrapper "$pkgdir/usr/bin/auto-cpufreq"
	# install -Dm755 scripts/start_app "$pkgdir/usr/bin/auto-cpufreq-gtk"
	install -Dm644 scripts/org.auto-cpufreq.pkexec.policy -t "$pkgdir/usr/share/polkit-1/actions/"
	install -Dm644 images/icon.png "$pkgdir/usr/share/pixmaps/auto-cpufreq.png"
	install -Dm644 images/icon.png -t "$pkgdir/usr/share/$pkgname/"
	
	mkdir -p $pkgdir/usr/share/$_pkgname/scripts/
	mkdir -p $pkgdir/opt/auto-cpufreq/
	
	install -Dm755 scripts/auto-cpufreq-install.sh "$pkgdir/usr/share/$_pkgname/scripts/"
	install -Dm755 scripts/auto-cpufreq-remove.sh "$pkgdir/usr/share/$_pkgname/scripts/"
	install -Dm644 $srcdir/auto-cpufreq.service "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	install -Dm755 scripts/cpufreqctl.sh "$pkgdir/usr/share/$_pkgname/scripts/"
	install -Dm644 scripts/style.css "$pkgdir/usr/share/$_pkgname/scripts"
	install -Dm644 scripts/auto-cpufreq-gtk.desktop -t "$pkgdir/usr/share/applications/"
	}
