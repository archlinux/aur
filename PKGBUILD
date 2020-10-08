# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Phil Schaf <flying-sheep(at)web.de>

#####################################################################################################
 ## NOTE: Removing python2 as mandatory makedep; if you want to have a precomiled Python 2 debugger ##
  ##      packaged, make sure that `python2-setuptools` is installed _before_ building this package. ##
   #####################################################################################################


pkgname=pycharm-community-eap

_buildver=203.4449.8
_pkgver=2020.3
_eap=y
pkgver="$_pkgver.$_buildver"
pkgrel=1
epoch=7

pkgdesc='Powerful Python and Django IDE, Early Access Program (EAP) build, Community Edition'
arch=('i686' 'x86_64')
url=http://www.jetbrains.com/pycharm
license=('Apache')

provides=('pycharm-community-edition')
conflicts=('pycharm-community-edition')

makedepends=('python-setuptools')  # 'python2-setuptools'
depends=('python' 'glib2' 'libdbusmenu-glib')
optdepends=('python2: Support for Python 2 language'
			'ipython: Alternative Python shell'
			'ipython2: Alternative Python 2 shell')

options=('!strip')

_filever="$([ $_eap = y ] && echo -n $_buildver || echo -n $_pkgver)"
source=("https://download.jetbrains.com/python/pycharm-community-$_filever.tar.gz")
sha256sums=($(curl -s "https://download.jetbrains.com/python/pycharm-community-$_filever.tar.gz.sha256" | cut -d' ' -f1))


prepare() {
	if [ -d "pycharm-community-$_pkgver" ]; then
		mv pycharm-community-{"$_pkgver","$_buildver"}
	fi

	cd "pycharm-community-$_buildver/bin"
	local _vmoptfile
	for _vmoptfile in pycharm{,64}.vmoptfile; do
		echo $'-Dawt.useSystemAAFontSettings=on\n-Dswing.aatext=true' >>"$_vmoptfile"
	done
	if [ "$CARCH" = i686 ]; then
		rm fsnotifier64 libdbm64.so
	fi
}

build() {
	cd "pycharm-community-$_buildver/plugins/python-ce/helpers/pydev"

	# using absolute paths to the python executables so that users with an activated virtual env
	# (like e.g. anaconda) can build without issues
	/usr/bin/python3 ./setup_cython.py build_ext --inplace
	if [ -z "$(pacman -T python2-setuptools)" ]; then
		# only compile the py2-debugger if `python2-setuptools’ is already installed
		/usr/bin/python2 ./setup_cython.py build_ext --inplace
	fi
}

package() {
	install -dm755 "$pkgdir"/{opt,usr/{bin,share/pixmaps}}
	cp -R "pycharm-community-$_buildver" "$pkgdir/opt/$pkgname"

	install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<-EOF
		[Desktop Entry]
		Version="$pkgver"
		Type=Application
		Name=PyCharm Community EAP
		Exec="/opt/$pkgname/bin/pycharm.sh" %f
		Icon=pycharm
		Comment="$pkgdesc"
		Categories=Development;IDE;
		Terminal=false
		StartupNotify=true
		StartupWMClass=jetbrains-pycharm-ce
	EOF
	ln -s "/opt/$pkgname/bin/pycharm.sh" "$pkgdir/usr/bin/pycharm-ce"
	ln -s "/opt/$pkgname/bin/pycharm.png" "$pkgdir/usr/share/pixmaps/"
}


# vim: ts=4 sw=4 noet ft=PKGBUILD:
