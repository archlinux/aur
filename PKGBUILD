# Maintainer: Ido Rosen <ido@kernel.org>

pkgname=llm-git
provides=(llm)
conflicts=(llm llm-bin python-llm)
pkgver=0.28.r980.6b84a0d
pkgrel=1
pkgdesc='A CLI tool and Python library for interfacing with popular large language models.'
arch=(any)
url='https://github.com/simonw/llm'
license=(Apache-2.0)
depends=(python
         python-numpy
         python-click
         python-condense-json
         python-openai
         python-click-default-group
         sqlite-utils
         python-sqlite-migrate
         python-pydantic
         python-pyyaml
         python-pluggy
         python-ulid
         python-puremagic
         python-httpx)
makedepends=(python-build
             python-setuptools
             python-installer
             python-wheel)
#checkdepends=(python-pytest
#              python-pytest-httpx
#              python-pytest-asyncio
#              python-cogapp
#              mypy python-pytest-mypy
#              python-black
#              python-pytest-recording
#              python-ruff
#              python-pytest-ruff
#              python-syrupy
#              ...)
#optdepends=('xyz: for xyz')
source=(git+https://github.com/simonw/llm)
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%%-git}
    GITVER="$(git describe --long --tags | sed 's/^\([^-]*\)-.*$/\1/')"
    printf "%s.r%s.%s" \
        "${GITVER##v}" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

#check() {
#    cd $pkgname-$pkgver
#    pytest -v
#}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
