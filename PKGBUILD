# Maintainer: Aleksandr <contact at via dot aur>

pkgname=ptokax
_pkgname=PtokaX
pkgver=0.5.2.2
pkgrel=3
pkgdesc="PtokaX Direct Connect Hub is a multi-platform server application for Neo-Modus Direct Connect Peer-To-Peer sharing network."
arch=('x86_64')
url="http://www.PtokaX.org"
license=('GPL')
makedepends=('dos2unix')
depends=('lua' 'tinyxml' 'zlib')
makedepends=('make' 'gcc')
optdepends=('postgresql-libs'
            'sqlite'
            'mariadb')
install=install
changelog=
source=("$url/files/$pkgver-nix-src.tgz"
        'service'
        'sysusers'
        'SettingManager.cpp.patch'
        'tmpfiles'
        'Settings.pxt')

prepare() {
    cd "$srcdir/$_pkgname/core"
    dos2unix -f SettingManager.cpp
    patch --binary -p0 -i ../../SettingManager.cpp.patch
}

build() {
	cd "$_pkgname"
    # Compile PtokaX without database support
	make fedora
    
    # Compile PtokaX with PostgreSQL database support
    #make -f makefile-postgres fedora
     
    # Compile PtokaX with MariaDB database support
    #make -f makefile-mysql fedora
    
    # Compile PtokaX with SQLite database support
    #make -f makefile-sqlite fedora

}

package() {
	cd "$_pkgname"
    install -dm0755 "$pkgdir/var/lib/$pkgname/cfg"
    install -Dm0755 PtokaX "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 "$srcdir/service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm0644 "$srcdir/tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
    install -Dm0644 "$srcdir/sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dm0644 "$srcdir"/Settings.pxt "$pkgdir/var/lib/$pkgname/cfg/Settings.pxt"
    install -Dm0644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 Changelog.txt "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
    install -Dm0644 ReadMe.txt "$pkgdir/usr/share/doc/$pkgname/README"
}

md5sums=('0d5ca7ae81be69eb351fadfd1a498217'
         'fa9ba9566428af9603297aea1343ced2'
         '2df6b09b987a6b6e1e96ef6bc8a7a19e'
         '5f50852f8b1f490391e6593a51028590'
         '6a20c3ddfb3c625cca55f7480e609e1e'
         '25b7201edc7c31fd6b14a0d61ee0e1cc')
