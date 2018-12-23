#Maintainer: Alexander Adler <alexadler1@protonmail.com>
#Contributor: Yan Burdonsky <psyrccio@gmail.com>
_pkgname=anoise
pkgname=${_pkgname}-bzr
pkgver=0.0.29+56
pkgrel=1
pkgdesc="Ambient Noise Player. Relax or concentrate with a noise"
arch=('any')
license=('GPL3')
url="https://code.launchpad.net/anoise"
makedeps=('bzr' 'python-distutils-extra')
depends=('anoise-media' 'python-gobject' 'gst-plugins-good' 'gtk3')
optdepends=('anoise-gui: Standalone GUI for Anoise'
            'anoise-community-extension1: Additional sounds'
            'anoise-community-extension2: Additional sounds'
            'anoise-community-extension3: Additional sounds'
            'anoise-community-extension4: Additional sounds'
            'anoise-community-extension5: Additional sounds')
source=("${_pkgname}::bzr+https://code.launchpad.net/~costales/anoise/player"
        'remove_webkit.patch'
        'remove_deprecated_method.patch')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
sha256sums=('SKIP'
            '76dc57f5dbe14d6e4db4ff59a5981f2f43ed253d79c3e9fe7aea60f554956cfc'
            'e4e342754d0cc9c393a32f24d48ce34069f393b76d8475328c0588629120965b')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s+%s" \
         "$( grep 'version[\ ]*=' setup.py | sed 's:.*\=[\ ]*"\([^"]*\)".*:\1:' )" \
         "$( bzr revno )"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -uNp2 -r- -i ../remove_webkit.patch
  patch -uNp2 -r- -i ../remove_deprecated_method.patch
}  

package() {
  cd "${srcdir}/${_pkgname}"
  python ./setup.py install --prefix=/usr --root="${pkgdir}" \
  # this file is included in anoise-gui
  rm "${pkgdir}"/usr/share/anoise/anoise.ui
}
