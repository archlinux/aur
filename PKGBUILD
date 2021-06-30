# Maintainer: anana5 <anana5@post.cz>

pkgname=pgadmin4-nwjs
pkgver=5.4
pkgrel=1
pkgdesc="Comprehensive design and management interface for PostgreSQL"
arch=('x86_64')
url="https://www.pgadmin.org/"
license=('custom')
depends=('python' 'postgresql-libs' 'hicolor-icon-theme')
makedepends=('python-pip' 'yarn')
provides=('pgadmin4=5.3')
conflicts=('pgadmin4')
source=("$pkgname-$pkgver.tar.gz::https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v$pkgver/source/pgadmin4-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v$pkgver/source/pgadmin4-$pkgver.tar.gz.asc"
		  "config_local.py"
		  "pgadmin4_desktop_entry.patch")
sha256sums=('374f9f9d2d27747fdbab054cadaea44af2a8c510863c2bcbb3c699d0fbd6bf4a'
            'SKIP'
            '2a19360c2eec2fa92f91d0fb6fe78dbe8c999beff6a1a73efa3cdbf1da1c4f23'
				'ab6d148d8ea5a6f6cf5d81836769be302f5c1776822105a8e8058be5c234f3d4')
validpgpkeys=('E8697E2EEF76C02D3A6332778881B2A8210976F2') # Package Manager (Package Signing Key) <packages@pgadmin.org>

prepare() {
	patch pgadmin4-$pkgver/pkg/linux/pgadmin4.desktop pgadmin4_desktop_entry.patch
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
	install -dm 644 "$pkgdir/opt/pgadmin4-$pkgver/"
	find web -type f -exec install -Dm 644 "{}" "$pkgdir/opt/pgadmin4-$pkgver/{}" \;
	find docs -type f -exec install -Dm 644 "{}" "$pkgdir/opt/pgadmin4-$pkgver/{}" \;
	find venv -type f,l -exec install -Dm 755 "{}" "$pkgdir/opt/pgadmin4-$pkgver/{}" \;
	install -dm 644 "$pkgdir/opt/pgadmin4-$pkgver/runtime"
	NW_VERSION=$(cd runtime && yarn info nw | grep latest | awk -F "'" '{ print $2}')
   pushd "${BUILDROOT}" > /dev/null
       wget https://dl.nwjs.io/v${NW_VERSION}/nwjs-v${NW_VERSION}-linux-x64.tar.gz
       tar -zxvf nwjs-v${NW_VERSION}-linux-x64.tar.gz
   popd > /dev/null
	cd "$PGADMIN4_SRC/nwjs-v${NW_VERSION}-linux-x64"
	find . -type f -exec install -Dm 755 "{}" "$pkgdir/opt/pgadmin4-$pkgver/runtime/{}" \;
	cd "$PGADMIN4_SRC/runtime"
	find assets -type f -exec install -Dm 644 "{}" "$pkgdir/opt/pgadmin4-$pkgver/runtime/{}" \;
	find node_modules -type f -exec install -Dm 644 "{}" "$pkgdir/opt/pgadmin4-$pkgver/runtime/{}" \;
	find src -type f -exec install -Dm 644 "{}" "$pkgdir/opt/pgadmin4-$pkgver/runtime/{}" \;
	install -Dm 644 "package.json" -t "$pkgdir/opt/pgadmin4-$pkgver/runtime"

	cd "$PGADMIN4_SRC/pkg/linux"
	install -Dm 644 "pgadmin4-128x128.png" -T "$pkgdir/usr/share/icons/hicolor/128x128/apps/pgadmin4.png"
	install -Dm 644 "pgadmin4-64x64.png" -T "$pkgdir/usr/share/icons/hicolor/64x64/apps/pgadmin4.png"
	install -Dm 644 "pgadmin4-48x48.png" -T "$pkgdir/usr/share/icons/hicolor/48x48/apps/pgadmin4.png"
	install -Dm 644 "pgadmin4-32x32.png" -T "$pkgdir/usr/share/icons/hicolor/32x32/apps/pgadmin4.png"
	install -Dm 644 "pgadmin4-16x16.png" -T "$pkgdir/usr/share/icons/hicolor/16x16/apps/pgadmin4.png"
	install -Dm 644 "pgadmin4.desktop" -t "$pkgdir/usr/share/applications"
}
