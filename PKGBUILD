# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=alist
pkgver=3.33.0
pkgrel=1
pkgdesc="File list program that supports multiple storage"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'arm7vh' 'aarch64' 'riscv64' 'loong64')
url="https://github.com/alist-org/alist"
license=('AGPL3')
depends=('glibc')
makedepends=('go')
backup=('etc/alist/config.json')
install=alist.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
    "dist-$pkgver.tar.gz::https://github.com/alist-org/alist-web/releases/download/${pkgver%.*}.0/dist.tar.gz"
    'alist.service'
    'alist.tmpfiles'
    'alist.sysusers'
    'config.json')
sha256sums=('28aea1ddae1f394b9d66ca95cf25ab86cf30cce94544783ce7ea440f15d95f77'
            '50ae0539720bce7c470ac6bc47216b0e103e73636ee3a9b4b9364e2b52ca93f6'
            '5712b21aebf669fe9fb5d47dd685809d4d9670b1bb1d5e6fef962b9d11ba9d72'
            'c6b62c4a750ab921c2e8f965e4baeee28855c9a969b00eddd346670f2fdf12de'
            '3658370660806f73c3d9bc5f1b6e2a013c9520d34ffc4462df99f7692473613d'
            'b72f194a7b8855e97eeb76e63e179f38132cc9e6be9daa5b396699c9c11611de')

prepare() {
    cd "${srcdir}/$pkgname-$pkgver"
    rm -rf public/dist
    mv -f "${srcdir}/dist" public
    mkdir -p build
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	cd "$pkgname-$pkgver"
	go mod download
	## i tried, doesn't actually tag properly
	go build -o build \
		-ldflags="-linkmode external -extldflags \"${LDFLAGS}\" \
		-X 'github.com/alist-org/alist/conf.GoVersion=$(go version | awk '{print $3}')' \
		-X 'github.com/alist-org/alist/conf.GitTag=$pkgver'"
}


package() {
	cd "$pkgname-$pkgver"
	install -Dv "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dvm644 "${srcdir}/alist.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dvm644 "${srcdir}/config.json" -t "${pkgdir}/etc/${pkgname}"
    install -Dvm644 "${srcdir}/alist.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dvm644 "${srcdir}/alist.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
