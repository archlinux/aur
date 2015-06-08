pkgname=('vimperator-git')
srcname='vimperator'
pkgver='r1'
pkgrel='1'
pkgdesc='Make Firefox look and behave like Vim'
arch=('any')
url='https://github.com/vimperator/vimperator-labs'
license=('MIT')

makedepends=('git')
optdepends=('firefox: Web browser')
provides=('vimperator')
conflicts=('vimperator' 'vimperator-hg')

source=(
    "${srcname}::git+https://github.com/vimperator/vimperator-labs.git"
    'no_zip.patch'
)
sha512sums=(
    'SKIP'
    '83121899d5acadf96677542784534ce4c03e7cbdfd2d04610270df9c24dfb317520bd291dea9ba1d571e23b7473df7e92bbfc441010500ad6017f507207c2202'
)

EXTENSION_ID='vimperator@mozdev.org'

pkgver() {
    cd "${srcdir}/${srcname}"

    printf 'r%s.%s\n' \
        "$( git rev-list HEAD | wc --lines )" \
        "$( git describe --always | sed 's/-/./g' )"
}

prepare() {
    cd "${srcdir}/${srcname}"

    git apply "${srcdir}/no_zip.patch"
}

build() {
    cd "${srcdir}/${srcname}/vimperator"

    make VERSION="${pkgver}" xpi
}

package() {
    cd "${srcdir}/${srcname}"

    local destdir="${pkgdir}/usr/lib/firefox/browser/extensions"
    install --directory --mode=755 "${destdir}"
    cp --recursive "downloads/vimperator-${pkgver}" "${destdir}/${EXTENSION_ID}"
}
