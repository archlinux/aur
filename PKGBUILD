# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph
pkgname=python-$_name
pkgver=1.2.3
pkgrel=1
pkgdesc="Building stateful, multi-actor applications with LLMs."
arch=('any')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/langgraph"
license=('MIT')
depends=('python' 'python-langchain-core' 'python-langgraph-checkpoint' 'python-langgraph-sdk' 'python-langgraph-prebuilt' 'python-xxhash' 'python-pydantic')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-syrupy' 'python-httpx' 'python-pytest-xdist' 'python-psutil' 'python-langgraph-checkpoint-sqlite' 'python-langgraph-checkpoint-postgres' 'python-psycopg' 'python-pycryptodome' 'python-redis' 'valkey' 'postgresql')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7f89cd5f0946fe29bd7ca048e2a84d3c14e7f652e38bb98e00f0ba8b7004b9d0')

build() {
  cd "$srcdir"/$_name-$pkgver
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
    -n auto
    --dist worksteal
  )
  cd "$srcdir"/$_name-$pkgver
  trap 'pkill redis-server' EXIT
  (redis-server --maxmemory 256mb --maxmemory-policy allkeys-lru)&
  NO_DOCKER=false PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
  pg_ctl -D "$PGDATA" stop -m fast
  rm -rf "$PGDATA"
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
