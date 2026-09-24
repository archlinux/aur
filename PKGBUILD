# Maintainer: xhdndmm <xhdndmm@gmail.com>

pkgname=123pan
pkgver=4.0.5
pkgrel=1

pkgdesc="第三方123云盘客户端"
arch=('x86_64')
url="https://github.com/123panNextGen/123pan"
license=('GPL-3.0')

depends=('python')
makedepends=('git' 'uv')

options=('!strip' '!debug')

source=(
  "${pkgname}-${pkgver}::git+https://github.com/123panNextGen/${pkgname}.git#tag=v${pkgver}"
  "${pkgname}.png::https://raw.githubusercontent.com/123panNextGen/logo/refs/heads/main/img/logo-v2.png"
)

sha256sums=(
  'SKIP'
  'edc9c43937c0fa612be160a83265756dea36566c3f227165ccb7010b0a84ccff'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    uv venv \
        --python python \
        .venv

    uv sync \
        --active \
        --frozen
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -dm755 "${pkgdir}/opt/${pkgname}"

    cp -a src "${pkgdir}/opt/${pkgname}/"
    cp -a pyproject.toml "${pkgdir}/opt/${pkgname}/"
    cp -a uv.lock "${pkgdir}/opt/${pkgname}/"
    cp -a .venv "${pkgdir}/opt/${pkgname}/"

    install -dm755 "${pkgdir}/usr/bin"

    cat > "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh
exec /opt/${pkgname}/.venv/bin/python /opt/${pkgname}/src/123pan.py "\$@"
EOF

    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 \
        "${srcdir}/${pkgname}.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
