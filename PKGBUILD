# Maintainer: devome <evinedeng@hotmail.com>

_reponame=mdcz
pkgname="${_reponame}-server"
pkgver=0.11.0
pkgrel=2
pkgdesc="Media metadata scraper (server)"
arch=('x86_64' 'aarch64')
url="https://github.com/ShotHeadman/${_reponame}"
license=("GPL-3.0-or-later")
backup=("etc/conf.d/${_reponame}")
depends=("nodejs")
makedepends=("npm" "pnpm")
source=("${_reponame}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_reponame}.service"
        "${_reponame}.sysusers"
        "${_reponame}.tmpfiles"
        "${_reponame}u.service")
sha256sums=('76ddc3966c8cc53f1f83e8a2db6f068ea4199076c7552c11e5f29d9b415e9106'
            'b238101b924496e6257593a82405e984e9373aac52a06cdbf236d30624972c99'
            'c80caf8e5dc0ec46f3aefd2b207a2ddf035685874102698196f050afe7719310'
            '5325bb75ca4acdadef92d12d159ea2ade7f80cc4cb57b48e08274a8a625d6d66'
            '28e159c1da2e09fede6d97f4a9a2b4ed53039dca99ac189efaf6b4496aef7529')

prepare() {
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/$_electron"

    rm -rf "${pkgname}" &>/dev/null
    cd "${_reponame}-${pkgver}"
    sed -i "s|^MDCZ_WEB_DIST_DIR=web|MDCZ_WEB_DIST_DIR=/usr/lib/mdcz/server/web|" apps/server/.env.example
    pnpm install
}

build() {
    cd "${_reponame}-${pkgver}"
    pnpm run package:webui
    rm -rf "release/staging/${_reponame}-${pkgver}/"{systemd,install.*,start.*}
    cp -ar "release/staging/${_reponame}-${pkgver}" "../${pkgname}"
    cd "../${pkgname}"
    npm install --omit=dev --no-audit --no-fund --no-package-lock
    npm install-scripts approve better-sqlite3 impit sharp
    npm rebuild better-sqlite3 impit sharp
    find . -type f -name "*.map" -delete
    grep -rl "${srcdir}/${pkgname}" . | xargs -I {} sed -i "s|${srcdir}/${pkgname}|/usr/lib/${_reponame}/server|g" {}
    perl -0777 -pe 's{
        (?:\#.*\n)*
        \#?\s*(?:MDCZ_HOME|MDCZ_CONFIG_DIR|MDCZ_DATA_DIR|MDCZ_DATABASE_PATH)=.*\n
        (?:\n)?
    }{}gx' .env.example > "../${_reponame}.conf"
}

package() {
    install -Dm644 "${_reponame}.conf"     "${pkgdir}/etc/conf.d/${_reponame}"
    install -Dm644 "${_reponame}.service"  "${pkgdir}/usr/lib/systemd/system/${_reponame}.service"
    install -Dm644 "${_reponame}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_reponame}.conf"
    install -Dm644 "${_reponame}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_reponame}.conf"
    install -Dm644 "${_reponame}u.service" "${pkgdir}/usr/lib/systemd/user/${_reponame}.service"
    install -dm755                         "${pkgdir}/usr/lib/${_reponame}"
    cp -a -r --preserve=mode "${pkgname}"  "${pkgdir}/usr/lib/${_reponame}/server"
}
