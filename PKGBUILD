# Maintainer: Julia Abdel-Monem <juliaviolet.dev>
# Maintainer: Parmjot Singh <parmjotsinghrobot at gmail dot com>
# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
# shellcheck disable=SC2034,2164,2154
pkgname=auto-cpufreq
pkgver=2.1.0
pkgrel=3
pkgdesc="Automatic CPU speed & power optimizer"
arch=('any')
url="https://github.com/AdnanHodzic/auto-cpufreq"
license=('LGPL3')
depends=('python' 'python-pip' 'python-setuptools' 'dmidecode' 'gobject-introspection' 'gtk3')

install="$pkgname.install"

source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"001-fix-icon-n-style-locations.patch"
	"002-fix-other-icon-path.patch"
)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's|usr/local|usr|g' "scripts/${pkgname}.service" auto_cpufreq/core.py
	patch --strip=2 --input=../001-fix-icon-n-style-locations.patch
	patch --strip=2 --input=../002-fix-other-icon-path.patch
}

sha256sums=('77a5ce9dc8044c5e5bf5770a6c3e16a252f8cef8c80ecc6eed9fefddc6ec825b'
            'afe7e64dbde2ea599b319e8632d72a3c237b5c4275dd31d0f40e39719193a67b'
            'c89514e12efcb161d678e6c0c978e08faf41a08625bd4a83b893c1e05cd8429e'
)

package() {
	cd "$srcdir"

	mkdir -p $pkgdir/opt/$pkgname/
	mkdir -p $pkgdir/opt/$pkgname/venv/

	cp -R $pkgname-$pkgver $pkgdir/opt/$pkgname/src

	cd $pkgname-$pkgver

	install -Dm755 scripts/auto-cpufreq-venv-wrapper "$pkgdir/usr/bin/auto-cpufreq"
	install -Dm755 scripts/start_app "$pkgdir/usr/bin/auto-cpufreq-gtk"
	install -Dm644 scripts/org.auto-cpufreq.pkexec.policy -t "$pkgdir/usr/share/polkit-1/actions/"
	install -Dm644 images/icon.png "$pkgdir/usr/share/pixmaps/auto-cpufreq.png"
	install -Dm644 images/icon.png -t "$pkgdir/usr/share/$pkgname/"
	
	mkdir -p $pkgdir/usr/share/$pkgname/scripts/
	
	install -Dm755 scripts/auto-cpufreq-install.sh "$pkgdir/usr/share/$pkgname/scripts/"
	install -Dm755 scripts/auto-cpufreq-remove.sh "$pkgdir/usr/share/$pkgname/scripts/"
	install -Dm644 scripts/auto-cpufreq.service "$pkgdir/etc/systemd/system/$pkgname.service"
	install -Dm755 scripts/cpufreqctl.sh "$pkgdir/usr/share/$pkgname/scripts/"
	install -Dm644 scripts/style.css "$pkgdir/usr/share/$pkgname/scripts/"
	install -Dm644 scripts/auto-cpufreq-gtk.desktop -t "$pkgdir/usr/share/applications/"

}
