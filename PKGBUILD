# Maintainer: Swyter <swyterzone+aur@gmail.com>

pkgname=intel-gpa-bin
pkgrel=1
pkgver=22.2.1654744802
options=(!strip)
arch=('x86_64')
license=('custom')
pkgdesc="Intel® Graphics Performance Analyzers (Intel® GPA) provides tools for graphics analysis and optimizations for making games and other graphics-intensive applications run even faster."

source=("https://registrationcenter-download.intel.com/akdlm/irc_nas/18791/gpa_${pkgver}_release_m64_deb_install.sh")
sha256sums=('345d38d0877e081beab2710e6b58272c4a2831e36f0ebbc1cd2bba2be46541c9')

build() {
    # swy: wrap the called commands with our customized/dummied out versions
    mktemp() {
        echo "./" # swy: dump the .deb here, same folder
    }

    dpkg() {
        echo "$@" # swy: don't install, we're not ubuntu
    }

    rm() {
        echo "$@" # swy: don't remove it afterwards
    }

    export -f mktemp
    export -f dpkg
    export -f rm

	cd "$srcdir/"

    # swy: call the shell-based script that normally installs the self-contained .deb file
    yes 'yes' | sh ./gpa_${pkgver}_release_m64_deb_install.sh

    unset rm

    # swy: extract the files from the .deb file
    ar x intel-gpa_tmp.deb && tar -xvf data.tar.xz
}

package() {
	cd "$srcdir"

    cp -r "${srcdir}/opt" ${pkgdir}
    cp -r "${srcdir}/usr" ${pkgdir}
}