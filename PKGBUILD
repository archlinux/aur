pkgname=nbopen
pkgver=0.6
pkgrel=2
pkgdesc='Opens an Jupyter notebook in the best available server'
url="https://github.com/takluyver/$pkgname"
arch=('any')
license=('BSD')
depends=(python jupyter 'shared-mime-info>=1.7')
makedepends=(install-wheel-scripts)
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('5d3b9de63fb7e2a9658bc474d957c40e3ac2f101ae98b886f9259c66707c41db')

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	mkdir -p "$site"
	unzip "$_wheel" -d "$site"
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
	chmod 644 "$site/nbopen-0.6.dist-info/"*
	
	cd "$srcdir/$pkgname"
	local desktopfile="$pkgdir/usr/share/applications/nbopen.desktop"
	install -Dm755 nbopen.desktop "$desktopfile"
	sed -i 's/{PYTHON}/python3/' "$desktopfile"
	
	for s in 16 24 32 48 64 128 256 512; do
		install -Dm644 "icons/ipynb_icon_${s}x${s}.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/mimetypes/application-x-ipynb+json.png"
	done
	
	rm -rf "$pkgdir/usr/lib/python"*'/site-packages/nbopen/'{application-x-ipynb+json.xml,icons,nbopen.desktop}
}
