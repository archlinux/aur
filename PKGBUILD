# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='cecilia'
pkgname="$_pkgname-git"
_reponame="${_pkgname}5"
pkgver='5.4.0.r2.gf8d35ad'
pkgrel='3'
pkgdesc='Audio signal processing environment aimed at sound designers - git version'
arch=('any')
url="http://ajaxsoundstudio.com/software/$_pkgname"
license=('GPL3')
depends=('python' 'python-pyo>=1.0.1' 'python-numpy>=1.18' 'python-wxpython>=4.0.7')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/belangeo/$_reponame")
sha256sums=('SKIP')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	local _libdir="usr/lib/$_pkgname"

	install -Dm644 "${_reponame^}.py" "$pkgdir/$_libdir/${_reponame^}.py"
	cp -r --no-preserve=ownership --preserve=mode 'Resources/' "$pkgdir/$_libdir/Resources/"

	install -dm755 "$pkgdir/usr/bin/"
	cat << EOF > "$pkgdir/usr/bin/$_pkgname"
#!/bin/sh
cd '/usr/lib/$_pkgname'
exec python '${_reponame^}.py' "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/$_pkgname"

	install -dm755 "$pkgdir/usr/share/applications/"
	cat << EOF > "$pkgdir/usr/share/applications/$_pkgname.desktop"
[Desktop Entry]
Type=Application
Name=${_pkgname^}
Comment=Audio signal processing environment aimed at sound designers
Icon=$_pkgname
Exec=/usr/bin/$_pkgname
Terminal=false
Categories=AudioVideo;Audio;
EOF

	install -dm755 "$pkgdir/usr/share/pixmaps/"
	ln -sf "/$_libdir/Resources/${_reponame^}.ico" "$pkgdir/usr/share/pixmaps/$_pkgname.ico"
}
