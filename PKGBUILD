# Maintainer: Igor Ochocki <unigniu14@gmail.com>
pkgname=wutsk-calendar
_npmname=WUTSKCalendar
pkgver=1.0.0
pkgrel=1
pkgdesc="A Next.JS calendar application for WUT SK"
arch=('x86_64' 'aarch64')
url="https://github.com/Igor-Ochocki/WUTSKCalendar"
license=('MIT')
depends=('nodejs' 'npm' 'nginx' 'openssl' 'git')
optdepends=("certbot: For obtaining trusted SSL certificates from Let's Encrypt" "certbot-nginx: Nginx plugin for Certbot")
install=${pkgname}.install

source=("${_npmname}::git+${url}.git#tag=v${pkgver}"
        "wutsk-calendar.nginx"
        "wutsk-calendar.service"
        "wutsk-calendar.confd"
)
sha256sums=('ffaf7c9bb5fa1dbbcfd293805b8a47826a2010a824e7ea129c9fa01a90bbe62c'
            '4c0fba33ee984b9fd2bd6523f7cd70b202bc20922b96cc98c761446c27dcdb6f'
            '1e63e082e6d8282ad6a6516d27cf1c3860ad43047899d638865f8597a39053bd'
            '8b5e0954b8b3c9badba7f891c056c12c640dfb9ae1a96ed16362f5340528cf3a')

prepare() {
    cd "${srcdir}/${_npmname}"
}

build() {
    msg "Building WUT SK Calendar v${pkgver}..."
    cd "${srcdir}/${_npmname}"

    export NPM_CONFIG_CACHE="${srcdir}/${_npmname}/.npm_cache_wutsk_calendar"
    mkdir -p "${NPM_CONFIG_CACHE}"

    export NODE_ENV=production
    npm install --verbose --production=false

    npm run build --verbose
}

package() {
    msg "Packaging WUT SK Calendar..."
    cd "${srcdir}/${_npmname}"

    local app_install_dir="${pkgdir}/usr/share/${pkgname}"

    install -d "${app_install_dir}"
    cp -r .next public next.config.js package.json "${app_install_dir}/"

    msg "Installing production Node.js modules into package..."
    cd "${app_install_dir}"
    export NPM_CONFIG_CACHE="${srcdir}/${_npmname}/.npm_cache_wutsk_calendar"
    mkdir -p "${NPM_CONFIG_CACHE}" # Ensures cache dir exists, though build() should create it
    npm install --verbose --production


    install -d "${pkgdir}/etc/nginx/conf.d/"
    install -Dm644 "${srcdir}/wutsk-calendar.nginx" "${pkgdir}/etc/nginx/conf.d/${pkgname}.conf"

    install -d "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${srcdir}/wutsk-calendar.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    install -d "${pkgdir}/etc/conf.d/"
    install -Dm644 "${srcdir}/wutsk-calendar.confd" "${pkgdir}/etc/conf.d/${pkgname}.example"

    install -d "${pkgdir}/var/log/${pkgname}"
}
