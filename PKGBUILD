# Maintainer: Antoine Viallon <antoine at lesviallon dot fr>

pkgbase=tilibs-git
pkgname=(libticonv-git libticables-git libticalcs-git libtifiles-git)
pkgver=1.18.r41.g7be38a45
pkgrel=2
pkgdesc="Various TI libs required for TILP"
groups=("knightos")
arch=('i686' 'x86_64')
url="http://lpg.ticalc.org/prj_tilp/"
license=('GPL2')
depends=('glib2')
options=('!libtool')
source=("$pkgbase::git+https://github.com/debrouxl/tilibs.git"
        "libticables.install"
        "69-libticables.rules")
md5sums=('SKIP'
         '1831838d99949e3d378a07d8608b2bb4'
         '2e38fe89764f129c567b06afbbdfdcd0')

pkgver() {
  cd "$pkgbase"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    for _pkgname in ${pkgname[@]}; do
        echo "Building for ${_pkgname}..."
        subpkg=${_pkgname%-*}
        cd "${srcdir}/${pkgbase}/${subpkg}/trunk"

        configure_flags=""
        case $subpkg in
            libticonv)
                configure_flags+="--enable-iconv " ;;
            libticables)
                configure_flags+="--enable-libusb10 " ;;
            *)
                echo "Standard package" ;;
        esac

        autoreconf -fi
        ./configure --prefix=/usr $configure_flags
        make
    done
}

_package() {
  subpkg=${pkgname%-*}
  cd "${srcdir}/${pkgbase}/${subpkg}/trunk"

  make install DESTDIR="${pkgdir}"
}


#install_cables-git="libticables.install"
package_libticables-git() {
    provides=('libticables')
    conflicts=('libticables')
    #cd "${srcdir}/${pkgbase}/${pkgname}/trunk"
    #make install DESTDIR="${pkgdir}"
    _package

    install="libticables.install"

    install -Dm644 "${srcdir}/69-libticables.rules" "${pkgdir}/usr/lib/udev/rules.d/69-libticables.rules"
}

package_libticonv-git() {
    provides=(libticonv)
    conflicts=(libticonv)
    _package
}
package_libticalcs-git() {
    provides=(libticalcs)
    conflicts=(libticalcs)
    _package
}
package_libtifiles-git() {
    provides=(libtifiles)
    conflicts=(libtifiles)
    _package
}
