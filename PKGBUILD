# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Sebastien Binet <binet@lblbox>

# shellcheck disable=SC2034
_name=pip
pkgname="python2-${_name}"
pkgver=22.2.2
pkgrel=1
pkgdesc="The PyPA recommended tool for installing Python packages"
url="https://pip.pypa.io/"
arch=(any)
license=(MIT)
_deps=('appdirs'
       'cachecontrol'
       'colorama'
       'contextlib2'
       'distlib'
       'distro'
       'html5lib'
       'packaging'
       'pep517'
       'progress'
       'requests'
       'retrying'
       'resolvelib'
       'setuptools'
       'six'
       'toml'
       # add these until 
       # https://github.com/pypa/pip/issues/5354#issuecomment-672678167
       # is resolved
       'pyopenssl')
makedepends=("${_deps[@]/#/python-}"
              "${_deps[@]/#/python2-}"
              'python2-ipaddress'
              'python-sphinx'
              'python-sphinx-inline-tabs')
checkdepends=(
  git
  python-cryptography
  'python-pytest-runner'
  python-freezegun
  python-pytest
  python-scripttest
  'python-pretend'
  'python-yaml'
  'python-mock'
  python-pip
  python-tomli-w
  python-virtualenv
  python-werkzeug
  python-wheel
  python-csv23
  subversion)
source=("${_name}-${pkgver}.tar.gz::https://github.com/pypa/${_name}/archive/${pkgver}.tar.gz"
        resolvelib-0.5.5.patch)
sha512sums=('bd59e28b55475b77a8f11ea771cbad3b2602ff974e219f9a55288963a9522c9279a5b00fde40fb65cfebefae0e905d3da3c06fe50b402aa5326b25f70a98a015'
            'f339a20e965c583c1dc741d9fff90749aab049d591f0ac974e2187d4f41842661802b96266e8e35454b65d61d65c337a770d58b81119af07483fde0eda48001b')
b2sums=('2179b0d3f5f05bbd678f1785b4dbc0613078c09c83b45faa62d766182dfeb564095abda809ed99f45644abcb06c125efc528aeaed3ad40ab1c9e8972e33ccbb2')

shopt -s extglob
#prepare() {
#  cd pip-$pkgver

  # Backported from:
  # https://github.com/pypa/pip/commit/0d39ae9734d054c25e48e2da7ddb76545e5de330
#  patch -p1 -i ../resolvelib-0.5.5.patch

  # Remove certifi usage
#  sed -i 's|from pip._vendor.certifi import where|where = lambda: "/etc/ssl/certs/ca-certificates.crt"|' src/pip/_internal/commands/debug.py

#  rm -rf src/pip/_vendor/!(__init__.py)
#  sed -i -e 's/DEBUNDLED = False/DEBUNDLED = True/' \
#            src/pip/_vendor/__init__.py
#}

build() {
  cd "${_name}-${pkgver}"

  python2 -m build --wheel --no-isolation

  cd docs/
  PYTHONPATH="${srcdir}/${_name}-${pkgver}/src/" python pip_sphinxext.py
  PYTHONPATH="${srcdir}/${_name}-${pkgver}/src/" sphinx-build -W -b man -d build/doctrees/man man build/man -c html
  mkdir -p build/man-pip2
  cd build/man
  for manfile in *; do
    sed 's/pip/pip2/g;s/PIP/PIP2/g' $manfile > ../man-pip2/${manfile/pip/pip2}
  done
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local _deselected=(
    # deselect tests that would require python-pip in checkdepends (may or may not work due to devendored dependencies when python-pip is updated)
    --deselect tests/unit/test_direct_url_helpers.py::test_from_link_vcs_with_source_dir_obtains_commit_id
    --deselect tests/unit/test_direct_url_helpers.py::test_from_link_vcs_without_source_dir
    --deselect tests/unit/test_wheel_builder.py::test_should_cache_git_sha
  )

  cd "${srcdir}/${_name}-${pkgver}"
  # install to temporary location
  python2 -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv -m unit "${_deselected[@]}"
}

package_python-pip() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  depends=("${_deps[@]/#/python-}")

  cd "${_name}-${pkgver}"
  # python setup.py install --prefix=/usr --root="$pkgdir"
  python2 -m installer --destdir="$pkgdir" dist/*.whl

  install -D -m644 LICENSE.txt \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 -t "$pkgdir"/usr/share/man/man1 docs/build/man/*

  PYTHONPATH="$pkgdir"/usr/lib/python3.9/site-packages "$pkgdir"/usr/bin/pip completion --bash \
    | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/pip
  PYTHONPATH="$pkgdir"/usr/lib/python3.9/site-packages "$pkgdir"/usr/bin/pip completion --fish \
    | install -Dm644 /dev/stdin "$pkgdir"/usr/share/fish/vendor_completions.d/pip.fish
}

package_python2-pip() {
  depends=("${_deps[@]/#/python2-}" 'python2-ipaddress')
  conflicts=('python-pyinstall')
  replaces=('python-pyinstall')

  cd pip-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir"

  mv "$pkgdir/usr/bin/pip" "$pkgdir/usr/bin/pip2"
  sed -i "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" \
    "${pkgdir}"/usr/lib/python2.7/site-packages/pip/__init__.py
  python2 -m compileall "${pkgdir}"/usr/lib/python2.7/site-packages/pip/__init__.py

  install -D -m644 LICENSE.txt \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 -t "$pkgdir"/usr/share/man/man1 docs/build/man-pip2/*

  PYTHONPATH="$pkgdir"/usr/lib/python2.7/site-packages "$pkgdir"/usr/bin/pip2 completion --bash \
    | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/pip2
  PYTHONPATH="$pkgdir"/usr/lib/python2.7/site-packages "$pkgdir"/usr/bin/pip2 completion --fish \
    | install -Dm644 /dev/stdin "$pkgdir"/usr/share/fish/vendor_completions.d/pip2.fish
}
