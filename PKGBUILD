# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.
# Maintainer: yinflying <yinflying@foxmail.com>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)

_proname=RTKLIB
pkgname=rtklib-git
epoch=1
pkgver=2.5.0+51.r1565.20251012.b28b5ac5
pkgrel=1
pkgdesc="An Open Source Program Package for GNSS Positioning"
arch=('x86_64')
url="http://www.rtklib.com/"
license=('BSD-2-Clause')
groups=('GNSS')
depends=('glibc')
makedepends=('git' 'gcc-fortran')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
source=("${_proname}::git+https://github.com/rtklibexplorer/RTKLIB.git")
noextract=()
md5sums=('SKIP')

prepare() {
    cd "$srcdir/${_proname}"

    git log > git.log

}

pkgver() {
    cd "${srcdir}/${_proname}"

    _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
    _rev="$(git rev-list --count HEAD)"
    _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
    _hash="$(git rev-parse --short HEAD)"

    if [ -z "${_ver}"  ]; then
        error "Version could not be determined."
        return 1
    else
        printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
    fi

}

build() {
    cd "$srcdir/${_proname}/lib/iers/gcc"
    make
    cd "$srcdir/${_proname}/app/consapp"
    make

}

package() {
    # install bin file
    for _bin in pos2kml str2str rnx2rtkp convbin rtkrcv; do
        install -Dvm755 -t "${pkgdir}/usr/bin" "$srcdir/${_proname}/app/consapp/${_bin}/gcc/${_bin}"
    done
    # copy share file
    install -dvm755 "$pkgdir/usr/share/${pkgname%-git}/data/"
    cp -rv "$srcdir/${_proname}/data"/* "$pkgdir/usr/share/${pkgname%-git}/data"/
    install -dvm755 "$pkgdir/usr/share/${pkgname%-git}/rnx2rtkp"
    # cp -rv "$srcdir/${_proname}/app/consapp/rnx2rtkp/gcc"/*.conf "$pkgdir/usr/share/${pkgname%-git}/rnx2rtkp"/

    install -Dvm644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" "$srcdir/${_proname}"/{readme.txt,git.log}
    install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "$srcdir/${_proname}/license.txt"

}
