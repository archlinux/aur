# Maintainer: ros3

pkgname=hello-http-bin
pkgver=1.7.1
pkgrel=1
pkgdesc='HTTP client for testing REST APIs, WebSocket, GraphQL and gRPC endpoints'
url='https://sunny-chung.github.io/hello-http/'
arch=('any')
license=('Apache-2.0')
makedepends=('inkscape')
source=("https://github.com/sunny-chung/hello-http/releases/download/v$pkgver/HelloHTTP-v$pkgver-linux-X64.tar.gz" "https://raw.githubusercontent.com/sunny-chung/hello-http/refs/heads/main/appicon/appicon.svg" "hello-http.desktop")
sha256sums=('SKIP' 'fa5814b3663bc17b8ac410e0ffbd7b40e3605fb0ec14c8daa268667001982d81' '0dfb61352dcaa0eb8343c64c64062fc8935cb0de9857e3ff71d1e95001dd341c')

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
    runtime_executables=(jspawnhelper jexec)

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

    # Make select runtime files executable
    for e in ${runtime_executables[@]}; do
        chmod 755 "${pkgdir}/opt/hello-http/lib/runtime/lib/$e"
    done

    # Generate icon sizes from appicon.svg
    icon_sizes=(16 24 32 48 64 128 256)
    for icon_size in "${icon_sizes[@]}"; do
        inkscape --export-type=png ${srcdir}/appicon.svg -w $icon_size -h $icon_size -o ${srcdir}/hellohttp_${icon_size}x${icon_size}.png
    done

    # Install icons
    for icon_size in "${icon_sizes[@]}"; do
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/"
        install -m644 "${srcdir}/hellohttp_${icon_size}x${icon_size}.png" "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/hello-http.png"
    done

    # Install desktop file
    mkdir -p "${pkgdir}/usr/share/applications/"
    install -m644 "${srcdir}/hello-http.desktop" "${pkgdir}/usr/share/applications/hello-http.desktop"
}
