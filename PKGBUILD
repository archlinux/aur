# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Reto Brunner <brunnre8@gmail.com>
# Contributor: Maxime Poulin <maxpoulin64@gmail.com>
_pkgname=thelounge
pkgname=thelounge-beta
_pkgver=4.4.0-pre.2
pkgver=${_pkgver/-/}
pkgrel=2
pkgdesc='Modern self-hosted web IRC client (Latest release/pre-release)'
url='https://thelounge.chat/'
arch=('any')
license=('MIT')
depends=('nodejs')
options=('!lto')
makedepends=('yarn' 'python' 'git')
conflicts=('thelounge')
provides=('thelounge')
backup=('etc/thelounge/config.js')
source=(
    "https://registry.npmjs.org/$_pkgname/-/$_pkgname-$_pkgver.tgz"
    "https://raw.githubusercontent.com/thelounge/thelounge/v${_pkgver}/yarn.lock"
    "https://raw.githubusercontent.com/thelounge/thelounge/v${_pkgver}/package.json"
    'system.service'
    'user.service'
    'sysusers.d'
    'tmpfiles.d'
)
noextract=("$_pkgname-$_pkgver.tgz")
sha256sums=('b9b5f1f9b1f5f1b011d13f4b162051c29f0863f0f39b3dce13177e7b82afbf06'
            'c5070596b647eec83dab4795902a96e31804df42f4db2997c3aeff7ed4913299'
            '17aa5a59abfd629ad7c79bcfdc00d1d9bf15b7d0f881ea50497792c9593d9b57'
            'c92210f6ac8f01c1cd01b6b26793094cd2feea583ed21fab3564d6bcafdc7a20'
            'c609f3309f54bd6285e99ff29ca2464828bec7bbbca67243ee688bd2d605dbf0'
            '30fab63b8a4ffcfdda4c5b8d7c66822a323c4f1de6ca62b77fe9500f4befc0a5'
            'c07fc7aaa91f6d2407d9ea2d15bfa780bfc06e3487efa138a9385307dcf9f41d')

prepare() {
    yarn install --prod --frozen-lockfile --non-interactive --ignore-scripts --cache-folder "$srcdir/yarn-cache"
}

build() {
    mkdir -p _build
    cp package.json yarn.lock _build
    cd _build

    # Install the package itself
    # we on purpose don't use yarn global add, because --ignore-scripts
    # is ignored: https://github.com/yarnpkg/yarn/issues/8291 but we tried
    yarn add --no-default-rc --frozen-lockfile \
    --prod --non-interactive --ignore-scripts \
    --cache-folder "$srcdir/yarn-cache" --offline \
    file:"$srcdir/$_pkgname-${_pkgver}.tgz"

    # fetch sqlite3 binary blob
    cd node_modules/sqlite3
    ./node_modules/.bin/node-pre-gyp install --fallback-to-build
}

package() {
    install -dm755 "$pkgdir/usr/lib/thelounge"
    cp -r "$srcdir/_build/node_modules" "$pkgdir/usr/lib/thelounge"

    install -dm755 "$pkgdir/usr/bin/"
    ln -s "/usr/lib/thelounge/node_modules/thelounge/index.js" "$pkgdir/usr/bin/thelounge"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    # yarn is probably not much better
    find "${pkgdir}"/usr/lib/thelounge -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    echo /etc/thelounge > "$pkgdir/usr/lib/thelounge/node_modules/thelounge/.thelounge_home"

    # add default config
    install -Dm 644 "$pkgdir/usr/lib/thelounge/node_modules/thelounge/defaults/config.js" "$pkgdir/etc/thelounge/config.js"

    # services
    install -Dm644 "$srcdir/system.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
    install -Dm644 "$srcdir/user.service" "$pkgdir/usr/lib/systemd/user/$_pkgname.service"

    # setting up system user
    install -Dm644 "${srcdir}/sysusers.d" "${pkgdir}/usr/lib/sysusers.d/thelounge.conf"
    install -Dm644 "${srcdir}/tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/thelounge.conf"
}
