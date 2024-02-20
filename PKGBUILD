# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Silvio Ankermann < silvio at booq dot org >

pkgname=prosody-filer
pkgver=1.0.3
pkgrel=1
url='https://github.com/ThomasLeister/prosody-filer'
license=('MIT')
pkgdesc='Golang mod_http_upload_external server for Prosody and Ejabberd'
arch=('i686' 'x86_64')
makedepends=(go)
backup=("etc/prosody-filer.toml")
install=prosody-filer.install
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz
        0001_non-git-version.patch
        prosody-filer.service)
sha256sums=('577e2a5c5ed1043a360ff291bb280bda346769f635d55d4e607e93bd9036afe5'
            '8091470335cba3a1560c0241cef92c14426121e21ffee9830e77acbe02a20739'
            '3f64c61eb4bd0d801c8a24d4bf3eae1e04c82ade000d363081d0d673eaaabe9f')


prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/0001_non-git-version.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    ./build.sh
}

package() {
    install -D -m755 ${pkgname}-${pkgver}/prosody-filer "${pkgdir}/usr/bin/prosody-filer"
    install -D -m644 ${pkgname}-${pkgver}/config.example.toml "${pkgdir}/etc/prosody-filer.toml"
    install -D -m644 prosody-filer.service "${pkgdir}/usr/lib/systemd/system/prosody-filer.service"
}
