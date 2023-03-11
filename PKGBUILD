# Maintainer: Beini <bane at iki dot fi>

pkgname=('git-remote-qubes-git')
pkgbase=git-remote-qubes-git
_pkgbase=${pkgbase%%-git}
pkgver=0.1.0.r0.g8bc91a6
pkgrel=1
pkgdesc="Inter-VM Git for Qubes OS"
url="https://github.com/Rudd-O/git-remote-qubes"
license=('GPL3')
source=("git+https://github.com/Rudd-O/${_pkgbase}.git")
sha256sums=('SKIP')
arch=('any')
makedepends=('git' 'python')

pkgver() {
    cd "${srcdir}/${_pkgbase}"

    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd "${srcdir}/${_pkgbase}"

    make LIBEXECDIR="/usr/lib/${_pkgbase}" SITELIBDIR="${site_packages}" all
}

package_git-remote-qubes-git() {
    depends=('git' 'python')
    conflicts=("${_pkgbase}")
    provides=("${_pkgbase}")

    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd "${srcdir}/${_pkgbase}"

    make LIBEXECDIR="/usr/lib/${_pkgbase}" DESTDIR="${pkgdir}/" SITELIBDIR="${site_packages}" install-vm
}

# As for now, there are no Arch dom0s
# package_git-remote-qubes-dom0-git() {
#     pkgdesc="Policy package for Qubes OS dom0s that arbitrates git-remote-qubes"
#     conflicts=("${_pkgbase}-dom0")
#     provides=("${_pkgbase}-dom0")
#
#     cd "$srcdir/${_pkgbase}"
#     make DESTDIR="$pkgdir/" install-dom0
# }
