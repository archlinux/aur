# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=jupyter_contrib_nbextensions
pkgver=0.1.0
pkgrel=1
pkgdesc='A collection of Jupyter nbextensions'
arch=(any)
url="https://github.com/ipython-contrib/$pkgname"
license=(BSD)
replaces=(jupyter-nbextensions-git jupyter-nbextensions)
conflicts=(jupyter-nbextensions python-jupyter-nbextensions)
depends=(python jupyter jupyter-notebook jupyter-nbconvert jupyter_contrib_core jupyter_nbextensions_configurator python-yaml python-psutil)
makedepends=(python-pip)
_wheel="$pkgname-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${pkgname::1}/$pkgname/$_wheel"
        user-default.patch::"$url/commit/416df7776dbe3426ee83229c2a71f2783a73093f.patch")
md5sums=('f63f7add76a34ced5cf0b0dbb30f171a'
         'f81458a7304ba821831b65ee41395efd')
noextract=("$_wheel")

package() {
	local _python3="$(readlink /usr/bin/python3)"
	local _site_packages="$pkgdir/usr/lib/$_python3/site-packages"
	
	msg2 'installing python package'
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
	
	patch -d "$_site_packages" -i "$srcdir/user-default.patch" -p2
	
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
