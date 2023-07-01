# Maintainer: Swyter <swyterzone+aur@gmail.com>

pkgname=intel-gpa-bin
url=https://www.intel.com/content/www/us/en/developer/tools/graphics-performance-analyzers/download.html
pkgrel=2
pkgver=23.2.1686276958
options=(!strip)
arch=('x86_64')
license=('custom')
pkgdesc="Intel® Graphics Performance Analyzers (Intel® GPA) provides tools for graphics analysis and optimizations for making games and other graphics-intensive applications run even faster."

source=("https://registrationcenter-download.intel.com/akdlm/IRC_NAS/46f856a1-7346-4305-b47f-b38b1a2dd9f9/gpa_${pkgver}_release_m64_deb_install.sh")
sha1sums=('d8db1524ab3639fdfb631e86ae34a0aaf386375f')
makedepends=(binutils tar sed)
depends=(libffi7) # swy: it needs libffi.so.7, but they forgot to bundle it

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

    # swy: these are all legal documents
    mv ${pkgdir}/usr/share/doc ${pkgdir}/usr/share/licenses

    # swy: don't hide the error/warning logging when running on a terminal
    sed -i -e 's|> /dev/null 2>&1||g' ${pkgdir}/usr/bin/gpa-*
}