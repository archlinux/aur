# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

_pkgname=comfy-cli
_pipname=${_pkgname//-/_}
pkgname="python-${_pkgname}"
pkgver=1.19.0
pkgrel=1
pkgdesc="Command Line Interface for Managing ComfyUI"
arch=('any')
url='https://github.com/Comfy-Org/comfy-cli'
license=('GPL-3.0-only')
depends=(python-httpx python-requests
	python-cookiecutter
	python-charset-normalizer
	python-gitpython
	python-mixpanel
	python-pathspec
	python-psutil
	python-pyyaml
	python-posthog
	python-rich
	python-semver
	python-questionary
	python-tomlkit
	python-typer
	python-websocket-client
)
makedepends=('python-build'
	'python-installer'
	'uv'
)
optdepends=('aria2: aria2 RPC download backend'
'git-lfs'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('ba9de37c06b11d8766c68feddd5a02feeb90dcd2b9eb14adb70e8088a12532d6')

prepare() {
    sed -i -e '/"typing-extensions/d' -e '/"ruff",/d' \
	${_pipname}-${pkgver}/pyproject.toml
}

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
