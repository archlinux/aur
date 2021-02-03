# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=slepc-git
pkgver=20210203
pkgrel=1
pkgdesc="Scalable library for Eigenvalue problem computations"
provides=(slepc)
conflicts=(slepc)
arch=('i686' 'x86_64')
url="https://gitlab.com/slepc/slepc"
license=('BSD')
depends=('petsc-git')
makedepends=('git')
install=slepc.install
source=(slepc::git+https://gitlab.com/slepc/slepc.git#branch=release)
sha256sums=('SKIP')

_slepc_dir='/usr/local/slepc'

pkgver() {
    cd slepc
    git log --format="%cd" --date=short -1 | sed 's/-//g'
}


build() {
	source /etc/profile.d/petsc.sh
	_install_dir=${_slepc_dir}/`basename ${PETSC_DIR}`

	cd slepc

	export SLEPC_DIR="${srcdir}/slepc"

	python ./configure --prefix="${_install_dir}" --with-clean

	make all
}


package() {
    cd slepc

    source /etc/profile.d/petsc.sh

    _build_dir="${srcdir}/slepc"
	_install_dir=${_slepc_dir}/`basename ${PETSC_DIR}`

    export SLEPC_DIR="${_build_dir}"

    make DESTDIR="${pkgdir}" install

    # install licence (even though there is no such word as licenses)
    install -Dm 644 ${_build_dir}/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md

    mkdir -p "${pkgdir}/etc/profile.d"
    echo "export SLEPC_DIR=${_install_dir}" > "${pkgdir}/etc/profile.d/slepc.sh"
    chmod +x "${pkgdir}/etc/profile.d/slepc.sh"

    # show where the shared libraries are
    install -dm 755 "${pkgdir}/etc/ld.so.conf.d/"
    echo "${_install_dir}/lib" > "${pkgdir}/etc/ld.so.conf.d/slepc.conf"

    install -m 644 ${pkgdir}/${_install_dir}/lib/pkgconfig/slepc.pc ${pkgdir}/${_install_dir}/lib/pkgconfig/SLEPc.pc
}
