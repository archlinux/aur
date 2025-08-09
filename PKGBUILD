# Maintainer: Chakib Benziane (blob42) <contact@blob42.xyz>

pkgname=gosuki-git
_pkgname=${pkgname%-git}
pkgver=v1.2.0.r5.g4a6d3fc
pkgrel=1
pkgdesc="Blazing fast, realtime, extension-free, multi-browser, bookmark manager"
arch=('i686' 'x86_64')
makedepends=(git git-lfs go make sqlite)
url='https://github.com/blob42/gosuki'
license=(AGPL3)
sha256sums=(SKIP)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed "s+-+.r+" | tr - .

}

prepare() {
    msg2 'Setting up repository...'
    cd "${srcdir}/${_pkgname}"
    git lfs install --local
    if ! git remote -v | grep -q 'network-origin'; then git remote add network-origin ${url}; fi
    git lfs fetch network-origin
    git lfs checkout
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  make SYSTRAY=true release
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing documentation...'
  for _doc in README.md; do
    install -Dm 644 $_doc -t "$pkgdir"/usr/share/doc/"${_pkgname}"
  done

  msg2 'Installing executables...'
  install -Dm 755 build/gosuki -t "$pkgdir"/usr/bin
  install -Dm 755 build/suki -t "$pkgdir"/usr/bin

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
