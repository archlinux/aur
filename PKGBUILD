# Maintainer: Samim Pezeshki (psamim) <psamim@gmail.com>

_pkgname=kindle2anki
pkgname=${_pkgname}-git
pkgver=r9.181d533
pkgrel=1
pkgdesc='Add words from Kindle to Anki'
url='https://github.com/psamim/kindle2anki'
license=('GPL3')
source=('git+https://github.com/psamim/kindle2anki.git'
        'git+https://github.com/dae/anki.git'
        'kindle2anki.sh')
sha256sums=('SKIP'
            'SKIP'
            '4fd11d9c95ff8f8c044a98248bc114cdcb7ee65ba10d2881a036fc419a677d68')
arch=('any')
depends=('python'
         'python-colorama'
         'python-pyaudio'
         'python-retrying')
makedepends=('git')
conflicts=('kindle2anki')
provides=('kindle2anki')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git config submodule.anki.url $srcdir/anki
  git submodule update
}

package() {
  install  -d "${pkgdir}/usr/share/${_pkgname}"
  cp -ar "${srcdir}/${_pkgname}/." "${pkgdir}/usr/share/${_pkgname}"
  install -Dm755 "${srcdir}/kindle2anki.sh" "${pkgdir}/usr/bin/kindle2anki"
}
