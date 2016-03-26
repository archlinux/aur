# Maintainer: Daniel Maslowski <info@orangecms.org>
pkgname=fisherman-git
_gitname=fisherman
pkgver=1.3.1.r19.g88b0e6e
pkgrel=2
pkgdesc="A blazing fast, modern plugin manager for fish"
arch=('any')
url="http://fisherman.sh/"
license=('MIT')
depends=('fish' 'git')
optdepends=()
makedepends=('git')
install=fisherman-git.install
source=(
  "git+https://github.com/fisherman/fisherman.git"
  "config-fisherman.fish"
)
sha512sums=('SKIP'
            '636c02e01c16f4aa435dccd843a994cefde5e3a751bbd4f7e01786b0ce1b8d49399788c0c69158c1a376a0ceaba852b52fa2541b7ef6d257fa2b49e182396cb5')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  sharepath="${pkgdir}/usr/share"
  fishpath="${sharepath}/fish"
  fisherpath="${sharepath}/fisherman"
  # config for sourcing Fisherman from the user's fish config
  install -Dm 644 config-fisherman.fish "${fishpath}/config-fisherman.fish"
  cd "${_gitname}"
  # completions
  install -Dt "${fisherpath}/completions" completions/*
  # not needed because man pages are installed globally (see below)
  rm functions/man.fish
  # functions
  install -Dt "${fisherpath}/functions" functions/*
  # this will be included from the config-fisherman.fish ;)
  install config.fish "${fisherpath}/config.fish"
  # man pages, README and LICENSE
  install -Dt "${sharepath}/man/man1" man/man1/*
  install -Dm 644 LICENSE "${sharepath}/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${sharepath}/doc/${pkgname}/README"
}
