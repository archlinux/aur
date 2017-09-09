# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=consul-template
pkgver=0.19.2
pkgrel=1
pkgdesc='Template rendering, notifier, and supervisor for HashiCorp Consul and Vault data'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url='https://github.com/hashicorp/consul-template'
license=('MPL')
backup=("etc/$pkgname/config.hcl")
makedepends=('go>=1.8')
optdepends=('consul: interpolate values from a distributed key/value store'
            'vault: reference secure secrets in template files')
options=('!strip')
source=("$url/archive/v$pkgver.tar.gz"
        "$pkgname.service")
sha256sums=('e7fca6e75d7165094a094d7e8347ec5b79733308eea8dec4bd94f50e9b233b45'
            '693fb4e88081ca7ce84a9c0d61cdc1130929359de35f70f145ea8008b7b42e3d')

prepare() {
    # Prepare an empty GOPATH for `go build`
    mkdir -p "$srcdir/gopath"

    # Link extracted release into GOPATH
    mkdir -p "$srcdir/gopath/src/github.com/hashicorp"
    ln -sf "$srcdir/$pkgname-$pkgver" \
        "$srcdir/gopath/src/github.com/hashicorp/$pkgname"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Build flags copied from upstream build scripts
    GOPATH="$srcdir/gopath" \
        go build \
        -ldflags="-s -w \
            -X $pkgname/version.Name=$pkgname \
            -X $pkgname/version.Version=$pkgver" \
        -a -o "$pkgname" .
}

package() {
    mkdir -p "$pkgdir/etc/$pkgname"
    touch "$pkgdir/etc/$pkgname/config.hcl"

    install -D -m755 "$srcdir/$pkgname-$pkgver/$pkgname" \
                     "$pkgdir/usr/bin/$pkgname"
    install -D -m644 "$srcdir/$pkgname.service" \
                     "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
