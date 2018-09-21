# Maintainer: doragasu <doragasu (yawn) hotmail (roll) com>
# Contributor: David Manouchehri
#
# Note: If downloads do not work (fail with e.g. error 403), you will have
# to manually download the base package and the latest service pack from
# http://www.latticesemi.com/latticediamond#linux
# Then put these files in the build directory and retry.

_version=3.10
_sp=2
_build=115.1
_base=111-2
pkgname=lattice-diamond
pkgdesc='Lattice Diamond design software'
url=http://www.latticesemi.com/
license=('custom')
pkgver=${_version}.${_sp}.${_build}
pkgrel=2
arch=('x86_64')
install=$pkgname.install
source=("http://files.latticesemi.com/Diamond/${_version}/diamond_${_version/"."/"_"}-base_x64-${_base}-${arch}-linux.rpm"
        "http://files.latticesemi.com/Diamond/${_version}.${_sp}/diamond_${_version/"."/"_"}-sp${_sp}_x64-${_build/"."/"-"}-${arch}-linux.rpm"
		"${pkgname}.png"
		"${pkgname}.desktop"
        "${pkgname}.install")
sha512sums=('423f4df79c3f07a7cf9cfd17914019f3c06187c4c1a04f13d48e255d3f75dfea2e1e9641506da59c06e276bef46737c14f502df668a3a7ac6ebe63a3cdd4cd1d'
            '21389b5e270bd8c0a5664c40531f990e15c22f5d511611e2e98f348e83a9b0bb701a35405082a6964bea7496db18879c5dcf327503aa2ecdedd06fc095b0e35a'
            '772fa260bb1a4ed7c4e328a99b3cd16b625e8880d7731abbe0cd59dbe4d743265e169a26ceba7b619a87c1cb9638a268a5501d3358863171ee808e59b2d3b0ac'
            'b5365ac137c6114bdd3e1d6bd1f9e2f8f5306cbf763d457190567c0f8d3086bf3dde11f50a22d35e759b62860f0014c66d631d463fd369d09162905fd5732c07'
            '0f6f4463e1b1266a151afaaf6fefb3d69b712fafd6f2fa20beb211a3f9dd4db216be7255cc8fddaac946534754739c13406476fc6474236e7505bcd033a71d81')
options=('!strip')
#PKGEXT=".pkg.tar" # The package is over 3 GB, uncomment this line if you prefer not compressing it

prepare() {
	# Extract all the packages from base
    for package in bin cae_library data embedded_source examples ispfpga synpbase tcltk
    do
        echo -en "\tExtracting ${package}..."
        cd ${srcdir}/usr/local/diamond/${_version}_x64/${package}
        tar -xzf ${package}.tar.gz
        rm ${package}.tar.gz
        echo ' done!'
    done

    # Apply service pack
    cd ${srcdir}/usr/local/diamond/${_version}_x64
    for directory in bin cae_library data docs embedded_source examples ispfpga module synpbase tcltk
    do
        echo -en "\tPatching ${directory}..."
        cp -rpf sp/${directory} ./
        echo ' done!'
    done
    rm -rf sp

    # Update version information and installation history
    echo -en "\tUpdating version information..."
    sed -i "1iDiamond_x64 Update Build ${pkgver} Update     Date: `LANG=C date`" \
        ${srcdir}/usr/local/diamond/${_version}_x64/data/installation_history.txt

    for file in data/ispsys.ini ispfpga/data/ispsys.ini
    do
        awk -i inplace 'BEGIN { FS = "="; minor = ARGV[2]; ARGV[2] = ""; bnum = ARGV[3]; ARGV[3] = ""; build_rev = ARGV[4]; ARGV[4] = ""};
        {
            if ($1 == "MinorVersion")
                printf "%s=%s\n", $1, minor
            else if ($1 == "BuildNumber")
                printf "%s=%s\n", $1, bnum
            else if ($1 == "ProductType")
                printf "%s=%s\n", $1, build_rev
            else
                printf "%s\n", $0
        }' ${file} $(echo ${pkgver} | cut -f 2,3 -d'.') ${_build} ${pkgver}
    done
    echo ' done!'
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
