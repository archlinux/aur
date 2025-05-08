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
makedepends=('python-setuptools')
optdepends=("certbot: For obtaining trusted SSL certificates from Let's Encrypt" "certbot-nginx: Nginx plugin for Certbot")
install=${pkgname}.install

source=("${_npmname}::git+${url}.git#tag=v${pkgver}"
        "wutsk-calendar.nginx"
        "wutsk-calendar.service"
        "wutsk-calendar.confd"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
)

prepare() {
    cd "${srcdir}/${_npmname}"

    export NPM_CONFIG_CACHE="${srcdir}/${_npmname}/.npm_cache_wutsk_calendar"
    mkdir -p "${NPM_CONFIG_CACHE}"

    export npm_config_devdir="${srcdir}/${_npmname}/.node-gyp_cache"
    mkdir -p "${npm_config_devdir}"
}

build() {
    msg "Building WUT SK Calendar v${pkgver}..."
    cd "${srcdir}/${_npmname}"

    export NPM_CONFIG_CACHE="${srcdir}/${_npmname}/.npm_cache_wutsk_calendar"
    export npm_config_devdir="${srcdir}/${_npmname}/.node-gyp_cache"
    mkdir -p "${NPM_CONFIG_CACHE}"
    mkdir -p "${npm_config_devdir}"

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
    export npm_config_devdir="${srcdir}/${_npmname}/.node-gyp_cache"
    mkdir -p "${NPM_CONFIG_CACHE}"
    mkdir -p "${npm_config_devdir}"
    npm install --verbose --production


    install -d "${pkgdir}/etc/nginx/conf.d/"
    install -Dm644 "${srcdir}/wutsk-calendar.nginx" "${pkgdir}/etc/nginx/conf.d/${pkgname}.conf"

    install -d "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${srcdir}/wutsk-calendar.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

    install -d "${pkgdir}/etc/conf.d/"
    install -Dm644 "${srcdir}/wutsk-calendar.confd" "${pkgdir}/etc/conf.d/${pkgname}.example"

    install -d "${pkgdir}/var/log/${pkgname}"
}