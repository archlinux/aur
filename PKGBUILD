# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
# Maintainer: Miguel Mota <hello@miguelmota.com>
pkgname=cointop
pkgver=1.6.5
pkgrel=1
pkgdesc="An interactive terminal based UI application for tracking cryptocurrencies"
url="https://github.com/miguelmota/cointop"
license=('APACHE')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('87c1e9f1dfb6de83b3ea0fc4ae90b35328772f6d841f70ae95800028f3dfd45a')

prepare() {
	cd "$pkgname-$pkgver"
	# Originally, the version number was embedded at link time.
	# This breaks RELRO support, so we patch it out to use $pkgver instead.
	patch --forward --strip=1 <<EOF
diff -ura cointop-1.5.5old/cointop/version.go cointop-1.5.5new/cointop/version.go
--- cointop-1.5.5old/cointop/version.go	2020-11-16 09:59:53.000000000 +1100
+++ cointop-1.5.5new/cointop/version.go	2021-01-03 20:49:08.289517518 +1100
@@ -1,36 +1,21 @@
 package cointop

-import (
-	"fmt"
-	"runtime/debug"
-	"strings"
-)
+import "fmt"

 // version is the cointop version which will be populated by ldflags
-var version string
+var version string = "v$pkgver"

 // Version returns the cointop version
 func (ct *Cointop) Version() string {
-	return Version()
+	return version
 }

 // Version returns cointop version
 func Version() string {
-	ver := "(devel)"
-	if version != "" {
-		ver = version
-	} else if buildInfo, ok := debug.ReadBuildInfo(); ok {
-		ver = buildInfo.Main.Version
-	}
-
-	if !strings.HasPrefix(ver, "v") {
-		ver = fmt.Sprintf("v%s", ver)
-	}
-
-	return ver
+	return version
 }

 // PrintVersion prints the version
 func PrintVersion() {
-	fmt.Println(Version())
+	fmt.Println(version)
 }
EOF
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GO111MODULE=on
  go build -o ctop .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  install -Dm755 "$pkgname-$pkgver/ctop" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
