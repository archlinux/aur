# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=jupyter_contrib_nbextensions
pkgver=0.2.4
pkgrel=1
pkgdesc='A collection of Jupyter nbextensions'
arch=(any)
url="https://github.com/ipython-contrib/$pkgname"
license=(BSD)
replaces=(jupyter-nbextensions-git jupyter-nbextensions)
conflicts=(jupyter-nbextensions python-jupyter-nbextensions)
depends=(python jupyter jupyter-notebook jupyter-nbconvert jupyter_contrib_core jupyter_nbextensions_configurator jupyter_highlight_selected_word jupyter_latex_envs python-yaml python-psutil)
makedepends=(python-pip)
_wheel="$pkgname-$pkgver-py2.py3-none-any.whl"
source=("$_wheel::https://files.pythonhosted.org/packages/py2.py3/${pkgname::1}/$pkgname/$_wheel")
md5sums=('e95ca3640fc386aac94dcdaccb2d8e64')
noextract=("$_wheel")

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
}
