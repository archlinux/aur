# Maintainer: devome <evinedeng@hotmail.com>

pkgname=gcopy
pkgver=1.6.0
pkgrel=2
pkgdesc="A clipboard synchronization service for different devices that can synchronize text, screenshots, and files"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/llaoj/${pkgname}"
license=('MIT')
backup=("etc/${pkgname}/${pkgname}.env" "etc/${pkgname}/${pkgname}-web.env")
provides=("${pkgname}" "${pkgname}-web")
conflicts=("${pkgname}" "${pkgname}-web")
replaces=("${pkgname}-web")
depends=("nodejs")
makedepends=("go" "npm")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}-web.env"
        "${pkgname}-web.service"
        "${pkgname}.env"
        "${pkgname}.service"
        "${pkgname}.sysusers")
sha256sums=('219fc833e13b5808f53715b68c16d31760207a5ea1608ef246e072e1f7b00669'
            '7e0695fec7dc0a0ab33f7d8b18cae9a85a02c3323b2e98d976e7635e683984b0'
            'bfdd95eb4339d8bd41a2da17029af52e14dd833f42a5194067d078dc487c0530'
            'e78fb5838ae05398b9971ce74b030e5c69608d5d6158dd03c581252fca337668'
            '80df8843be3555e6acd3bf9b7474ce1e93e2393ebca85560d54f9656c82083e0'
            'f4cebdaa1dc7e571b53fbbc48651af3d657cb7dd5c0e39e353a2646a9ccf1cb0')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    # backend
    cd "${pkgname}-${pkgver}"
    go build -ldflags="-s -w -X ${url//https:\/\//}/pkg/version.version=${pkgver}" -o "${pkgname}" ./cmd
    sed -i "s|3375|3000|g" deploy/nginx-example.conf

    # frontend
    cd frontend
    echo 'SERVER_URL="http://localhost:3376"' > .env.production
    npm ci
    npx update-browserslist-db@latest --force
    npm run build
    rm .env.production .next/standalone/.env.production
    grep -rl "${srcdir}/${pkgname}-${pkgver}/frontend" .next | xargs -I {} sed -i "s|${srcdir}/${pkgname}-${pkgver}/frontend|/usr/lib/${pkgname}|g" {}
    sed -i 's|^\( *\)\(process.title\)|\1// \2|g' .next/standalone/node_modules/next/dist/server/lib/start-server.js
}

package() {
    install -Dm644 "${pkgname}-web.env"      "${pkgdir}/etc/${pkgname}/${pkgname}-web.env"
    install -Dm644 "${pkgname}-web.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}-web.service"
    install -Dm644 "${pkgname}.env"          "${pkgdir}/etc/${pkgname}/${pkgname}.env"
    install -Dm644 "${pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}"              "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "README.md"               "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE.md"              "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 deploy/nginx-example.conf "${pkgdir}/usr/share/doc/${pkgname}/nginx-example.conf"

    cd frontend
    cp -r --preserve=mode ".next/standalone" "${pkgdir}/usr/lib/${pkgname}"
    cp -r --preserve=mode ".next/static"     "${pkgdir}/usr/lib/${pkgname}/.next/static"
    cp -r --preserve=mode "public"           "${pkgdir}/usr/lib/${pkgname}/public"
}
