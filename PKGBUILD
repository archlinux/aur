# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=jupyter_contrib_nbextensions
pkgver=0.3.3
pkgrel=1
pkgdesc='A collection of Jupyter nbextensions'
arch=(any)
url="https://github.com/ipython-contrib/$pkgname"
license=(BSD)
replaces=(jupyter-nbextensions-git jupyter-nbextensions)
conflicts=(jupyter-nbextensions python-jupyter-nbextensions)
depends=(python python-lxml jupyter jupyter-notebook jupyter-nbconvert jupyter_contrib_core 'jupyter_nbextensions_configurator>=0.2.4' 'jupyter_highlight_selected_word>=0.0.10' 'jupyter_latex_envs>=1.3.8' python-yaml python-psutil)
makedepends=(python-pip mariadb jq)
_wheel="$pkgname-$pkgver-py2.py3-none-any.whl"
source=("$_wheel::https://files.pythonhosted.org/packages/py2.py3/${pkgname::1}/$pkgname/$_wheel" "$pkgname.install")
md5sums=('61f0e563c8818127aa5c1162ff0252fd'
         '4f2c350b8d9881d3af41d04b2cabcc4d')
noextract=("$_wheel")
install="$pkgname.install"

package() {
	local _python3="$(readlink /usr/bin/python3)"
	local _site_packages="$pkgdir/usr/lib/$_python3/site-packages"
	
	msg2 'installing python package'
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
	
	msg2 'installing extensions'
	#--user uses JUPYTER_CONFIG_DIR
	env \
		PATH="$pkgdir/usr/bin:$PATH" \
		PYTHONPATH="$_site_packages:$PYTHONPATH" \
		JUPYTER_DATA_DIR="$pkgdir/usr/share/jupyter" \
		JUPYTER_CONFIG_DIR="$pkgdir/etc/jupyter" \
		jupyter contrib nbextension install --user
	
	#--fixed-strings --recursive --files-with-matches
	for file in $(grep -Frl "$pkgdir" "$pkgdir/etc"); do
		replace "$pkgdir/" '' -- $file
	done
	
	rm "$pkgdir/etc/jupyter/jupyter_notebook_config.json"
}
