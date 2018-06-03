# Maintainer: Joffrey Darcq <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname=seafile-server
pkgver=6.3.0
pkgrel=1
pkgdesc="Seafile server core"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/haiwen/${pkgname}"
license=('AGPL3')
depends=("ccnet-server>=${pkgver}" "fuse2" "libevhtp-seafile" "libarchive")
makedepends=("vala")
optdepends=("python2-wsgidav-seafile: webdav-support")
conflicts=('seafile')
changelog="ChangeLog"
source=("${pkgname}-${pkgver}-server.tar.gz::${url}/archive/v${pkgver}-server.tar.gz"
        "fix_pids-folder-out-of-seafile-data.diff"
        "fix_seafile-admin.diff"
        "fix_mysql_support.diff"
        "fix_scripts_upgrade.diff"
        "seafile-server@.service"
)
sha256sums=('056013b496a8b5501a32011288416982609797108ba5a9d3213f9574abb5fd85'
            'd725bda36aedd424d426d7ce62e19c7036ccfc6a5759df12f139656ba15e425c'
            '6d456c0795bdf50c64c9f40d0fb725f6d356ff9638ec1b0c7921a11e4dd479d4'
            '9e50942e1f9cad21744b4467646e162896705d2c67834b600d78d4aa87b87a39'
            'bc23410381f380c419d9d5bb0757af136d96cfa8815e9ec7e0caa759d9d3a27d'
            'da31d1b61031cbacc42e1ab708c67c83dba933ff391b07677dabab7ab79729f4'
)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}-server"

    # Remove scripts for tests and others OS
    rm -rf "./scripts/"{build,upgrade/win32,*.bat,*.md} "./integration-tests"

    sed -i "s|(DESTDIR)@prefix@|@prefix@|" "./lib/libseafile.pc.in"

    patch -p1 -i "${srcdir}/fix_pids-folder-out-of-seafile-data.diff"
    patch -p1 -i "${srcdir}/fix_seafile-admin.diff"
    patch -p1 -i "${srcdir}/fix_mysql_support.diff"
    patch -p1 -i "${srcdir}/fix_scripts_upgrade.diff"

    # Use python lib seahub interpreter for all scripts
    grep -s -l -r '#!/usr/bin/env python' "./" \
    | xargs sed -i -e '1 s|#!/usr/bin/env python|#!/usr/lib/seahub/bin/python2|'

    grep -s -l -r -E "PYTHON=python[.0-9]+" "./" \
    | xargs sed -i -E 's|PYTHON=python[.0-9]+|PYTHON=/usr/lib/seahub/bin/python2|g'
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}-server"

    ./autogen.sh
    ./configure \
        --enable-fuse --enable-python \
        --prefix=/usr PYTHON=/usr/bin/python2
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-server"

    make DESTDIR="${pkgdir}" install

    # Prepare directories layout for an easy deploying
    # https://manual.seafile.com/deploy/using_mysql.html
    mkdir -p "${pkgdir}/usr/share/${pkgname}/runtime"
    cp -r -p "./scripts" "${pkgdir}/usr/share/${pkgname}/scripts"

    mv "${pkgdir}/usr/share/${pkgname}/scripts/seahub.conf" \
       "${pkgdir}/usr/share/${pkgname}/runtime/"
    mv "${pkgdir}/usr/share/${pkgname}/scripts/upgrade" \
       "${pkgdir}/usr/share/${pkgname}/"

    # Install systemd service
    install -Dm644 "${srcdir}/seafile-server@.service" \
                   "${pkgdir}/usr/lib/systemd/system/seafile-server@.service"
}
