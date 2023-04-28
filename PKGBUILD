# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Gleb Sinyavskiy <zhulik.gleb@gmail.com>

_archive_extension='tar.gz'
pkgname=system-bridge
pkgver=3.6.2
pkgrel=2
epoch=1
pkgdesc="Bridges your system to other systems, like Home Assistant"
arch=('any')
url="https://github.com/timmo001/$pkgname"
license=(MIT)
depends=(
	'lshw'
	# shared, backend, cli, connector, gui
	'python-incremental>=22.10.0'
	# shared, backend, connector, gui
	'python-aiohttp>=3.8.3'
	# shared, connector
	'python-pydantic>=1.10.4'
	# shared
	'python-appdirs>=1.4.4'
	'python-colorlog>=6.7.0'
	'python-cryptography>=39.0.0'
	'python-pandas>=1.5.2'
	'python-sqlmodel>=0.0.8'
	# backend
	'python-aiofiles>=22.1.0'
	'python-aiogithubapi>=22.12.2'
	'python-fastapi>=0.88.0'
	'python-keyboard>=0.13.5'
	'python-mutagen>=1.46.0'
	'python-plyer>=2.1.0'
	'python-psutil>=5.9.4'
	'python-python-multipart>=0.0.5'
	'python-screeninfo>=0.8.1'
	'uvicorn>=0.20.0'
	'python-zeroconf' #>=0.47.1'
	# cli
	'python-shellingham>=1.5.0.post1'
	'python-tabulate>=0.9.0'
	# cli, gui
	'python-typer>=0.7.0'
	#connector
	'python-pydantic>=1.9.0'
	# gui
	'python-pyperclip>=1.8.2'
	'pyside6>=6.4.1'
)
makedepends=(
	yarn
	node-gyp
	python-build
	python-installer
	python-wheel
	libxss
	gtk3
	nss
)
optdepends=(
	'upower: To read battery information'
)
source=(
	"$pkgname-$pkgver.$_archive_extension::https://github.com/timmo001/$pkgname/archive/refs/tags/$pkgver.$_archive_extension"
	"$pkgname.desktop"
	"$pkgname"
	"$pkgname.service"
)
b2sums=('905bf6492379563a3a49686f04ebd4532b89e14b4ccb1c4266e36c7e0d51ba67588feb3e8f2fe9c20eb3bf1e3672a8eb66ff26fd57b3a3bde49c219ac757867b'
        'fa5f2b2bb64d44f7791fe8631481cf294f0a3afa88f1ac7fdb55508df9acc4ad26b1723cadebbf1bc09369c2e3732c6628b6b06d44c3bdcebee0d5913d85d097'
        '26634fe43624791f7ae6fe85e70792fcf67fcd5a9997ba40043c49a636d939d610eb5e6ededdf1e6723dd8280e924160e72a8469501a1436ad67f28eab2d4fef'
        '03852934e853a7a5973e4139a9c51a160df81af1fa958ac6550a6525aa97ad3ebc983bf4a662cce345e04cc0451912687d4c199c9152c7160b173abad2b73b37')

prepare() {
	cd "$srcdir/$pkgname-$pkgver/frontend"

	yarn install
}
build() {
	for command in 'shared' 'backend' 'cli' 'connector' 'frontend' 'gui'; do
	
		cd "$srcdir/$pkgname-$pkgver/$command"
		if [ "$command" == 'frontend' ]; then
			yarn build
			yarn export
		fi
		python -m build --wheel --no-isolation
	done
}

package() {
	for command in 'shared' 'backend' 'cli' 'connector' 'frontend' 'gui'; do
	
		cd "$srcdir/$pkgname-$pkgver/$command"

		python -m installer --compile-bytecode=2 --destdir="$pkgdir" dist/*.whl
	done

	cd "$srcdir"
	install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm 644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	cd "$srcdir/$pkgname-$pkgver"
	install -Dm 644 "resources/$pkgname.svg" "$pkgdir/usr/share/icons/$pkgname.svg"
        install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
