# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: Reto Brunner <brunnre8@gmail.com>
pkgname=thelounge
pkgver=2.7.1
pkgrel=2
pkgdesc='Modern self-hosted web IRC client'
url='https://thelounge.chat/'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
backup=('etc/thelounge/config.js')
source=(
    "http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
    'system.service'
    'user.service'
    'sysusers.d'
    'tmpfiles.d'
)
noextract=("$pkgname-$pkgver.tgz")
md5sums=('f2be61e721cc677fb624687cf1e8944c'
         'e52c5db8dece96c773718b402e4679ad'
         '7493ff3e6bb98daae42b26bf97173ed3'
         'bf9da927d1432ec00a8dc0b7183745fc'
         '456c3d6d70aa33da967f79d215621dba')

package() {
    export NODE_ENV=production

    npm install -g --user root --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz" --cache "${srcdir}/npm-cache"

    echo /var/lib/thelounge > "$pkgdir/usr/lib/node_modules/$pkgname/.thelounge_home"

    # add default config
    install -Dm 644 "$pkgdir/usr/lib/node_modules/$pkgname/defaults/config.js" "$pkgdir/etc/thelounge/config.js"

    # services
    install -Dm644 "$srcdir/system.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$srcdir/user.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"

    # setting up system user
    install -Dm644 "${srcdir}/sysusers.d" "${pkgdir}/usr/lib/sysusers.d/thelounge.conf"
    install -Dm644 "${srcdir}/tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/thelounge.conf"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}
