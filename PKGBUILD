# Maintainer: getzze <getzze [at] @gmail [dot] com>
# Maintainer: Maziar Saleh Ziabari <helasraizam@gmail.com>
# Contributor: Philipp A. <flying-sheep@web.de>

pkgname=jupyter_contrib_nbextensions
pkgver=0.7.0
pkgrel=1
pkgdesc='A collection of Jupyter nbextensions'
arch=(any)
url="https://github.com/ipython-contrib/$pkgname"
license=(BSD)
replaces=(jupyter-nbextensions-git jupyter-nbextensions)
conflicts=(jupyter-nbextensions python-jupyter-nbextensions)
depends=(
	python
	python-lxml
	python-yaml
	python-psutil
	jupyter-notebook
	jupyter-nbconvert
	jupyter_contrib_core
	jupyter_nbextensions_configurator
	jupyter_highlight_selected_word
)
makedepends=(python-pip mariadb jq)
_file="$pkgname-$pkgver.tar.gz"
source=("$_file::https://pypi.io/packages/source/${pkgname::1}/$pkgname/$_file"
	"$pkgname.install")
sha256sums=('06e33f005885eb92f89cbe82711e921278201298d08ab0d886d1ba09e8c3e9ca'
            'd141d36609422748b0b22b6c432f223bfc92d72359bbccaf709690f7de313e35')
install="$pkgname.install"

package() {
    local _python3="$(readlink /usr/bin/python3)"
    local _site_packages="${pkgdi}r/usr/lib/$_python3/site-packages"

    msg2 'installing python package'
    pip install \
	--compile --no-deps \
	--ignore-installed --no-warn-script-location \
	--root="$pkgdir" "$_file"

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

    # clean pycache
    find ${pkgdir} -regex '^.*\(__pycache__\|\.py[co]\)$' -delete
}
