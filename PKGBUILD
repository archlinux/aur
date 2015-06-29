pkgname=darkstar-git
pkgdesc='Final Fantasy XI server emulator'
url='https://github.com/DarkstarProject/darkstar'
license=('GPL3')
arch=('i686' 'x86_64')
pkgver=r7405.c99e7eb
pkgrel=1
install=darkstar.install

depends=('luajit' 'libmariadbclient' 'zeromq')
makedepends=('git' 'automake')

provides=('darkstar')
conflicts=('darkstar')

# Until proper overlay (default config, user config) is implemented,
# it is probably better idea to fork darkstar and maintain your own branch with configuration,
# instead of merging changes from PKGBUILD each time.
# (this will replace your modified scripts etc, not listed in backup array)
backup=('var/lib/darkstar/conf/lan_config.conf'
        'var/lib/darkstar/conf/login_darkstar.conf'
        'var/lib/darkstar/conf/map_darkstar.conf'
        'var/lib/darkstar/conf/packet_darkstar_tcp.conf'
        'var/lib/darkstar/conf/packet_darkstar_udp.conf'
        'var/lib/darkstar/conf/search_server.conf'
        'var/lib/darkstar/conf/server_message.conf'
        'var/lib/darkstar/conf/server_message_fr.conf'
        'var/lib/darkstar/scripts/globals/settings.lua')

source=('git://github.com/DarkstarProject/darkstar.git'
        'darkstar-connect.service'
        'darkstar-game.service'
        'darkstar-search.service')

pkgver() {
    cd darkstar
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
    cd darkstar
    sh autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd darkstar
    make DESTDIR="$pkgdir" install

    install -Dd "${pkgdir}"/usr/lib/systemd/system
    install -m644 ../darkstar-{connect,game,search}.service "${pkgdir}"/usr/lib/systemd/system/

    install -Dd "${pkgdir}"/var/lib/darkstar/{conf,sql,log}
    install -m644 {compress,decompress}.dat "${pkgdir}"/var/lib/darkstar/
    install -m644 conf/*.conf "${pkgdir}"/var/lib/darkstar/conf/
    install -m644 sql/*.sql "${pkgdir}"/var/lib/darkstar/sql/
    install -m644 version.info "${pkgdir}"/var/lib/darkstar/

    cp -r scripts "${pkgdir}"/var/lib/darkstar/
}

md5sums=('SKIP'
         '808becd7e0b2e1ecb9bbd4e081d08f9c'
         '5f61d5fdc532b9b544ae2c3cb64b71e9'
         'd39193fe0d144bf9e5cfd68d2ba24ff8')
