# Maintainer: Grey Christoforo <grey@christoforo.net>
pkgname=redis-timeseries
_commit_hash=26a2e426ba7b1fa80e9709d73e28d4a067f39900  # v1.8.3 tag
pkgver=1.8.3
pkgrel=2
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
python
cmake
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
readies.patch
)

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '2fd78c5f453aa30aa9df71bf8c34ad5add7368086b50cfbfafa1adec1e2659a4'
            'fb3fed48d6db9510f8830bd87bb30678c9061054e1aa7c5e8bbc480e13858d3a')

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

  # prevent auto submodule fetch
  cat ../no_submodule_init.patch | patch -p1
  cat ../readies.patch | patch -p1
}

build() {
  cd RedisTimeSeries
  make build
}

package() {
  cd RedisTimeSeries
  install -D bin/linux-x64-release/redistimeseries.so --target-directory ${pkgdir}/usr/lib/redis
  install -Dm644 licenses/* --target-directory ${pkgdir}/usr/share/licenses/${pkgname}
}
