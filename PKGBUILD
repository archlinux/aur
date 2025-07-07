# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-prebuilt
pkgname=python-${_name}
pkgver=0.5.2
pkgrel=1
pkgdesc="Library with high-level APIs for creating and executing LangGraph agents and tools."
arch=('any')
license=('MIT')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/prebuilt"
depends=('python' 'python-langgraph-checkpoint' 'python-langchain-core')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
_langgraph_depends=('python-langgraph-sdk' 'python-xxhash' 'python-pydantic')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-pytest-watcher' 'python-dataclasses-json' 'python-langgraph-checkpoint-sqlite' 'python-langgraph-checkpoint-postgres' 'python-syrupy' ${_langgraph_depends[@]})
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz"
        "https://files.pythonhosted.org/packages/py3/l/langgraph/langgraph-0.5.1-py3-none-any.whl") # Prevent cercular dependencies
sha256sums=('2c900a5be0d6a93ea2521e0d931697cad2b646f1fcda7aa5c39d8d7539772465'
            '707f0cc0d2713011fff4578bf57de8226cd96bcc0679868be2f41eb0984bb5af')
noextract=('langgraph-0.5.1-py3-none-any.whl')

prepare(){
  # Fix tests
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  sed -i '94i\        "thread_id": "123",' tests/test_react_agent.py
  sed -i '121i\        "thread_id": "123",' tests/test_react_agent.py
}

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # Need running PostgreSQL server
    -k "not postgres"
  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer "${srcdir}"/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
