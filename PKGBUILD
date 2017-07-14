##
# Maintainer: psamim <psamim(at)gmail(dot)com>
##

_gitname=spotify-dl
pkgname=spotify-dl-git
pkgdesc="Script that allows you to download Spotify songs or playlists from Youtube"
pkgver=r9.97bdc5c
pkgrel=1
arch=('any')
makedepends=('git')
depends=('python2-beautifulsoup4' 'youtube-dl')
optdepends=()
provides=('spotify-dl')
conflicts=('spotify-dl')
license=('GPL3')
url="https://github.com/invicnaper/spotify-dl"

##
# The SHA256 is constantly changing since this is
# pulled from git so skip the verification check
##
source=("${_gitname}::git+${url}#branch=master" "01-change-hashbang.patch")
sha256sums=('SKIP'
            '34b8600fd2c39707ab481373e9feee8a7f0acd3ac06cad64966224fe276f44c4')

pkgver() {
  # shellcheck disable=SC2154
  cd "$srcdir/$_gitname" || {
        msg "Could not cd into $srcdir/$_gitname"
        return 1
  }
  # From
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
  # If there are no tags then use number of revisions since beginning of the history:
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname" || {
        msg "Could not cd into $srcdir/$_gitname"
        return 1
  }

  # Apply patches
  patch -p 1 -i "${srcdir}/01-change-hashbang.patch"
}

package() {
  cd "$srcdir/$_gitname" || {
        msg "Could not cd into $srcdir/$_gitname"
        return 1
  }

  install -Dm 755 "spotify-dl.py" "${pkgdir}/usr/bin/${_gitname}"
  install -Dm 644 "GPLv3.txt" "${pkgdir}/usr/share/doc/${_gitname}/LICENSE"
  install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${_gitname}/README"
}

