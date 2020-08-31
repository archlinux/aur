# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='cecilia'
_reponame="${pkgname}5"
pkgver='5.4.1'
pkgrel='1'
pkgdesc='Audio signal processing environment aimed at sound designers'
arch=('any')
url="http://ajaxsoundstudio.com/software/$pkgname"
license=('GPL3')
depends=('python>=3.6.0' 'python-pyo' 'python-numpy>=1.18' 'python-wxpython')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/belangeo/$_reponame/archive/$pkgver.tar.gz")
sha256sums=('66063803e3f4935febabd975eca77b4dea17329ded939d72ab5bd5a53205b4fd')

package() {
	cd "$srcdir/$_reponame-$pkgver/"

	local _libdir="usr/lib/$pkgname"

	install -Dm644 "${_reponame^}.py" "$pkgdir/$_libdir/${_reponame^}.py"
	cp -r --no-preserve=ownership --preserve=mode 'Resources/' "$pkgdir/$_libdir/Resources/"

	install -dm755 "$pkgdir/usr/bin/"
	cat << EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
cd '/usr/lib/$pkgname/'
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
