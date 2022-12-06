# Maintainer: Grey Christoforo <grey@christoforo.net>
pkgname=redis-timeseries
_commit_hash=26a2e426ba7b1fa80e9709d73e28d4a067f39900  # v1.8.3 tag
pkgver=1.8.3
pkgrel=1
pkgdesc="Time Series data structure for Redis"
arch=(x86_64)
url="https://redis.io/docs/stack/timeseries/"
license=('custom:RSALv2' 'custom:SSPLv1')
depends=(
redis
)
makedepends=(
git
lcov
)

source=(
git+https://github.com/RedisTimeSeries/RedisTimeSeries.git#commit=${_commit_hash}
git+https://github.com/RedisLabsModules/readies.git
git+https://github.com/lemire/fast_double_parser.git
git+https://github.com/google/cpu_features.git
git+https://github.com/RedisLabsModules/RedisModulesSDK.git
git+https://github.com/RedisGears/LibMR.git
git+https://github.com/redis/hiredis.git
git+https://github.com/libevent/libevent.git
no_submodule_init.patch
)

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'db2839d9b4c67a40d35af1afb9e9e9058a932469f38e8a048667879e0c107dbf')

pkgver() {
  cd RedisTimeSeries
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd RedisTimeSeries

  git submodule init
  _sm=readies
  git config submodule.deps/${_sm}.url "${srcdir}/${_sm}"
  _sm=fast_double_parser
  git config submodule.deps/${_sm}.url "${srcdir}/${_sm}"
  _sm=cpu_features
  git config submodule.deps/${_sm}.url "${srcdir}/${_sm}"
  _sm=RedisModulesSDK
  git config submodule.deps/${_sm}.url "${srcdir}/${_sm}"
  _sm=LibMR
  git config submodule.deps/${_sm}.url "${srcdir}/${_sm}"
  #git -c protocol.file.allow=always submodule update
  git submodule--helper update -q  # use the submodule commit hashes specified
  pushd deps/LibMR
  _sm=hiredis
  git config submodule.deps/${_sm}.url "${srcdir}/${_sm}"
  _sm=libevent
  git config submodule.deps/${_sm}.url "${srcdir}/${_sm}"
  #git -c protocol.file.allow=always submodule update
  git submodule--helper update -q  # use the submodule commit hashes specified
  popd

  # don't let the build script fetch
  cat ../no_submodule_init.patch | patch -p1  
}

build() {
  cd RedisTimeSeries

  #./configure --prefix=/usr
  make build
}

package() {
  cd RedisTimeSeries
  install -D bin/linux-x64-release/redistimeseries.so --target-directory ${pkgdir}/usr/lib/redis
  install -Dm644 licenses/* --target-directory ${pkgdir}/usr/share/licenses/${pkgname}
}
