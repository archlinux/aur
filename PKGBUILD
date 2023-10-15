# Maintainer: doragasu <doragasu (yawn) hotmail (roll) com>
# Contributor: David Manouchehri
#
# Note: If downloads do not work (fail with e.g. error 403), you will have
# to manually download the base package and the latest service pack from
# http://www.latticesemi.com/latticediamond#linux
# Then put these files in the build directory and retry.

_version=3.13
_base=56-2
pkgname=lattice-diamond
pkgdesc='Lattice Diamond design software'
url=http://www.latticesemi.com/
license=('custom')
pkgver=${_version}
pkgrel=1
arch=('x86_64')
install=$pkgname.install
source=("http://files.latticesemi.com/Diamond/${_version}/diamond_${_version/"."/"_"}-base-${_base}-${arch}-linux.rpm"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.install")
sha512sums=('76b2d77c61a532278470f5dfab7ed409d467f6f5566e56bc9680761c429ad90ac2881b17cac6ef297bc0ddd246ab92403c1a56caa22890b6393e18bb25d7f980'
            '772fa260bb1a4ed7c4e328a99b3cd16b625e8880d7731abbe0cd59dbe4d743265e169a26ceba7b619a87c1cb9638a268a5501d3358863171ee808e59b2d3b0ac'
            '9cc87b6e05bc47ef3db9066a06384c0710a4aeaf725f24beaa45732474ed40b0b637c664c1e3f014a7f7dfc25401e872d38497015576c18d3929f38975504d9b'
            '0f6f4463e1b1266a151afaaf6fefb3d69b712fafd6f2fa20beb211a3f9dd4db216be7255cc8fddaac946534754739c13406476fc6474236e7505bcd033a71d81')
options=('!strip')
PKGEXT=".pkg.tar.zst"

prepare() {
    # Extract all the packages from base
    for package in bin cae_library data embedded_source examples ispfpga modeltech synpbase tcltk
    do
        echo -en "\tExtracting ${package}..."
        cd ${srcdir}/usr/local/diamond/${_version}/${package}
        tar -xzf ${package}.tar.gz
        rm ${package}.tar.gz
        echo ' done!'
    done

    # Use system libstdc++ to fix Synplify Pro crashes
    cd "${srcdir}/usr/local/diamond/3.13/bin/lin64"
    rm libstdc++.so.6.0.18
    rm libstdc++.so.6
    ln -sf /usr/lib/libstdc++.so.6
    cd "${srcdir}/usr/local/diamond/3.13/synpbase/linux_a_64/lib"
    rm libstdc++.so.6
    ln -sf /usr/lib/libstdc++.so.6
}

package() {
	# Move everything to pkgdir
	mv ${srcdir}/usr ${pkgdir}/
	# Copy .desktop and icon files
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	cp "${srcdir}/lattice-diamond.png" "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/share/applications"
	cp "$srcdir/lattice-diamond.desktop" "$pkgdir/usr/share/applications/"
} 
