# Maintainer: doragasu <doragasu (yawn) hotmail (roll) com>
# Contributor: David Manouchehri
# Contributor: m42uko

_version=3.14
_base=75.2
pkgname=lattice-diamond
pkgdesc='Lattice Diamond design software'
url=http://www.latticesemi.com/
depends=('libusb-compat')
makedepends=('xorg-server' 'fontconfig')
optdepends=('gst-plugins-base-libs')
license=('custom')
pkgver=${_version}
pkgrel=3
arch=('x86_64')
install=$pkgname.install
source=("https://files.latticesemi.com/Diamond/${_version}/${_version}.0.${_base}_Diamond_lin.zip"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.install")
sha512sums=('1e285a2fc010218a140e0b015b412b2df834b868486444961cff230e7366783f9a8eee0ede98e84a29dafd1da280ef786e1522786923737688988e0740348292'
            '772fa260bb1a4ed7c4e328a99b3cd16b625e8880d7731abbe0cd59dbe4d743265e169a26ceba7b619a87c1cb9638a268a5501d3358863171ee808e59b2d3b0ac'
            'e1beddf848254d7ab266c16dfcbf02d68d5e89b218c5b7b10aa27f9c77022b1171182f2c2c962b3afb0d94757077b93b84ccb762b392265164b799853e83a3a0'
            '5580225b386634b3fc39db4e0e68c7defdd97161880175cb78402142f206fd535b1e58b8f5f9a973624e2a90a40c1241a095e83e1adec79380f322823d1c24e6')
options=('!strip')
PKGEXT=".pkg.tar.zst"

prepare() {
    # Install to staging dir
    mkdir -p "${srcdir}/${_version}"
    "./${_version}.0.${_base}_Diamond_lin.run" --console --prefix "${srcdir}/${_version}"

    # Use system libstdc++ to fix Synplify Pro crashes
    cd "${srcdir}/${_version}/bin/lin64"
    rm libstdc++.so.6.0.18
    rm libstdc++.so.6
    ln -sf /usr/lib/libstdc++.so.6
    cd "${srcdir}/${_version}/synpbase/linux_a_64/lib"
    rm libstdc++.so.6
    ln -sf /usr/lib/libstdc++.so.6
    # Also symlink host libxml2 as libxml2.so.2 or Synplify Pro will not start
    ln -sf /usr/lib/libxml2.so libxml2.so.2
}

package() {
	# Move all the install files to pkgdir
	mkdir -p "${pkgdir}/usr/local/diamond"
	mv "${srcdir}/${_version}" "${pkgdir}/usr/local/diamond/"
	# Copy .desktop and icon files
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	cp "${srcdir}/lattice-diamond.png" "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/share/applications"
	cp "$srcdir/lattice-diamond.desktop" "$pkgdir/usr/share/applications/"
} 
