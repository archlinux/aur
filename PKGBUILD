# Maintainer:  Alexander Bocken <alexander@bocken.org>

_name=solara
pkgname=python-${_name,,}
pkgver=1.55.0
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
        "https://files.pythonhosted.org/packages/py3/${_server_name::1}/$_server_name/${_server_whl}"
	"https://files.pythonhosted.org/packages/py3/${_ui_name::1}/$_ui_name/${_ui_whl}")
sha256sums=(c5c4b564a9498672cee2fe82d02ee7dbe154e287ed9d50f776d63c963611c44c
            793a84ba027bed334b42415718c5663db88fbfc76ff096b0cd7a2f6d78365664
            d298290440ace8bd7dc0ed0d0275c303c8ac07b2b3f9e0ad2738480798ddc09c)


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
