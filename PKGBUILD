pkgname=ipfs-cluster
pkgver=1.1.5
pkgrel=1
pkgdesc="ipfs-cluster"
url="https://github.com/ipfs-cluster/ipfs-cluster"
arch=('x86_64' 'aarch64')
license=('MIT AND Apache-2.0')
makedepends=('go')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("https://github.com/ipfs-cluster/ipfs-cluster/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}-service.service")
b2sums=('480a664aa5930b302f3ed8983991d43340f479a3f16e363ac870b02d2e85d171c019117c1ceb6765ff80569c9c5c7b6702df07ab627b970bc838bb8a3e3c8a42'
        'fb71aadc34ebcc037fc3e9032a943046555b7bbb264f648b6bed7aefc6cbdefcf5145e6e34d44f94c63e98e9d5c6376d82d0b67bf396f4ee97ead6080a9a9e34'
        'ccd8f9a42ee80b114e66b95d1330decb9790a0f706f0b37eaa6d97e0ccc77f00a46c24f4fafa6a4949520bc4324c09426c368a68f8c6d2d978c905c3e57d9acb'
        'edc9db6d1dd8a4a52cd5161c8003a00c5e95acf56b9d1bdbd076926e40b516f9091fbaf1c281ed7b99deefa519ca78fc648c113391907fd5a2f75ad4693184b4')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  for p in ctl follow service; do
        go build -o $srcdir/ipfs-cluster-${p} ./cmd/ipfs-cluster-${p}
  done
}

package() {
  cd "${pkgname}-${pkgver}"
  for p in ctl follow service; do
        install -Dm 755 $srcdir/ipfs-cluster-${p} ${pkgdir}/usr/bin/ipfs-cluster-${p}
  done
  install -o root -g root -m644 -D $srcdir/${pkgname}-service.service $pkgdir/usr/lib/systemd/system/${pkgname}-service.service
  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
