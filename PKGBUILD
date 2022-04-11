# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Reto Brunner <brunnre8@gmail.com>
# Contributor: Maxime Poulin <maxpoulin64@gmail.com>
_pkgname=thelounge
pkgname=thelounge-beta
_pkgver=4.3.1-rc.1
pkgver=${_pkgver/-/}
pkgrel=2
pkgdesc='Modern self-hosted web IRC client (Latest release/pre-release)'
url='https://thelounge.chat/'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('yarn' 'git')
conflicts=('thelounge')
provides=('thelounge')
backup=('etc/thelounge/config.js')
source=(
    "${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/$_pkgname/$_pkgname/archive/refs/tags/v$_pkgver.tar.gz"
    'system.service'
    'user.service'
    'sysusers.d'
    'tmpfiles.d'
)
sha256sums=('5d3731d8f9448cd0cd3ea5f31622b10cf41138d94491c48692b2a96c7e695129'
            'c92210f6ac8f01c1cd01b6b26793094cd2feea583ed21fab3564d6bcafdc7a20'
            'c609f3309f54bd6285e99ff29ca2464828bec7bbbca67243ee688bd2d605dbf0'
            '30fab63b8a4ffcfdda4c5b8d7c66822a323c4f1de6ca62b77fe9500f4befc0a5'
            'bade9cf0e9fb27328db0c9d7300e9e215f2ff79305d94f1797d946e065a714bf')

prepare() {
    yarn install --prod --frozen-lockfile --non-interactive --ignore-scripts --cache-folder "$srcdir/yarn-cache"
}

package() {
    cd "$_pkgname-$_pkgver"
    yarn add --no-default-rc --frozen-lockfile --prod --non-interactive \
    --ignore-scripts --modules-folder "$pkgdir/usr/lib/node_modules" \
    --cache-folder "${srcdir}/yarn-cache" "${srcdir}/$_pkgname-$_pkgver"

    install -dm755 "$pkgdir/usr/bin/"
    ln -s "/usr/lib/node_modules/$_pkgname/index.js" "$pkgdir/usr/bin/$_pkgname"

    echo /etc/thelounge > "$pkgdir/usr/lib/node_modules/$_pkgname/.thelounge_home"

    # add default config
    install -Dm 660 "$pkgdir/usr/lib/node_modules/$_pkgname/defaults/config.js" "$pkgdir/etc/thelounge/config.js"

    # services
    install -Dm644 "$srcdir/system.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    install -Dm644 "$srcdir/user.service" "$pkgdir/usr/lib/systemd/user/$_pkgname.service"

    # setting up system user
    install -Dm644 "${srcdir}/sysusers.d" "${pkgdir}/usr/lib/sysusers.d/thelounge.conf"
    install -Dm644 "${srcdir}/tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/thelounge.conf"

    find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}
