pkgname=nginx-http3
pkgver=1.16
pkgrel=1
provides=('nginx')
conflicts=('nginx' 'nginx-unstable' 'nginx-svn' 'nginx-devel' 'nginx-custom-dev' 'nginx-full' 'nginx-libressl') 
pkgdesc="Nginx with Cloudflare's http3 path on the top of quiche"
arch=('any')
makedepends=('git' 'cmake' 'make' 'gcc' 'go' 'perl' 'ninja' 'rust')
depends=()
url="https://github.com/cloudflare/quiche/tree/master/extras/nginx"
license=('GPL3')
source=(
    "https://nginx.org/download/nginx-$pkgver.$pkgrel.tar.gz"
    'git+https://github.com/cloudflare/quiche.git'
)
sha256sums=(
    'f11c2a6dd1d3515736f0324857957db2de98be862461b5a542a3ac6188dbe32b'
    'SKIP'
)

package() {
    tar xzvf nginx-$pkgver.$pkgrel.tar.gz
    cd quiche
    git submodule update --init --recursive
    cd ../nginx-$pkgver.$pkgrel
    patch -p01 < ../quiche/extras/nginx/nginx-$pkgver.patch
    if [ $(uname -m) -eq 'aarch64' ]; then
        sed -i 's/alignas(64)/alignas(16)/g' ../quiche/deps/boringssl/crypto/cipher_extra/aead_test.cc
    fi
    ./configure                                \
       --prefix=/etc/nginx                     \
       --with-http_ssl_module                  \
       --with-http_v2_module                   \
       --with-http_v3_module                   \
       --with-openssl=../quiche/deps/boringssl \
       --with-quiche=../quiche
    make
    make DESTDIR="$pkgdir/" install
    cd "$pkgdir/"
    mkdir usr
    mv etc/nginx/sbin usr/bin
    install -Dm644 ../logrotate "$pkgdir"/etc/logrotate.d/nginx
    install -Dm644 ../service "$pkgdir"/usr/lib/systemd/system/nginx.service
}
