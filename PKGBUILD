# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Reto Brunner <brunnre8@gmail.com>
# Contributor: Maxime Poulin <maxpoulin64@gmail.com>
_pkgname=thelounge
pkgname=thelounge-beta
_pkgver=4.3.0-pre.3
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc='Modern self-hosted web IRC client (Latest release/pre-release)'
url='https://thelounge.chat/'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
conflicts=('thelounge')
provides=('thelounge')
backup=('etc/thelounge/config.js')
source=(
    "https://registry.npmjs.org/$_pkgname/-/$_pkgname-$_pkgver.tgz"
    'system.service'
    'user.service'
    'sysusers.d'
    'tmpfiles.d'
)
noextract=("$_pkgname-$_pkgver.tgz")
sha256sums=('8c75cc665ede209e8b60229994e8ce2f71af299807b81b91d48fd512618ece9b'
            'c92210f6ac8f01c1cd01b6b26793094cd2feea583ed21fab3564d6bcafdc7a20'
            'c609f3309f54bd6285e99ff29ca2464828bec7bbbca67243ee688bd2d605dbf0'
            '30fab63b8a4ffcfdda4c5b8d7c66822a323c4f1de6ca62b77fe9500f4befc0a5'
            'bade9cf0e9fb27328db0c9d7300e9e215f2ff79305d94f1797d946e065a714bf')

package() {
    export NODE_ENV=production

    npm install -g --user root --prefix "$pkgdir/usr" "$_pkgname-$_pkgver.tgz" --cache "${srcdir}/npm-cache"

    echo /etc/thelounge > "$pkgdir/usr/lib/node_modules/$_pkgname/.thelounge_home"

    # add default config
    install -Dm 644 "$pkgdir/usr/lib/node_modules/$_pkgname/defaults/config.js" "$pkgdir/etc/thelounge/config.js"

    # services
    install -Dm644 "$srcdir/system.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    install -Dm644 "$srcdir/user.service" "$pkgdir/usr/lib/systemd/user/$_pkgname.service"

    # setting up system user
    install -Dm644 "${srcdir}/sysusers.d" "${pkgdir}/usr/lib/sysusers.d/thelounge.conf"
    install -Dm644 "${srcdir}/tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/thelounge.conf"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}
