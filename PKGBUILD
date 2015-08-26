# Maintainer: David Manouchehri <david@davidmanouchehri.com>
# Contributor: Techlive Zheng <techlivezheng@gmail.com>
# Contributor: Bhanupong Petchlert <bpetlert@gmail.com>
# Contributor: Michal Rus <m@michalrus.com>

pkgname=hg-fast-export-git
_pkgname='fast-export'
pkgver=r408.d202200
pkgrel=2
pkgdesc="A mercurial to git converter using git-fast-import."
arch=('any')
url="http://repo.or.cz/w/fast-export.git"
license=('MIT')
depends=('python2' 'mercurial')
provides=('hg-fast-export')
conflicts=('hg-fast-export')
source=('git+http://repo.or.cz/r/fast-export.git')
sha512sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"

    # Use python2
    sed -i "s/PYTHON=\${PYTHON:-python}/PYTHON=\${PYTHON:-python2}/" hg-fast-export.sh
    sed -i "s/env\ python/env\ python2/" hg-fast-export.py
    sed -i "s/PYTHON=\${PYTHON:-python}/PYTHON=\${PYTHON:-python2}/" hg-reset.sh
    sed -i "s/env\ python/env\ python2/" hg-reset.py
    sed -i "s/env\ python/env\ python2/" hg2git.py

    # Fix root dir
    sed -i "s/^ROOT=.*$/ROOT=\$\(dirname\ \"\$\(readlink\ -f\ \$0\)\"\)/" hg-fast-export.sh
    sed -i "s/^ROOT=.*$/ROOT=\$\(dirname\ \"\$\(readlink\ -f\ \$0\)\"\)/" hg-reset.sh
}

package() {
    mkdir -p "${pkgdir}"/usr/share/hg-fast-export
    install -D -m 755 "${srcdir}"/"${_pkgname}"/hg* "${pkgdir}"/usr/share/hg-fast-export/

    mkdir -p ${pkgdir}/usr/bin
    ln -s /usr/share/hg-fast-export/hg-fast-export.sh "${pkgdir}"/usr/bin/hg-fast-export
}
