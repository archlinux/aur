# Maintainer: sapient_cogbag <sapient_cogbag at protonmail dot com>
pkgname=electric-bin
pkgver=9.07
pkgrel=1
pkgdesc="Integrated circuit physical layout design & simulation tool"
arch=('any')
url="https://www.staticfreesoft.com/index.html"
license=('GPL' 'custom:IRSIM')
# For BSDTAR
makedepends=('libarchive')
depends=('java-runtime' 'java3d' 'bash')
provides=('electric')
conflicts=('electric')
# While I would prefer to build from source, I don't understand SVN well enough to pull from trunk instead of
# the 9.07 tag. Furthermore, this is a seriously-legacy application with tons of obscure java stuff.
source=(
    "https://ftpmirror.gnu.org/gnu/electric/electric-$pkgver.jar"
    "https://ftp.gnu.org/gnu/electric/electric-$pkgver.jar.sig"
    "electric-staticfreesoft-extras-$pkgver.jar::https://www.staticfreesoft.com/electricSFS-$pkgver.jar"

    "electric-manual-$pkgver.pdf::https://www.staticfreesoft.com/jmanual/ElectricManual-$pkgver.pdf"
    
    "electric-boise-state-standard-cmos-sclib.jelib::https://www.staticfreesoft.com/contrib/CMOScells.jelib"
    "electric-harvey-mudd-college-sclib.jelib::https://www.staticfreesoft.com/contrib/muddLib07.jelib.gz"
    "electric-city-engineering-college-bangalore-mosis-cmos-180nm-sclib.jelib::https://www.staticfreesoft.com/contrib/MOSIS180nmCells.jelib"
    "electric-sclib.jelib::https://personalpages.hs-kempten.de/~vollratj/Microelectronics/jelib/sclib.jelib"

    "electric-sun-microsystems-laboratories-mosis-cmos-350nm-pads.jelib::https://www.staticfreesoft.com/contrib/pads4u.jelib"

    "electric-harvey-mudd-college-example-mips-chip-32bit::https://www.staticfreesoft.com/contrib/muddChip.tar.gz"
    "electric-sun-microsystems-test-chip-qThree::https://www.staticfreesoft.com/contrib/qThree.tar.gz"

    "electric"
    "electric.desktop"
)

sha512sums=(
    'b68e86ad16a7e97bd6fee72da90e2bd403c54cecb3055505b6f8eaa85125546b83e268da12cf57bedaa33dab78a387f7b7ba8aa33ce6412588e339759aa1a716'
    'SKIP'
    '1e99f1ec7c6dec8f64e10f993261992233cb8c3d246ffebbc9d1521376b9a0ebe987c48a7d5c251ca212d96c477645420af2a70cef00b5da2eb5f60cf61506e1'

    'b68027b300b75f92a531c8bf2a273bb571f0c3d839ef3819bde60bd4ed60bb63e35ec9c93488859d74ba43e68e7aee57cf72330640780f31036a4ff2d999ea5e'

    '2b7787fac634418300da37469731a364d0f92868fc408aff11a79f8597211db2b49a68061e00738e36c9a745aef646acd1b49a462e0c6b8f9dd9386436f1c767'
    '19ecf7e8a6dbddcf7312b2443cda201b1afa20f7fd5fb3ef70ec1870a9909cb3b82b3536739cab76beb3e5fc0e55c050a3641ea82089d3599f890bfa9ec1afb5'
    '86bb6e8fc0451cbda3b08e591c99c0859c7e6274c8e76b8c3182fc6845f34d653b37f16b522cad255ccd1f262fd26e8543385430af6e28320ed98841abda59ef'
    'd1ae31523a271e863315c1ca93325e4527c29769a0f354b165ab2e256d19c0c1d362b272f8e72e53610c03bd4f5ea2c7292865d566ceab1d8ee36106be9c95e0'

    'd155f089815f4ab4210c5e6d97559589c065bf3794f51f3f09e95b7f71612e6e838083a63169916a7ebc4caa75cb5be7eefa954f31e831528c5d7dee1717e363'

    'f0c3d5bcac80beb302a5f9c235352cc877539fb4d93803dc858f97c79ad5201ee53a91393a60df5bd075e13f22af048e582b3ba98912676e21a05ebf7ec33e08'
    'b55b44bcd8c5a35ab17b35a1dec36b49eb2bd94f6f9c7e1f5db9c39ac44ec4af5081e5e3625b2a5f17a602c083f3895ca6df66a3af3e53c18ae883906c902010'

    'e3498bdd381ffeb369d685592d1215b800ec66d6e6c28a68be389f6592e72091fdac70506caf22df45458a4ff2f3f6eb8918693aae67eda72179fedb510ad649'
    '47640352c0d3922494104fbb7dec28d0b967dbbf5c0a464f6565eae657cc60049a219d59adc91adeea359b00f001a84ef4788d9eafd84fd2f59a6673ee5be179'
)

