# Maintainer: Daniel Maslowski <info@orangecms.org>
pkgname=fisherman-git
_gitname=fisherman
pkgver=1.3.1.r14.g2b43beb
pkgrel=1
pkgdesc="A blazing fast, modern plugin manager for fish"
arch=('any')
url="http://fisherman.sh/"
license=('MIT')
depends=('fish')
optdepends=()
makedepends=('git')
install=fisherman-git.install
source=("git+https://github.com/fisherman/fisherman.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_gitname}"
  sharepath="${pkgdir}/usr/share"
  fishpath="${sharepath}/fish"
  # completions
  install -Dt "${fishpath}/completions" completions/*
  # fish_config already exists in the global installation
  rm functions/fish_config.fish
  # not needed because man pages are installed globally (see below)
  rm functions/man.fish
  # functions
  install -Dt "${fishpath}/functions" functions/*
  # remove $fisher_home because we're installing to fish's global dir
  sed -i "s/,\$fisher_home//g" config.fish
  install config.fish "${fishpath}/config-${_gitname}.fish"
  # man pages, README and LICENSE
  install -Dt "${sharepath}/man/man1" man/man1/*
  install -Dm 644 LICENSE "${sharepath}/licenses/${_gitname}/LICENSE"
  install -Dm 644 README.md "${sharepath}/doc/${_gitname}/README"
}
