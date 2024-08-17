# Maintainer: Janne Veteläinen <janne.p.w.vetelainen@gmail.com>

pkgname=vmangos-git
pkgver=r6292.9b3b375ef
pkgrel=1
pkgdesc="MMORPG server emulator"
arch=('x86_64')
url="https://github.com/vmangos/"
license=('GPL-2.0-or-later')
depends=(
    'ace'
    'gcc-libs'
    'glibc'
    'mariadb'
    'mariadb-libs'
    'onetbb'
    'openssl'
    'zlib'
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
install="$pkgname.install"
provides=('vmangos')
conflicts=('vmangos')
source=(
    "$pkgname::git+https://github.com/vmangos/core.git"
    "worlddb::git+https://github.com/brotalnia/database.git"
    "user.conf"
    "tmpfile.conf"
    "vmangos-realmd.service"
    "vmangos-mangosd.service"
    "vmangos-mangosd.socket"
    "cpp17.patch"
)
sha256sums=('SKIP'
            'SKIP'
            '8061858ce3617c236cd09e72ab9ccdb39afd1b0f76659fdeead6861d247d5832'
            '4e48db8fa3291429f7b0a5fe7a5a696ddc1809efd781b78355e4d6804d4dadc3'
            'cf30a0c18c6596235f3f95868a1d19bd2a07fd6accd946b619e3d1c3de8d3514'
            '9d99c70255ec8749a8d59010c53d76c41251783acfccf6c335c5dffa63b5d037'
            'c3cee4cb049545cb9c0857f8977120d219d8afcf5c1cb0531546d38ecde98783'
            'd04b6f59367d0fae2afd91dfa09837d55942838a28abb021637f9491b923e035')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
    cd "$srcdir/$pkgname"
    patch < "$srcdir/cpp17.patch"

    cd "$srcdir/worlddb"
    7z e world_full_14_june_2021.7z

    cd "$srcdir/$pkgname/sql/migrations"
    ./merge.sh
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DSUPPORTED_CLIENT_BUILD=5875 \
        -DUSE_ANTICHEAT=0 \
        -DUSE_EXTRACTORS=1 \
        -DCONF_DIR='/etc/vmangos'
    cmake --build build
}

package() {
    # Install binaries
    DESTDIR="$pkgdir/" cmake --install build

    # Rename conf files
    mv "$pkgdir/etc/vmangos/realmd.conf.dist" "$pkgdir/etc/vmangos/realmd.conf"
    mv "$pkgdir/etc/vmangos/mangosd.conf.dist" "$pkgdir/etc/vmangos/mangosd.conf"

    # Edit default directories in conf files
    sed -i 's/^DataDir.*/DataDir = "\/var\/lib\/vmangos"/' "$pkgdir/etc/vmangos/mangosd.conf"
    sed -i 's/^LogsDir.*/LogsDir = "\/var\/log\/vmangos"/' "$pkgdir/etc/vmangos/mangosd.conf"
    sed -i 's/^LogsDir.*/LogsDir = "\/var\/log\/vmangos"/' "$pkgdir/etc/vmangos/realmd.conf"

    # Install vmangos sysuser and systemd service
    install -Dm644 user.conf "$pkgdir/usr/lib/sysusers.d/vmangos.conf"
    install -Dm644 *.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 *.socket -t "$pkgdir/usr/lib/systemd/system"

    # Create vmangos directories in /var
    install -Dm644 tmpfile.conf "$pkgdir/usr/lib/tmpfiles.d/vmangos.conf"

    # Install extractor related files
    install -Dm644 "$srcdir/$pkgname/contrib/mmap/offmesh.txt" "$pkgdir/usr/share/vmangos/extractors/mmap/offmesh.txt"
    install -Dm644 "$srcdir/$pkgname/contrib/mmap/config.json" "$pkgdir/usr/share/vmangos/extractors/mmap/config.json"

    # Install sql scripts
    cd "$srcdir/$pkgname/sql"
    install -Dm644 logon.sql "$pkgdir/usr/share/vmangos/sql/build/realmd.sql"
    install -Dm644 "$srcdir/worlddb/world_full_14_june_2021.sql" "$pkgdir/usr/share/vmangos/sql/build/mangos.sql"
    install -Dm644 characters.sql "$pkgdir/usr/share/vmangos/sql/build/characters.sql"
    install -Dm644 logs.sql "$pkgdir/usr/share/vmangos/sql/build/logs.sql"

    install -Dm644 migrations/logon_db_updates.sql "$pkgdir/usr/share/vmangos/sql/migrations/realmd_db_updates.sql"
    install -Dm644 migrations/world_db_updates.sql "$pkgdir/usr/share/vmangos/sql/migrations/mangos_db_updates.sql"
    install -Dm644 migrations/characters_db_updates.sql "$pkgdir/usr/share/vmangos/sql/migrations/characters_db_updates.sql"
    install -Dm644 migrations/logs_db_updates.sql "$pkgdir/usr/share/vmangos/sql/migrations/logs_db_updates.sql"
}
