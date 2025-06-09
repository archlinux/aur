# Maintainer: devome <evinedeng@hotmail.com>

pkgbase=gcopy
pkgname=("${pkgbase}" "${pkgbase}-web")
pkgver=1.4.9
pkgrel=1
pkgdesc="A clipboard synchronization service for different devices that can synchronize text, screenshots, and files"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/llaoj/${pkgbase}"
license=('MIT')
makedepends=("go" "npm")
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgbase}-web.env"
        "${pkgbase}-web.service"
        "${pkgbase}.env"
        "${pkgbase}.service"
        "${pkgbase}.sysusers")
sha256sums=('8fe7e69a892a73f9aa10496d4055ca8417cc65368469f286043a21b94553ccf4'
            '1b47cd9ba854ec53df8de892c906cf74a687f237ca141b200aada620316200ee'
            '1ffd97492315c562f075b14cf1d5a6cbda1806f635ef57868ef10fa39fec3cbb'
            '1fbb6961942c7c1f9e8876613d10356608e84e00914ac9acf7b134a4366b350b'
            'f052954e81b58a02e429eef3e19a54b53a900c2ad2a3e251ecaa9b783367f2f5'
            'f4cebdaa1dc7e571b53fbbc48651af3d657cb7dd5c0e39e353a2646a9ccf1cb0')
options=("!strip")

build() {
    cd "${pkgbase}-${pkgver}"
    echo 'SERVER_URL="http://localhost:3376"' > frontend/.env.production
    npm --prefix=frontend install
    npm --prefix=frontend run build
    rm frontend/.env.production frontend/.next/standalone/.env.production
    grep -rl "${srcdir}/${pkgbase}-${pkgver}/frontend" frontend/.next | xargs -I {} sed -i "s|${srcdir}/${pkgbase}-${pkgver}/frontend|/usr/share/${pkgbase}-web|g" {}
    sed -i "s|3375|3000|g" deploy/nginx-example.conf

    go build -trimpath -ldflags="-s -w -X ${url//https:\/\//}/pkg/version.version=${pkgver}" -o "${pkgbase}" ./cmd
}

package_gcopy() {
    pkgdesc+=" (backend)"
    backup=("etc/${pkgbase}/${pkgbase}.env")
    optdepends=("${pkgbase}-web: ${pkgbase} frontend")

    install -Dm644 "${pkgbase}.env"      "${pkgdir}/etc/${pkgbase}/${pkgbase}.env"
    install -Dm644 "${pkgbase}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgbase}.service"
    install -Dm644 "${pkgbase}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgbase}.conf"

    cd "${pkgbase}-${pkgver}"
    install -Dm755 "${pkgbase}"          "${pkgdir}/usr/bin/${pkgbase}"
    install -Dm644 "README.md"           "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
    install -Dm644 "LICENSE.md"          "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_gcopy-web() {
    pkgdesc+=" (frontend)"
    backup=("etc/${pkgbase}/${pkgbase}-web.env")
    depends=("nodejs")
    optdepends=("${pkgbase}: ${pkgbase} backend")
    
    install -Dm644 "${pkgbase}-web.env"      "${pkgdir}/etc/${pkgbase}/${pkgbase}-web.env"
    install -Dm644 "${pkgbase}-web.service"  "${pkgdir}/usr/lib/systemd/system/${pkgbase}-web.service"
    install -Dm644 "${pkgbase}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgbase}-web.conf"

    cd "${pkgbase}-${pkgver}"
    install -Dm644 "README.md"               "${pkgdir}/usr/share/doc/${pkgbase}-web/README.md"
    install -Dm644 "LICENSE.md"              "${pkgdir}/usr/share/licenses/${pkgbase}-web/LICENSE"

    cd frontend
    cp -r --preserve=mode ".next/standalone" "${pkgdir}/usr/share/${pkgbase}-web"
    cp -r --preserve=mode ".next/static"     "${pkgdir}/usr/share/${pkgbase}-web/.next/static"
    cp -r --preserve=mode "public"           "${pkgdir}/usr/share/${pkgbase}-web/public"

    cd ..
    install -Dm644 deploy/nginx-example.conf "${pkgdir}/usr/share/${pkgbase}-web/nginx-example.conf"
}
