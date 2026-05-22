# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-checkpoint-postgres
pkgname=python-$_name
pkgver=3.1.0
pkgrel=1
pkgdesc="Library with a Postgres implementation of LangGraph checkpoint saver."
arch=('any')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/checkpoint-postgres"
license=('MIT')
depends=('python' 'python-langgraph-checkpoint' 'python-orjson' 'python-psycopg' 'python-psycopg-pool')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-anyio' 'python-pytest-asyncio' 'python-pytest-mock' 'postgresql' 'pgvector')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('02bff4ab63d9dae8eab3a9640fce1d479da8965c9fba7b0dc04cb1f7c56f0a55')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
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
  sed -i "s/#shared_preload_libraries = ''/shared_preload_libraries = 'vector'/" "$PGDATA"/postgresql.conf
  sed -i "s/#port = 5432/port = 5441/" "$PGDATA"/postgresql.conf
  sed -i "s|#unix_socket_directories = '/run/postgresql'|unix_socket_directories = '$PGDATA'|" "$PGDATA"/postgresql.conf
  pg_ctl -D "$PGDATA" -l "$PGDATA"/pg.log start
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
  pg_ctl -D "$PGDATA" stop -m fast
  rm -rf "$PGDATA"
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
