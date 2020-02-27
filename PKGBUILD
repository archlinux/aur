# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='cecilia'
_reponame="${pkgname}5"
pkgver='5.4.0'
pkgrel='3'
pkgdesc='Audio signal processing environment aimed at sound designers'
arch=('any')
url="http://ajaxsoundstudio.com/software/$pkgname"
license=('GPL3')
depends=('python' 'python-pyo>=1.0.1' 'python-numpy>=1.18' 'python-wxpython>=4.0.7')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/belangeo/$_reponame/archive/$pkgver.tar.gz")
sha256sums=('00c43539da73af982b136ab5ea6809ac9bb74188b05eb40d13428d13fe2ebef0')

package() {
	cd "$srcdir/$_reponame-$pkgver/"

	local _libdir="usr/lib/$pkgname"

	install -Dm644 "${_reponame^}.py" "$pkgdir/$_libdir/${_reponame^}.py"
	cp -r --no-preserve=ownership --preserve=mode 'Resources/' "$pkgdir/$_libdir/Resources/"

	install -dm755 "$pkgdir/usr/bin/"
	cat << EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
cd '/usr/lib/$pkgname'
exec python '${_reponame^}.py' "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/$pkgname"

	install -dm755 "$pkgdir/usr/share/applications/"
	cat << EOF > "$pkgdir/usr/share/applications/$pkgname.desktop"
[Desktop Entry]
Type=Application
Name=${pkgname^}
Comment=Audio signal processing environment aimed at sound designers
Icon=$pkgname
Exec=/usr/bin/$pkgname
Terminal=false
Categories=AudioVideo;Audio;
EOF

	install -dm755 "$pkgdir/usr/share/pixmaps/"
	ln -sf "/$_libdir/Resources/${_reponame^}.ico" "$pkgdir/usr/share/pixmaps/$pkgname.ico"
}
