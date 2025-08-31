# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=3x-ui
pkgver=2.6.7
_xrayver=25.8.29
pkgrel=1
pkgdesc="Xray panel supporting multi-protocol multi-user expire day & traffic & IP limit"
arch=(aarch64 armv7h i686 x86_64)
url="https://github.com/MHSanaei/$pkgname"
license=(GPL-3.0-only)
depends=(
  glibc
  sh
)
makedepends=(go)
optdepends=(
  'acme.sh: Certificate Management'
  'fail2ban: IP Limit Management'
  'openssh: SSH Port Forwarding Management'
  'speedtest-cli: Speedtest by Ookla'
  'ufw: Firewall Management'
)
options=(!debug)
install=$pkgname.install
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
source_aarch64=(https://github.com/XTLS/Xray-core/releases/download/v${_xrayver}/Xray-linux-arm64-v8a.zip)
source_armv7h=(https://github.com/XTLS/Xray-core/releases/download/v${_xrayver}/Xray-linux-arm32-v7a.zip)
source_i686=(https://github.com/XTLS/Xray-core/releases/download/v${_xrayver}/Xray-linux-32.zip)
source_x86_64=(https://github.com/XTLS/Xray-core/releases/download/v${_xrayver}/Xray-linux-64.zip)
sha256sums=('204209ab672a4262b1919aeaf885ad217e901d6a9d4043c0fe6dfe0ded5c46f6')
sha256sums_aarch64=('94374589c7208e4531022e406cdaefc1c875697c458f558a1bfbc34235ea6ba9')
sha256sums_armv7h=('6460457e2dac9f0373c871c8b8e089815fb0e3f9508a52d52816e585b7b735e4')
sha256sums_i686=('24bc8aab5427793556cbcb626f40102e48d69cb71936972944d6869e4ccf1256')
sha256sums_x86_64=('19cb6e45f5974032c81880423b85a4a04dffdbdf6b26367f4330b28e620a020a')
b2sums=('12681726fc442f958eafd859a8e40798211ff0faed39dc0debe362c1f486ab487755c77136bc111bca1aa52fd5ad8e78c1f2a42112c165391a741df3ff96b4ad')
b2sums_aarch64=('36161430b7291fc402413f831f3eb33b5609af92e78451ebb9774339e2f74651e3d61d52d13180c56a93a8770eb97fbd7099d4e68d83dae2b8d4a94b9c88fbc2')
b2sums_armv7h=('75ea1373cb510858912cfea89eda790d49a5df90fb3e5aa73d9aebe98e397c7c11862a978c57e225ef1d07ae8436c2adff76cadca5763fa4b091481f85a9cda8')
b2sums_i686=('b40144e8d695fc61d0fbe415c6c723e3a70d45f2e0c87ccd227c1e37af75ab61daca1892dd730ec35548909a5b09e699a1377a2b014bed1ef551edab6d636a5a')
b2sums_x86_64=('fac02ce3846b97e39cb651c393bd33513f5526eb571546fc411a7f3b2730319fce5b3deffac7d9480671e1e1caee8ec3deb47a2a38df89ea81b2689c5eef5b2e')

build() {
  cd $pkgname-$pkgver
  export GOPATH="$srcdir"
  export CGO_CPPFLAGS=$CPPFLAGS
  export CGO_CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE"
  export CGO_CXXFLAGS=$CXXFLAGS
  export CGO_LDFLAGS=$LDFLAGS
  export CGO_ENABLED=1
  export GOCACHE="$srcdir"/go-build
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/${pkgname:1} main.go
}

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|/etc/systemd/system/|/usr/lib/systemd/system/|g'                      ${pkgname:1}.sh
  sed -i 's|/usr/local/x-ui/bin|/usr/share/x-ui/bin|g'                            ${pkgname:1}.sh
  sed -i -E 's|wget -O ([^ ]+) ?-?N? (https?://[^ ]+)|curl -L -o \1 \2|g'         ${pkgname:1}.sh
  sed -i -E 's|wget -N (https?://[^ ]+/([^/ ]+))|curl -L -o \2 \1|g'              ${pkgname:1}.sh
  sed -i 's|/usr/local/|/usr/lib/|g'                                              ${pkgname:1}.sh
  sed -i 's|WorkingDirectory=/usr/local/x-ui/|WorkingDirectory=/usr/share/x-ui/|' ${pkgname:1}.service
  sed -i 's|ExecStart=/usr/local/x-ui/x-ui|ExecStart=/usr/lib/x-ui/x-ui|'         ${pkgname:1}.service
}

package() {
  cd $pkgname-$pkgver
  install -vDm 755 ${pkgname:1}.sh           "$pkgdir"/usr/bin/${pkgname:1}
  install -vDm 755 build/${pkgname:1}     -t "$pkgdir"/usr/lib/${pkgname:1}/
  install -vDm 644 ${pkgname:1}.service   -t "$pkgdir"/usr/lib/systemd/system/
  case ${CARCH} in
    aarch64) _xrayarch="arm64";;
    armv7h)  _xrayarch="arm32";;
    i686)    _xrayarch="i386";;
    x86_64)  _xrayarch="amd64";;
  esac
  install -vDm 755 ../xray                    "$pkgdir"/usr/bin/xray-${pkgname}-${_xrayver}
  install -vd                                 "$pkgdir"/usr/share/${pkgname:1}/bin
  ln -sf /usr/bin/xray-${pkgname}-${_xrayver} "$pkgdir"/usr/share/${pkgname:1}/bin/xray-linux-${_xrayarch}
}
