# Maintainer:  Quint Guvernator <quint@guvernator.net>
# Contributor: Pipat Saengow <pay2630@gmail.com>
# Contributor: Ralf Ahlbrink <ra.prism@gmail.com>

pkgname=hp15c
pkgver=5.1.00
pkgrel=2
pkgdesc="A simulator for the HP-15C programmable scientific RPN calculator"
url="https://hp-15c-simulator.de"
arch=('any')
license=('GPL3')
depends=('tcl' 'tk')
optdepends=('hidapi')
makedepends=('unzip' 'hidapi')
source=(
    "$pkgname-$pkgver.zip::https://hp-15c-simulator.de/versions/${pkgver}/HP-15C_${pkgver}_Source.zip"
    "hp15c_runner.sh"
    "hp15c.desktop"
    "71-hp15c-hid-hp-03f0-1341.rules"
    "71-hp15c-hid-dm-10c4-ea60.rules"
    # # make in src/lib/hidtcl und dann makepkg -e -f
    "hidtcl.tar.xz"
    # # ToDo for 'graphic display instead of custom font'
    #"https://www.tcl3d.org/bawt/download/InputLibs/tkpath-0.4.2.7z"
)
md5sums=('ca9e63e5b5de44eb7188d433d844a980'
         '28b63da6ff5404acf6f305bdb35ca1b9'
         'bab776009feb1db971b92649c839ff1f'
         'edae6ef32712397cc6b353972e258f0b'
         '18b23df6a6c4e3676f4cc6c54ef35bdf'
         '6e29581bc271d95c35b88fad2e92ff07')

prepare() {

    # extract icons
    unzip icons/HP-15C-logo.zip -d $srcdir/icon_extract

    # extract hidtcl lib
    tar xf hidtcl.tar.xz
}

build() {
    make -C lib/hidtcl
}

package() {

    # docs
    mkdir -p "$pkgdir/usr/share/doc/"
    cp -r doc "$pkgdir/usr/share/doc/$pkgname"
    cp "Read Me & Release Notes.html" "$pkgdir/usr/share/doc/$pkgname/README.html"

    # dependencies of script
    mkdir -p "$pkgdir/usr/lib/$pkgname/"
    cp -r css icons lib msgs images -t "$pkgdir/usr/lib/$pkgname/"
    install -Dm644 HP-15C_Simulator_Font.ttf -t "$pkgdir/usr/share/fonts/"

    # runs script in proper directory
    cp HP-15C.tcl -t "$pkgdir/usr/lib/$pkgname/"
    install -D hp15c_runner.sh "$pkgdir/usr/bin/hp15c"

    # install desktop entry
    install -D hp15c.desktop "$pkgdir/usr/share/applications/hp15c.desktop"

    # install icon
    for i in 22 32 48 256 512 ; do
        install -D "icon_extract/HP-15C-logo-${i}x${i}.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/hp15c.png"
    done

    # install udev rules
    install -dm 755 "$pkgdir/usr/lib/udev/rules.d/"
    install -m 644 "71-hp15c-hid-hp-03f0-1341.rules" "71-hp15c-hid-dm-10c4-ea60.rules" "$pkgdir/usr/lib/udev/rules.d/"

}

# vim:set ts=4 sw=4 ft=sh et:
