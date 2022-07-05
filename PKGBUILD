# Maintainer: Nicolas Derumigny <nderumigny@gmail.com>
# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

_target="aarch64-linux-gnu"
_pkgname="fakeroot"
pkgname="${_target}-${_pkgname}"
pkgver=1.29
pkgrel=1
pkgdesc='Tool for simulating superuser privileges'
arch=('x86_64')
license=('GPL')
url='https://tracker.debian.org/pkg/fakeroot'
install=fakeroot.install
depends=("${_target}-glibc" 'filesystem' 'sed' 'util-linux' 'sh')
makedepends=('systemd' 'po4a')
checkdepends=('sharutils')
source=("https://deb.debian.org/debian/pool/main/f/${_pkgname}/${_pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('8fbbafb780c9173e3ace4a04afbc1d900f337f3216883939f5c7db3431be7c20')

build() {
    _sysroot="/usr/${_target}"
    mkdir -p ${_pkgname}-build
    pushd ${_pkgname}-build
    "../${_pkgname}-${pkgver}/configure" --prefix="${_sysroot}" \
        --libdir="/usr/${_target}/lib/libfakeroot" \
        --disable-static \
        --with-ipc=sysv

    make
    popd

    pushd ${_pkgname}-${pkgver}/doc
    po4a -k 0 --rm-backups --variable 'srcdir=../doc/' po4a/po4a.cfg
    popd
}

check() {
    pushd ${_pkgname}-build
    make check
    popd
}

package() {
    pushd ${_pkgname}-build
    make DESTDIR="${pkgdir}" install
    popd

    install -dm0755 "${pkgdir}/usr/${_target}/etc/ld.so.conf.d/"
    echo "usr/${_target}/usr/lib/libfakeroot" > "${pkgdir}/usr/${_target}/etc/ld.so.conf.d/fakeroot.conf"

    # install README for sysv/tcp usage
    install -Dm0644 "${_pkgname}-${pkgver}/README" "${pkgdir}/usr/${_target}/usr/share/doc/${_pkgname}/README"

    rm -rf ${_pkgname}-build
}
