#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=llama-cpp-python
pkgname=python-llama-cpp
pkgver=0.1.83
pkgrel=1
pkgdesc="Python bindings for llama.cpp"
# llama.so provided by llama-cpp
arch=(any)
url=https://github.com/abetlen/llama-cpp-python
depends=(python-typing-extensions python-numpy python-diskcache llama-cpp)
optdepends=(python-uvicorn python-fastapi python-pydantic-settings python-sse-starlette)
makedepends=(python-scikit-build)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('9f40656e46a85a3c3427790246e03490bb90202c37cb99732a095ffcb99efe54')

package() {
	cd "${_pkgname//-/_}-$pkgver" || return 1
	# https://github.com/abetlen/llama-cpp-python/pull/486
	# CMAKE_ARGS='-DDRY_RUN=ON'
	python setup.py install --root="$pkgdir" --optimize=1
	find $pkgdir -name '*.so' -exec ln -sf ../../../libllama.so {} \;
}
