# Maintainer: Alexis Rossfelder <rossfelderalexis@gmail.com>
pkgname=label-studio
pkgver=1.23.2
pkgrel=1
pkgdesc="Multi-type data labeling and annotation tool (installed from PyPI into a private virtual environment)"
arch=('any')
url="https://github.com/HumanSignal/label-studio"
license=('Apache-2.0')
depends=()
makedepends=('uv')
options=('!strip')

source=("label_studio-${pkgver}-py3-none-any.whl::https://files.pythonhosted.org/packages/a6/05/0056b02f03b6a7616e460096bb3a08a0e1170bedcee7cdacb63ae5191cf8/label_studio-${pkgver}-py3-none-any.whl")
sha256sums=('c575b2552d0b271554224c5e56ab2ce9449c6e62a0b4851bc8c706d8fe651137')
noextract=("label_studio-${pkgver}-py3-none-any.whl")

package() {
	local root="/opt/$pkgname"
	local venv="$root/venv"

	# Self-contained virtual environment so nothing touches the system
	# site-packages. Dependencies are resolved from PyPI by uv.
	# Python 3.14 has no wheels for label-studio's pinned dependencies (numpy
	# etc.), so use a uv-managed Python 3.12 that ships inside the package.
	export UV_PYTHON_INSTALL_DIR="$pkgdir$root/python"
	export UV_PYTHON_PREFERENCE=only-managed
	uv python install 3.12
	uv venv --python 3.12 "$pkgdir$venv"
	uv pip install --python "$pkgdir$venv/bin/python" --no-cache --no-compile-bytecode \
		"$srcdir/label_studio-${pkgver}-py3-none-any.whl"

	# The venv is not relocatable: strip the staging dir from scripts, config
	# and symlinks.
	find "$pkgdir$root" -type l | while read -r link; do
		target=$(readlink "$link")
		if [[ $target == "$pkgdir"* ]]; then
			ln -sfn "${target#"$pkgdir"}" "$link"
		fi
	done
	grep -rIl --null -e "$pkgdir" "$pkgdir$root" \
		| xargs -0 -r sed -i "s|$pkgdir||g"

	install -d "$pkgdir/usr/bin"
	ln -s "$venv/bin/label-studio" "$pkgdir/usr/bin/label-studio"
}
