# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Phil Schaf <flying-sheep(at)web.de>
# Contributor : Axel Navarro <navarroaxel at gmail>

#####################################################################################################
## NOTE: Removing python2 as mandatory makedep; if you want to have a precomiled Python 2 debugger ##
##      packaged, make sure that `python2-setuptools` is installed _before_ building this package. ##
#####################################################################################################


pkgname=pycharm-community-eap
pkgver=231.8770.15
_pkgver=2023.1.1
_eap=y
pkgrel=1

epoch=14
pkgdesc='Powerful Python and Django IDE, Early Access Program (EAP) build, Community Edition'
arch=('i686' 'x86_64')
url=http://www.jetbrains.com/pycharm
license=('Apache')

provides=('pycharm-community-edition')
conflicts=('pycharm-community-edition')

makedepends=('cython' 'python-setuptools')  # 'python2-setuptools'
depends=('python' 'glib2' 'dbus' 'libdbusmenu-glib')
optdepends=('python2: Support for Python 2 language'
			'ipython: Alternative Python shell')

options=('!strip')

_filever="$([ $_eap = y ] && echo -n $pkgver || echo -n $_pkgver)"
source=("https://download.jetbrains.com/python/pycharm-community-$_filever.tar.gz")
sha256sums=('bfdd836ec1408c1ee13ae64f41ff6ad33af506998d29e25e093f853e2f3de76e')


prepare() {
	if [ -d "pycharm-community-$_pkgver" ]; then
		mv pycharm-community-{"$_pkgver","$pkgver"}
	fi

	cd "pycharm-community-$pkgver/bin"
	local _vmoptfile
	for _vmoptfile in pycharm{,64}.vmoptfile; do
		echo $'-Dawt.useSystemAAFontSettings=on\n-Dswing.aatext=true' >>"$_vmoptfile"
	done
	if [ "$CARCH" = i686 ]; then
		rm fsnotifier64 libdbm64.so
	fi
}

do-not-build() {
	cd "pycharm-community-$pkgver/plugins/python-ce/helpers/pydev"

	# compile PyDev debugger used by PyCharm to speedup debugging
	find . \( -name *.c -o -name *.so -o -name *.pyd \) -delete
	sed -i '1s/^/# cython: language_level=3\n/' _pydevd_bundle/pydevd_cython.pxd

	# use absolute paths to the python executables so that users with an activated virtual env
	# (like e.g. anaconda) can build without issues
	/usr/bin/python setup_cython.py build_ext --inplace --force-cython
	if [ -z "$(pacman -T python2-setuptools)" ]; then
		# only compile the py2-debugger if `python2-setuptools’ is already installed
		/usr/bin/python2 setup_cython.py build_ext --inplace
	fi
	rm -rf build/
	find . -name __pycache__ -exec rm -rf {} \;
}

package() {
	install -dm755 "$pkgdir"/{opt,usr/{bin,share/pixmaps}}
	cp -R "pycharm-community-$pkgver" "$pkgdir/opt/$pkgname"

	local _vmoptfile=pycharm64
	if [[ "$CARCH" = i686 ]]; then
		rm -f "$pkgdir/opt/$pkgname/bin/libyjpagent-linux64.so"
		rm -f "$pkgdir/opt/$pkgname/bin/fsnotifier64"
		_vmoptfile=pycharm
	fi
	echo $'-Dawt.useSystemAAFontSettings=on\n-Dswing.aatext=true' >>"$pkgdir/opt/$pkgname/bin/$_vmoptfile.vmoptions"

	install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<-EOF
		[Desktop Entry]
		Version=1.0
		Type=Application
		Name=PyCharm Community EAP
		Exec=/opt/$pkgname/bin/pycharm.sh %f
		Icon=pycharm
		Comment=$pkgdesc
		Categories=Development;IDE;
		Terminal=false
		StartupNotify=true
		StartupWMClass=jetbrains-pycharm-ce
	EOF
	ln -sfv "/opt/$pkgname/bin/pycharm.png" "$pkgdir/usr/share/pixmaps/pycharm.png"

	install -Dm755 /dev/stdin "$pkgdir/usr/bin/pycharm-ce" <<-EOF
		#!/bin/sh
		exec "/opt/$pkgname/bin/pycharm.sh"
	EOF
}

# vim: ts=4 sw=4 noet ft=PKGBUILD:
