# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=mint-y-theme
pkgname=${_pkgname}-git
pkgver=50.1c1442b
pkgrel=1
pkgdesc="New theme from LinuxMint 18"
arch=('any')
url="https://github.com/linuxmint/mint-y-theme"
license=('GPL3')
depends=()
makedepends=('python' 'gnome-code-assistance' 'ruby-dbus')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}"::git+https://github.com/linuxmint/mint-y-theme.git
        sass_fix.patch)
sha256sums=('SKIP'
            '658ebe0a03fcf31c8f280d01f68892b817f25233db0832d9c27480e5fe91f29f')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd ${srcdir}

  patch -Np1 -i ./sass_fix.patch
}

package() {
  cd ${srcdir}/${_pkgname}/src
  
  python ./build-themes.py
  
  cd ..  
  cp -aR ./usr ${pkgdir}

  find "${pkgdir}"/usr/share/themes -type f -name "metacity*xml" -exec sed -i 's:normal_dialog_style_set:normal_style_set:' {} \;

}
