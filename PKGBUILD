# Maintainer: Gene C <arch@sapience.com>
#
pkgname=python-pytricia-git
_pkgname=python-pytricia
_gitname=pytricia

_pkgver=
_base_vers='1.3.0'
pkgver=1.3.0.250915
pkgrel=1

provides=(python-pytricia)
conflicts=(python-pytricia)

pkgdesc='An efficient IP address storage and lookup module for Python (git)'
arch=('x86_64')
url='https://github.com/jsommers/pytricia.git'
license=('LGPL-3.0-or-later')

source=(
    git+https://github.com/jsommers/pytricia.git
    pyproject.toml 
    __init__.py
)

depends=(
  'glibc'
)
makedepends=(
  'git'
  'gcc'
  'python'
  'python-setuptools>=80.0'
  'python-wheel'
  'uv'
)
checkdepends=()

pkgver() {
    cd "${srcdir}/${_gitname}"
    dt=$(git log -1 --date=format:%y%m%d --format='%cd')
    printf "%s.%s" $_base_vers $dt
}

prepare() {
    cd "${srcdir}/${_gitname}"
    git clean -f
    git fetch
    git pull origin master

    cd ${srcdir}
    for i in patricia.c patricia.h pytricia.c; 
    do 
        ln -nsf pytricia/$i; 
    done
}

build() {
  cd "${srcdir}" # /${_gitname}

  echo "Building"
  /usr/bin/rm -rf dist/*
  /usr/bin/uv build --wheel
}

check() {
  cd "${srcdir}"
}

package() {
  cd "${srcdir}"

  sitedir=$(python -c "import site; print(site.getsitepackages()[0])")
  installdir="${pkgdir}${sitedir}/pytricia"

  echo "Installing"
  uv_opts=(
    --python /usr/bin/python
    --system
    --no-build-isolation
    --link-mode=copy
    --compile-bytecode
    )

  /usr/bin/uv pip install ${uv_opts[@]} --target "$installdir" dist/*.whl
  /usr/bin/rm -rf "$installdir"/.lock

  # module needs __init__.py
  /usr/bin/install -m 644 __init__.py  "$installdir"/

  # license
  # install -vDm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}

sha256sums=(
    SKIP
    '11dd3d9c8aa3e07c4f875636e395fec28c0b689687e29e1d4fdd0ad98984aa89'
    'aa39e800d359d5da745a6e59c17981e84e40cab4093193dca09e90d1e9a7c4c8'
)
