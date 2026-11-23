# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-md2zhihu
_name=${pkgname#python-}
pkgver=0.22
pkgrel=1
pkgdesc="convert markdown to zhihu compatible format"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/drmingdrmer/md2zhihu"
_pydeps=(
    mistune
    k3down2
    k3fs
    k3git
    k3handy
    k3proc
    typing_extensions
    urllib3
    yaml
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    python-pytest
    python-numpy
    python-scikit-image
    python-k3ut
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('9f1a728e5aec966870ce6d07a07e08e67fd5fbd89c78002b06825c3aec527bbd')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}"
	
    # The repo root (${srcdir}/${_name}) contains the real md2zhihu/ package;
    # ${srcdir} itself only has the repo dir and makes `import md2zhihu` bind
    # to an empty namespace package in child processes spawned by the tests.
    export PYTHONPATH="${srcdir}/${_name}${PYTHONPATH:+:${PYTHONPATH}}"
	# Some tests invoke the installed `md2zhihu` console script. check() runs
	# before installation, so provide a minimal launcher on PATH wrapping the
	# source tree's md2zhihu.main (the wheel installs the same entry point).
	install -dm755 "${srcdir}/.check-bin"
	cat > "${srcdir}/.check-bin/md2zhihu" <<'SH'
#!/bin/sh
exec python -c 'import sys; from md2zhihu import main; sys.exit(main())' "$@"
SH
	chmod +x "${srcdir}/.check-bin/md2zhihu"
	export PATH="${srcdir}/.check-bin:${PATH}"

	pytest -x
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
