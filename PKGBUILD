# Maintainer: Davide Depau <davide@depau.eu>
# Contributor: Ryan Thomas <ryant0000@gmail.com>

pkgname='xmrig-donateless-git'
pkgver=3.2.0.r1380.919a6c0c
pkgrel=1
pkgdesc='High Perf CryptoNote CPU Miner-No Donate Version'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/xmrig/xmrig"
provides=('xmrig-donateless' 'xmrig')
depends=('libuv' 'libmicrohttpd' 'openssl' 'hwloc')
optdepends=('monero: wallet')
makedepends=('cmake')
conflicts=('xmrig-bin' 'xmrig' 'xmrig-donateless')
license=('GPL')
backup=("etc/xmrig/xmrig.conf")
source=("xmrig.service"
	"xmrig.sysusers"
	"$pkgname::git+${url}.git")
sha256sums=('1c4fa2898b1252507e885c4bfa2d8d5b20bce2069cb5f703bb084066d560a770'
            'd8f499302fb2b642fe02586c81c410a299e0a6e133aef1cc1c783bcdcb3f44f6'
            'SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.r%s.%s" "$(cat src/version.h | grep APP_VERSION | awk '{ print $3 }' | sed 's/"//g')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$pkgname"
  mkdir -p build
  cd src
  sed -i 's/DonateLevel = .;/DonateLevel = 0;/g' donate.h
}

build() {
  cd "$pkgname/build"
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$pkgname"
  install -Dm775 "build/xmrig" "${pkgdir}/usr/bin/xmrig"
  install -Dm644 "src/config.json" "${pkgdir}/etc/xmrig/xmrig.conf"
  install -Dm644 "${srcdir}/xmrig.service" "${pkgdir}/usr/lib/systemd/system/xmrig@.service"
  install -Dm0644 "${srcdir}/xmrig.sysusers" "${pkgdir}/usr/lib/sysusers.d/xmrig.conf"
}


