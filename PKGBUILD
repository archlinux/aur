# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
pkgname=python-aredis
pkgver=1.1.8
pkgrel=1
epoch=
pkgdesc="Redis client for Python asyncio (has support for redis server, sentinel and cluster)"
arch=(x86_64)
url="https://github.com/NoneGG/aredis"
license=('custom')
groups=()
depends=('python')
makedepends=('python-setuptools')
checkdepends=(
'python-pytest'
'python-pytest-asyncio'
'python-mock'
'redis'
'redis-create-cluster'
'python-contextvars'
)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
"test_redis_client.conf"
"config.sh")
noextract=()
md5sums=('1ff3630906f395ddfef12b9dbf2b850e'
         '1a8e476f369a657b1c41e56f8d3e8c5d'
         '92fa2184a98d197b06996a91b543e3ee')
validpgpkeys=()

prepare() {
	cd "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver"
	local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
	redis-server ../test_redis_client.conf &
	local _redis_pid=$!
	echo Waiting 5s for redis-server to start...
	sleep 5
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" pytest tests/client/
	kill $_redis_pid

	(cd ..; create-cluster start)
	(cd ..; echo yes | create-cluster create)
	echo Waiting 10s for the cluster to start...
	sleep 10
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" pytest tests/cluster/
	(cd ..; create-cluster stop)
	(cd ..; create-cluster clean)
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	mkdir -p $pkgdir/usr/share/licenses/${pkgname}/
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/
}
