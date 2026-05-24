# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-prebuilt
pkgname=python-$_name
pkgver=1.1.0
pkgrel=1
pkgdesc="Library with high-level APIs for creating and executing LangGraph agents and tools."
arch=('any')
_repo='https://github.com/langchain-ai/langgraph'
url="$_repo/tree/main/libs/prebuilt"
license=('MIT')
depends=('python' 'python-langgraph-checkpoint' 'python-langchain-core')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-langgraph-sdk' 'python-xxhash' 'python-pydantic' 'python-langgraph-checkpoint-sqlite' 'python-langgraph-checkpoint-postgres' 'python-syrupy' 'python-psycopg' 'valkey' 'postgresql')
source=("$_repo/archive/refs/tags/${_name//langgraph-/}==$pkgver.tar.gz")
sha256sums=('5f5ece963a2ca716b6f454790780e94e148f0292de3ebfd424331886e59c1210')

build() {
  cd "$srcdir"/$_name-$pkgver/libs/${_name//langgraph-/}
  python -m build --wheel --no-isolation
}

check() {
  local PGDATA=$(mktemp -d)
  local pwfile=$(mktemp)
  echo "postgres" > "$pwfile"
  initdb -D "$PGDATA" \
    --username=postgres \
    --pwfile="$pwfile" \
    --auth=md5 \
    --no-instructions
  rm -f "$pwfile"
  sed -i "s/#port = 5432/port = 5442/" "$PGDATA"/postgresql.conf
  sed -i "s|#unix_socket_directories = '/run/postgresql'|unix_socket_directories = '$PGDATA'|" "$PGDATA"/postgresql.conf
  pg_ctl -D "$PGDATA" -l "$PGDATA"/pg.log start
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name-$pkgver/libs/${_name//langgraph-/}
  trap 'pkill redis-server' EXIT
  (redis-server --maxmemory 256mb --maxmemory-policy allkeys-lru)&
  LANGGRAPH_TEST_FAST=0 PYTHONPATH=$PWD:$PWD/../${_name//-prebuilt/} pytest "${pytest_options[@]}" tests
  pg_ctl -D "$PGDATA" stop -m fast
  rm -rf "$PGDATA"
}

package() {
  cd "$srcdir"/$_name-$pkgver/libs/${_name//langgraph-/}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
