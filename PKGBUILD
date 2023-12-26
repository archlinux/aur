# Maintainer: ros3 <ros3@ros3.cc>

pkgname=hello-http-bin
pkgver=1.4.3
pkgrel=1
pkgdesc='HTTP client for testing REST APIs, WebSocket, GraphQL and gRPC endpoints'
url='https://sunny-chung.github.io/hello-http/'
arch=('any')
license=('Apache-2.0')
source=("https://github.com/sunny-chung/hello-http/releases/download/v$pkgver/HelloHTTP-v$pkgver-linux-X64.tar.gz")
md5sums=('SKIP')

pkgver() {
    curl -i https://github.com/sunny-chung/hello-http/releases/latest 2>/dev/null | grep location | sed 's/^.*\/v\([.0-9]*\).*$/\1/'
}

package() {
    IFS=$'\n'

    # Create /opt/hello-http, /usr/bin
    install -d ${pkgdir}/opt/hello-http ${pkgdir}/usr/bin

    cd ${srcdir}/Hello\ HTTP

    dir_list=`find -type d | grep -vE '\.$' | sed 's/^\.\/\(.*\)$/\1/g'`
    lib_file_list=`find -type f | grep lib | grep -vE '\.$' | sed 's/^\.\/\(.*\)$/\1/g'`

    # Mirror directory structure to /opt/hello-http/
    for d in ${dir_list[@]}; do
        install -d "${pkgdir}/opt/hello-http/$d"
    done

    # Install 'Hello HTTP' binary, link from /usr/bin/hellohttp
    install -m755 bin/Hello\ HTTP ${pkgdir}/opt/hello-http/bin/
    ln -s /opt/hello-http/bin/Hello\ HTTP ${pkgdir}/usr/bin/hellohttp

    # Install files in /lib
    for f in ${lib_file_list[@]}; do
        install -m644 "$f" "${pkgdir}/opt/hello-http/$f"
    done
}
