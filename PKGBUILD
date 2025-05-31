# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=solara
pkgname=python-${_name,,}
pkgver=1.48.0
pkgrel=1
pkgdesc="A pure Python, React-style web framework"
arch=('any')
url="https://solara.dev"
license=(MIT)
depends=(
	 # solara
	 python
	 'python-click>=7.1.0'
	  python-filelock
	  python-ipykernel
	  python-jinja
	  python-jupyter-client
	  python-jupyter-core
	  python-jupyter-events
	  python-rich-click

	 # solara-ui
	  python-humanize
	 'python-ipyvue>=1.9.0'
	 'python-ipyvuetify>=1.6.10'
	 'python-ipywidgets>=7.7'
	 'python-reacton>=1.9'
	  python-requests

	 # solara-server
	 python-jupyter-client
	 jupyter-nbformat

	 # optionals, TODO: determine if these should be moved to optdepends
	  python-markdown
	  python-markupsafe
	  pymdown-extensions
	  python-starlette
	  uvicorn
	  python-watchdog
	  python-watchfiles
	  python-websockets
          python-cachetools
)
makedepends=('python-installer' 'python-wheel')

_whl="${_name//-/_}-$pkgver-py3-none-any.whl"
_ui_name=solara_ui
_ui_whl="${_ui_name//-/_}-$pkgver-py3-none-any.whl"
_server_name=solara-server
_server_whl="${_server_name//-/_}-$pkgver-py3-none-any.whl"

source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_whl}"
        "https://files.pythonhosted.org/packages/py3/${_ui_name::1}/$_ui_name/${_ui_whl}"
        "https://files.pythonhosted.org/packages/py3/${_server_name::1}/$_server_name/${_server_whl}")
sha256sums=(e0c0d69cb4032d8a3a1f842c6c57b560872efedb5089198f56775b790d0e8b6d
f9775b758070fa8fec44d947b3419f803752d594ff7116d7db63f080f41666f9
f648bd3b41c51a63402a62160b507010d406d855a2035c41f3e8c694796f6bd8)


noextract=("$_whl"
"$_ui_whl"
"$_server_whl")
package() {
    python -m installer --destdir="$pkgdir" "$_whl"
    # Move the license file to the correct location
    _py="$(python -c 'from sys import version_info as vi; print(f"python{vi.major}.{vi.minor}")')"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    mv "$pkgdir/usr/lib/${_py}/site-packages/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

    python -m installer --destdir="$pkgdir" "$_ui_whl"
    rm -rf "$pkgdir/usr/lib/${_py}/site-packages/prefix" # also provided by solara wheel, which installs to correct location

    python -m installer --destdir="$pkgdir" "$_server_whl"
    # remove duplicate license file (in incorrect location)
    rm "$pkgdir/usr/lib/${_py}/site-packages/LICENSE"
}
