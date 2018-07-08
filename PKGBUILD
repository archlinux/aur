# Maintainer: Henninger Henningstone <henritees at mein-twserver dot de>

pkgname=allthehaxx
pkgver=0.36.4b
pkgrel=0
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
_archive="$pkgname-$pkgver.tar.gz"
source=("$_archive::https://netix.dl.sourceforge.net/project/allthehaxx/$pkgver/$pkgver.tar.gz") # https://github.com/AllTheHaxx/AllTheHaxx/archive/$pkgver.tar.gz
noextract=("$_archive")
sha256sums=('acfa20ee4bba87d648043b7ad567178a0aba048ce754ab6c41e9c222ad1e854b')


prepare() {
      # extract
    mkdir -p "$srcdir/AllTheHaxx-$pkgver/"
    tar xf "$_archive" -C "$srcdir/AllTheHaxx-$pkgver/" --strip-components 1

      # Client
    cd "$srcdir/AllTheHaxx-$pkgver/"
    convert "other/icons/AllTheHaxx.ico" AllTheHaxx.png
}

build() {
    cd "$srcdir/AllTheHaxx-$pkgver/"
    bam config installation_root="/"
    bam client_release
    #bam tools_release
}

package() {
    cd "$srcdir/AllTheHaxx-$pkgver/"
      # Install AllTheHaxx client binaries
    install -d -m755                   "$pkgdir/usr/bin/"
    install -m755 AllTheHaxx           "$pkgdir/usr/bin/"

      # Install extra tools (currently broken but also unnecessary)
    #install -d -m755                   "$pkgdir/usr/share/allthehaxx/tools"
    #install -m755 colorcode            "$pkgdir/usr/share/allthehaxx/tools/"
    #install -m755 config_retrieve      "$pkgdir/usr/share/allthehaxx/tools/"
    #install -m755 config_store         "$pkgdir/usr/share/allthehaxx/tools/"
    #install -m755 confusables          "$pkgdir/usr/share/allthehaxx/tools/"
    #install -m755 crapnet              "$pkgdir/usr/share/allthehaxx/tools/"
    #install -m755 dilate               "$pkgdir/usr/share/allthehaxx/tools/"
    #install -m755 dummy_map            "$pkgdir/usr/share/allthehaxx/tools/"
    #install -m755 fake_server          "$pkgdir/usr/share/allthehaxx/tools/"
    #install -m755 map_resave           "$pkgdir/usr/share/allthehaxx/tools/"
    #install -m755 map_version          "$pkgdir/usr/share/allthehaxx/tools/"
    #install -m755 packetgen            "$pkgdir/usr/share/allthehaxx/tools/"
    #install -m755 slc_unpack           "$pkgdir/usr/share/allthehaxx/tools/"
    #install -m755 tileset_borderadd    "$pkgdir/usr/share/allthehaxx/tools/"
    #install -m755 tileset_borderfix    "$pkgdir/usr/share/allthehaxx/tools/"
    #install -m755 tileset_borderrem    "$pkgdir/usr/share/allthehaxx/tools/"
    #install -m755 tileset_borderset    "$pkgdir/usr/share/allthehaxx/tools/"
    #install -m755 uuid                 "$pkgdir/usr/share/allthehaxx/tools/"

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
