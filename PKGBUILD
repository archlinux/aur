# Maintainer: Janne Veteläinen <janne.p.w.vetelainen@gmail.com>

pkgname=vmangos-git
pkgver=r5353.5c195daad
pkgrel=2
pkgdesc="World of Warcraft Vanilla server emulator"
arch=('x86_64')
url="https://github.com/vmangos/"
license=('GPL2')
depends=(
    'ace'
    'onetbb'
    'mariadb'
)
makedepends=(
    'cmake'
    'git'
    'p7zip'
)
optdepends=('vmangos-setupdb: Pacman hook to (insecurely) set up MariaDB')
backup=(
    'etc/vmangos/mangosd.conf'
    'etc/vmangos/realmd.conf'
)
install="${pkgname}.install"
provides=('vmangos')
conflicts=('vmangos')
source=(
    "${pkgname}::git+https://github.com/vmangos/core.git"
    "worlddb::git+https://github.com/brotalnia/database.git"
    "user.conf"
    "tmpfile.conf"
    "vmangos-realmd.service"
    "vmangos-mangosd.service"
    "vmangos-mangosd.socket"
)
sha256sums=(
    'SKIP'
    'SKIP'
    '8061858ce3617c236cd09e72ab9ccdb39afd1b0f76659fdeead6861d247d5832'
    '4e48db8fa3291429f7b0a5fe7a5a696ddc1809efd781b78355e4d6804d4dadc3'
    'f7306b4d4ff7ed563ce2ccbdee38c9c0cdce009d4a91feee7e0a6b7940b1ea83'
    'aade06747e04a22878203a5b2bddc577eff50addde231b9adbac5356ccd054d1'
    'c3cee4cb049545cb9c0857f8977120d219d8afcf5c1cb0531546d38ecde98783'
)

pkgver() {
    cd ${srcdir}/${pkgname}
    printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
    cd ${srcdir}/worlddb
    7z e ${srcdir}/worlddb/world_full_14_june_2021.7z

    cd ${srcdir}/${pkgname}/sql/migrations
    ./merge.sh
}

build() {
    cmake -B build -S "${pkgname}" \
        -DSUPPORTED_CLIENT_BUILD=5875 \
        -DUSE_EXTRACTORS=1 \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCONF_DIR='/etc/vmangos'
    cmake --build build
}

package() {
    # Install binaries
    DESTDIR=$pkgdir cmake --install build

    # Rename conf files
    mv ${pkgdir}/etc/vmangos/realmd.conf.dist ${pkgdir}/etc/vmangos/realmd.conf
    mv ${pkgdir}/etc/vmangos/mangosd.conf.dist ${pkgdir}/etc/vmangos/mangosd.conf

    # Edit default directories in conf files
    sed -i 's/^DataDir.*/DataDir = "\/var\/lib\/vmangos"/' ${pkgdir}/etc/vmangos/mangosd.conf
    sed -i 's/^LogsDir.*/LogsDir = "\/var\/log\/vmangos"/' ${pkgdir}/etc/vmangos/mangosd.conf
    sed -i 's/^LogsDir.*/LogsDir = "\/var\/log\/vmangos"/' ${pkgdir}/etc/vmangos/realmd.conf

    # Install vmangos sysuser and systemd service
    install -Dm644 ${srcdir}/user.conf ${pkgdir}/usr/lib/sysusers.d/vmangos.conf
    install -Dm644 ${srcdir}/*.service -t ${pkgdir}/usr/lib/systemd/system
    install -Dm644 ${srcdir}/*.socket -t ${pkgdir}/usr/lib/systemd/system

    # Create vmangos directories in /var
    install -Dm644 ${srcdir}/tmpfile.conf ${pkgdir}/usr/lib/tmpfiles.d/vmangos.conf

    # Install extractor related files
    install -Dm644 ${srcdir}/${pkgname}/contrib/mmap/offmesh.txt -t ${pkgdir}/usr/share/vmangos/extractors/mmap
    install -Dm644 ${srcdir}/${pkgname}/contrib/mmap/config.json -t ${pkgdir}/usr/share/vmangos/extractors/mmap

    # Install sql scripts
    install -Dm644 ${srcdir}/${pkgname}/sql/logon.sql -T ${pkgdir}/usr/share/vmangos/sql/build/realmd.sql
    install -Dm644 ${srcdir}/worlddb/world_full_14_june_2021.sql -T ${pkgdir}/usr/share/vmangos/sql/build/mangos.sql
    install -Dm644 ${srcdir}/${pkgname}/sql/characters.sql -t ${pkgdir}/usr/share/vmangos/sql/build
    install -Dm644 ${srcdir}/${pkgname}/sql/logs.sql -t ${pkgdir}/usr/share/vmangos/sql/build

    install -Dm644 ${srcdir}/${pkgname}/sql/migrations/logon_db_updates.sql -T ${pkgdir}/usr/share/vmangos/sql/migrations/realmd_db_updates.sql
    install -Dm644 ${srcdir}/${pkgname}/sql/migrations/world_db_updates.sql -T ${pkgdir}/usr/share/vmangos/sql/migrations/mangos_db_updates.sql
    install -Dm644 ${srcdir}/${pkgname}/sql/migrations/characters_db_updates.sql -t ${pkgdir}/usr/share/vmangos/sql/migrations
    install -Dm644 ${srcdir}/${pkgname}/sql/migrations/logs_db_updates.sql -t ${pkgdir}/usr/share/vmangos/sql/migrations

    for file in $(find ${srcdir}/${pkgname}/sql/custom -name '*.sql'); do
        install -Dm644 ${file} -t ${pkgdir}/usr/share/vmangos/sql/custom
    done
}
