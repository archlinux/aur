# Maintainer: Dustin Falgout <dustin@antergos.com>
# Maintainer: Giovanni Santini <itachi.sama.amaterasu@gmail.com>

pkgname=obs-service-tar_scm-git
_pkgver=0.6.0
pkgver=0.6.0.r434
pkgrel=1
pkgdesc="Source Service for the OpenSUSE Build Service (OBS)"
arch=('any')
url="https://github.com/openSUSE/obs-service-tar_scm"
license=('GPL3')
source=("${pkgname}::git+https://github.com/openSUSE/${pkgname%-git}.git"
        "proper-python-check.patch")
groups=('obs')
depends=('python2'
        'obs-build'
        'git'
        'python2-yaml'
        'python2-dateutil')
checkdepends=('flake8'
            'python2-mock'
            'python2-pylint'
            'bzr'
            'cpio'
            'mercurial'
            'subversion')
optdepends=('cpio: needed for running properly the obs_scm source service'
            'subversion: svn repo support.'
            'mercurial: hg repo support.'
            'bzr: bzr repo support.')
backup=("etc/obs/services/tar_scm")
sha256sums=('SKIP'
            '8f12240b2ba47718901be613a798a9afe6bff0548591741035a3bb5cc02788d1')
# Comment this line to run tests
BUILDENV+=('!check')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "%s.r%s" "${_pkgver}" "$(git rev-list --count HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    git apply "${srcdir}/proper-python-check.patch"
}

check() {
    cd "${srcdir}/${pkgname}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
