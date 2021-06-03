# Maintainer: anana5 <anana5@post.cz>

pkgname=pgadmin4-nwjs
pkgver=5.3
pkgrel=1
pkgdesc="Comprehensive design and management interface for PostgreSQL"
arch=('x86_64')
url="https://www.pgadmin.org/"
license=('GPL')
depends=('python' 'postgresql-libs' 'hicolor-icon-theme')
makedepends=('python-pip' 'yarn')
provides=('pgadmin4=5.3')
conflicts=('pgadmin4')
source=("$pkgname-$pkgver.tar.gz::https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v5.3/source/pgadmin4-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v5.3/source/pgadmin4-5.3.tar.gz.asc"
		  "config_local.py"
		  "pgadmin4_desktop_entry.patch")
sha256sums=('944da81e790dfb41609f73d64e517711553d7bdcfa5f35ee7b47f1d704bac0a8'
            'SKIP'
            '2a19360c2eec2fa92f91d0fb6fe78dbe8c999beff6a1a73efa3cdbf1da1c4f23'
				'bf81d7ddd5ff4e656f2dc05fff6bd7765e67163cb8c7aabcfd2b53e80257c430')
validpgpkeys=('E8697E2EEF76C02D3A6332778881B2A8210976F2') # Package Manager (Package Signing Key) <packages@pgadmin.org>

prepare() {
	patch pgadmin4-5.3/pkg/linux/pgadmin4.desktop pgadmin4_desktop_entry.patch
}

build() {
	export PGADMIN4_SRC="$srcdir/pgadmin4-$pkgver"

	echo "Building the runtime..."
	cd "$PGADMIN4_SRC/runtime"
	yarn install --production=true

	echo "Configuring the Python Environment..."
	cd "$PGADMIN4_SRC"
	python -m venv venv
	$PGADMIN4_SRC/venv/bin/pip install -r $PGADMIN4_SRC/requirements.txt
	cp $SRCDEST/config_local.py $PGADMIN4_SRC/web

	echo "Building the Web Assets..."
	cd "$PGADMIN4_SRC"
	make install-node
	make bundle
	rm -rfd web/node_modules
	
	echo "Building the documentation..."
	cd "$PGADMIN4_SRC"
	$PGADMIN4_SRC/venv/bin/pip install Sphinx
	make docs PYTHON=$PGADMIN4_SRC/venv/bin/python
}

package() {
	export PGADMIN4_SRC="$srcdir/pgadmin4-$pkgver"
	cd "$PGADMIN4_SRC"
	echo "Collecting the files. That might take a while..."
	install -dm 755 "$pkgdir/opt/pgadmin4-$pkgver/"
	find web -type f -exec install -Dm 755 "{}" "$pkgdir/opt/pgadmin4-$pkgver/{}" \;
	find docs -type f -exec install -Dm 755 "{}" "$pkgdir/opt/pgadmin4-$pkgver/{}" \;
	find venv -type f,l -exec install -Dm 755 "{}" "$pkgdir/opt/pgadmin4-$pkgver/{}" \;
	install -dm 755 "$pkgdir/opt/pgadmin4-$pkgver/runtime"
	NW_VERSION=$(cd runtime && yarn info nw | grep latest | awk -F "'" '{ print $2}')
   pushd "${BUILDROOT}" > /dev/null
       while true;do
           wget https://dl.nwjs.io/v${NW_VERSION}/nwjs-v${NW_VERSION}-linux-x64.tar.gz && break
           rm nwjs-v${NW_VERSION}-linux-x64.tar.gz
       done
       tar -zxvf nwjs-v${NW_VERSION}-linux-x64.tar.gz
   popd > /dev/null
	cd "$PGADMIN4_SRC/nwjs-v${NW_VERSION}-linux-x64"
	find . -type f -exec install -Dm 755 "{}" "$pkgdir/opt/pgadmin4-$pkgver/runtime/{}" \;
	cd "$PGADMIN4_SRC/runtime"
	find assets -type f -exec install -Dm 755 "{}" "$pkgdir/opt/pgadmin4-$pkgver/runtime/{}" \;
	find node_modules -type f -exec install -Dm 755 "{}" "$pkgdir/opt/pgadmin4-$pkgver/runtime/{}" \;
	find src -type f -exec install -Dm 755 "{}" "$pkgdir/opt/pgadmin4-$pkgver/runtime/{}" \;
	install -Dm 755 "package.json" -t "$pkgdir/opt/pgadmin4-$pkgver/runtime"

	cd "$PGADMIN4_SRC/pkg/linux"
	install -Dm 775 "pgadmin4-128x128.png" -t "$pkgdir/usr/share/icons/hicolor/128x128/apps/pgadmin4.png"
	install -Dm 775 "pgadmin4-64x64.png" -t "$pkgdir/usr/share/icons/hicolor/64x64/apps/pgadmin4.png"
	install -Dm 775 "pgadmin4-48x48.png" -t "$pkgdir/usr/share/icons/hicolor/48x48/apps/pgadmin4.png"
	install -Dm 775 "pgadmin4-32x32.png" -t "$pkgdir/usr/share/icons/hicolor/32x32/apps/pgadmin4.png"
	install -Dm 775 "pgadmin4-16x16.png" -t "$pkgdir/usr/share/icons/hicolor/16x16/apps/pgadmin4.png"
	install -Dm 775 "pgadmin4.desktop" -t "$pkgdir/usr/share/applications"
}