# We shouldn't be extracting jar files!
noextract=(
    "electric-$pkgver.jar"
    "electric-staticfreesoft-extras-$pkgver.jar"
)

prepare() {
    # Extract IRSIM license from the staticfreesoft-extras jar file.
    cd "$srcdir"
    bsdtar -f "electric-staticfreesoft-extras-$pkgver.jar" -x "LicenseIRSIM.txt"

    # Extract the electric icon
    bsdtar -f "electric-$pkgver.jar" -x "ElectricIcon64x64.png"
}

package() {
    cd "$srcdir"

    local ELECTRIC_MAIN_ROOT="$pkgdir/usr/share/java/electric"

    # the harvey mudd chip goes in it's own "muddChip" folder, but the other chip example gets extracted out into the main folder
    # All other jelib files are the standard cell libraries, but they are also *all symlinks* in src 
    # since they're provided as files directly rather than being shunted into a gz or zip folder.
    # As such, we:
    # * Move the mudd chip into the main examples folder nya~
    # * Move all non-symlink jelib files into the sun microsystems test chip folder. Note we just do this by hand.
    # * Copy the symlinked files into their respective folders (either standard cells or pads or any others)
    # * Move the jar files too :)
    #
    # Then we can establish the executor script.
    # -T => target is file
    # -t => reverse order and target is directory
    # -D => create any directory components of the target (if it's file like, this doesn't include the last, if it's directory like, it does nya)
    install -Dm0755 -T "electric-$pkgver.jar" "$ELECTRIC_MAIN_ROOT/electric.jar" 
    install -Dm0755 -T "electric-staticfreesoft-extras-$pkgver.jar" "$ELECTRIC_MAIN_ROOT/electric-sfs-extras.jar"
    # IRSIM license
    install -Dm0644 -t "$pkgdir/usr/share/licenses/electric-bin/irsim/" "LicenseIRSIM.txt"
    # Manual
    install -Dm0644 -T "electric-manual-$pkgver.pdf" "$ELECTRIC_MAIN_ROOT/manual.pdf"
    # Icon
    install -Dm0644 -T "ElectricIcon64x64.png" "$pkgdir/usr/share/pixmaps/electric.png"
    # Desktop file
    install -Dm0755 -T "electric.desktop" "$pkgdir/usr/share/applications/electric.desktop"

    # Standard Cell Libraries
    install -Dm0644 -T "electric-boise-state-standard-cmos-sclib.jelib" "$ELECTRIC_MAIN_ROOT/sclib/boise-state-standard-cmos.jelib" 
    install -Dm0644 -T "electric-harvey-mudd-college-sclib.jelib" "$ELECTRIC_MAIN_ROOT/sclib/harvey-mudd-college.jelib"
    install -Dm0644 -T "electric-city-engineering-college-bangalore-mosis-cmos-180nm-sclib.jelib" "$ELECTRIC_MAIN_ROOT/sclib/city-engineering-college-bangalore-mosis-cmos-180nm.jelib"
    install -Dm0644 -T "electric-sclib.jelib" "$ELECTRIC_MAIN_ROOT/sclib/sclib.jelib"

    # Pad Libraries
    install -Dm0644 -T "electric-sun-microsystems-laboratories-mosis-cmos-350nm-pads.jelib" "$ELECTRIC_MAIN_ROOT/pads/sun-microsystems-laboratories-mosis-cmos-350nm.jelib"

    # Example chips.
    # This first one is from that harvey mudd college, but it gets extracted as a single folder.
    install -Dm0644 -t "$ELECTRIC_MAIN_ROOT/examples/harvey-mudd-college-example-mips-chip-32bit" "muddChip"/*
    local sun_microsystems_test_chip_files=(
        "capFC2.jelib"
        "group.jelib"
        "jtag.jelib"
        "padParts.jelib"
        "purpleThree.jelib"
        "qThree_pads_180nm.jelib"
        "qThreeTop.jelib"
        "rowColScan.jelib"
        "scanChain.jelib"
        "scanFans.jelib"
        "txrx.jelib"
    )

    for test_chip_file in "${sun_microsystems_test_chip_files[@]}"; do
        install -Dm0644 -t "$ELECTRIC_MAIN_ROOT/examples/sun-microsystems-test-chip-qThree" "$test_chip_file"
    done

    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/electric"

}
