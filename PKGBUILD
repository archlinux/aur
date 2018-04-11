# Maintainer: Henninger Henningstone <henritees at mein-twserver dot de>

pkgname=allthehaxx
pkgver=0.36
pkgrel=2
pkgdesc="AllTernative Teeworlds Client"
arch=('x86_64')
url="https://allthehaxx.github.io"
license=('custom')
depends=('sdl2' 'glu' 'freetype2' 'opusfile' 'curl')
makedepends=('bam' 'imagemagick' 'gendesk' 'python')
optdepends=('ddnet-skins: more skins for your tee (provided by DDNet)'
            'ddnet-maps-git: have all DDNet maps available offline')
#provides=()
#conflicts=()
backup=('etc/allthehaxx/storage.cfg'
        'etc/allthehaxx/mapdbs.cfg'
        'etc/allthehaxx/skindbs.cfg')
#options=('!strip' 'debug') # uncomment this if you want to gdb AllTheHaxx
install=allthehaxx.install
source=("https://media.githubusercontent.com/media/AllTheHaxx/stuffility/master/releases/AllTheHaxx-$pkgver.tar.gz"
        '0001-Don-t-link-unnecessary-libs.patch')
sha256sums=('707d7d5b5861c918a52c5fc472e20c65dc21bac2f4294fda3945aba43c2494b5'
            '4f106ea29e22bc586b3a5a3bd4c1963723c43f5fceb3075db48ead74a7617354')


prepare() {
      # Client
    cd "$srcdir/AllTheHaxx-$pkgver/"
    convert "other/icons/AllTheHaxx.ico" AllTheHaxx.png
    patch -p1 -i "$srcdir/0001-Don-t-link-unnecessary-libs.patch"
}

build() {
    cd "$srcdir/AllTheHaxx-$pkgver/"
    bam config installation_root="/"
    bam client_release
    bam tools_release
}

package() {
    cd "$srcdir/AllTheHaxx-$pkgver/"
      # Install AllTheHaxx client binaries
    install -d -m755                   "$pkgdir/usr/bin/"
    install -m755 AllTheHaxx           "$pkgdir/usr/bin/"

      # Install extra tools
    install -d -m755                   "$pkgdir/usr/share/allthehaxx/tools"
    install -m755 colorcode            "$pkgdir/usr/share/allthehaxx/tools/"
    install -m755 config_retrieve      "$pkgdir/usr/share/allthehaxx/tools/"
    install -m755 config_store         "$pkgdir/usr/share/allthehaxx/tools/"
    install -m755 confusables          "$pkgdir/usr/share/allthehaxx/tools/"
    install -m755 crapnet              "$pkgdir/usr/share/allthehaxx/tools/"
    install -m755 dilate               "$pkgdir/usr/share/allthehaxx/tools/"
    install -m755 dummy_map            "$pkgdir/usr/share/allthehaxx/tools/"
    install -m755 fake_server          "$pkgdir/usr/share/allthehaxx/tools/"
    install -m755 map_resave           "$pkgdir/usr/share/allthehaxx/tools/"
    install -m755 map_version          "$pkgdir/usr/share/allthehaxx/tools/"
    install -m755 packetgen            "$pkgdir/usr/share/allthehaxx/tools/"
    install -m755 slc_unpack           "$pkgdir/usr/share/allthehaxx/tools/"
    install -m755 tileset_borderadd    "$pkgdir/usr/share/allthehaxx/tools/"
    install -m755 tileset_borderfix    "$pkgdir/usr/share/allthehaxx/tools/"
    install -m755 tileset_borderrem    "$pkgdir/usr/share/allthehaxx/tools/"
    install -m755 tileset_borderset    "$pkgdir/usr/share/allthehaxx/tools/"
    install -m755 uuid                 "$pkgdir/usr/share/allthehaxx/tools/"

      # Install data files
    install -d -m755 "$pkgdir/usr/share/allthehaxx/data/"
    cp -r data/* "$pkgdir/usr/share/allthehaxx/data/"
    rm -rf "$pkgdir/usr/share/allthehaxx/data/languages/scripts/"

      # Install editable text configuration files
    install -d -m755                    "$pkgdir/etc/allthehaxx/"
    install -m755 data/edtc/storage.cfg "$pkgdir/etc/allthehaxx/"
    install -m755 data/edtc/skindbs.cfg "$pkgdir/etc/allthehaxx/"
    install -m755 data/edtc/mapdbs.cfg  "$pkgdir/etc/allthehaxx/"

      # Install desktop and license files
    install -Dm644 other/AllTheHaxx.desktop "$pkgdir/usr/share/applications/allthehaxx.desktop"
    install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

      # Install icon files
    install -Dm644 AllTheHaxx-4.png     "$pkgdir/usr/share/pixmaps/AllTheHaxx.png"
}
