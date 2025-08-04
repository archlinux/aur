# Maintainer: Rafael Ascensão <rafa dot almas at gmail dot com>

_npmname='@google/clasp'
pkgname="nodejs-google-clasp"
pkgver=2.5.0
pkgrel=1
pkgdesc='Develop Apps Script Projects locally'
arch=('any')
url='https://github.com/google/clasp'
license=('Apache')
depends=('nodejs')
makedepends=('npm')
optdepends=('typescript: autocompletion and linting')
source=("https://registry.npmjs.org/$_npmname/-/${_npmname##*/}-$pkgver.tgz")
noextract=("${_npmname##*/}-$pkgver.tgz")
sha256sums=('e91781c018a3c01de460ff1a63e6151487d0fe25b670e234280aebcbcc57ebb4')

build() {
    # Due to npm permission issues, install in build and copy files in package.
    # related bug report: https://bugs.archlinux.org/task/63396
    npm install -g --prefix "${srcdir}"/usr "${_npmname##*/}-$pkgver.tgz"
}

package() {
    cp -R usr "${pkgdir}"
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    chmod -R u=rwX,go=rX "${pkgdir}"

    # Rename command because clasp from [community] has /usr/bin/clasp
    mv "${pkgdir}"/usr/bin/{,g}clasp
}
