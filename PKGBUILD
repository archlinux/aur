# Maintainer: gao <gao66 at sdf dot org>

pkgname=iptv-sources-git
_pkgname=iptv-sources
pkgver=r226.136e01a
pkgrel=1
pkgdesc="Autoupdate iptv sources"
arch=('any')
url="https://github.com/GrandDuke1106/iptv-sources"
license=('GPL-3.0')
depends=('nodejs' 'pm2')
makedepends=('git' 'npm')
optdepends=('iptv-checker-rs-git: Checking links in IPTV playlists written in Rust')
install="$pkgname.install"
source=("git+$url.git#branch=main")
sha256sums=(SKIP)
backup=("etc/pm2/conf.d/${_pkgname}.json")


pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    mv yarn.lock yarn.lock.bak
    npm install
    npm run build
    npm run m3u
}

package() {
    cd "$srcdir/$_pkgname"
    install -d "$pkgdir/opt/iptv-sources-git"
    cp -a ./* "$pkgdir/opt/iptv-sources-git/"

    install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}" LICENSE

    rm -rf "$pkgdir/opt/iptv-sources-git/.git"

    install -d "$pkgdir/etc/pm2/conf.d/"
    cat <<EOF > "$pkgdir/etc/pm2/conf.d/${_pkgname}.json"
{
    "apps": [
        {
            "name": "${_pkgname}-serve",
            "script": "/opt/iptv-sources-git/dist/serve.js",
            "cwd": "/opt/iptv-sources-git/",
            "watch": false,
            "env": {
                "NODE_ENV": "production",
                "ROLLBACK_URLS": "",
                "CLOSE_SOURCE_PROXY": "",
                "CUSTOM_GITHUB_RAW_SOURCE_PROXY_URL": "",
                "ENABLE_IPTV_CHECKER": "false",
                "IPTV_CHECKER_URL": ""
            }
        },
        {
            "name": "${_pkgname}-m3u",
            "script": "npm",
            "args": "run m3u",
            "cwd": "/opt/iptv-sources-git/",
            "watch": false,
            "cron_restart": "0 */2 * * *",
            "autorestart": false,
            "env": {
                "NODE_ENV": "production",
                "ROLLBACK_URLS": "",
                "CLOSE_SOURCE_PROXY": "",
                "CUSTOM_GITHUB_RAW_SOURCE_PROXY_URL": "",
                "ENABLE_IPTV_CHECKER": "false",
                "IPTV_CHECKER_URL": ""
            }
        }
    ]
}
EOF
}

