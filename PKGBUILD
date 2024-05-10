# Maintainer : Michael Herstine <sp1ff at pobox dot com>
pkgname=mpdpopm-git
pkgver=0.3.3
pkgrel=1
pkgdesc='Maintain ratings & playcounts for your mpd server (git version)'
arch=('x86_64')
url=https://github.com/sp1ff/mpdpopm
license=('GPL-3.0-or-later')
depends=("gcc-libs" "glibc")
makedepends=("base-devel" "cargo" "git" "texinfo")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/sp1ff/mpdpopm.git")
sha256sums=('SKIP')

pkgver() {
    # Cribbed from the `ripgrep-git` package; mpdpopm is tagged in the same
    # format, so I *think* this is what `makepkg` wants...
    cd mpdpopm
    local tag=$(git tag --sort=-v:refname | grep '^[0-9]' | head -1)
    local commits_since=$(git rev-list $tag..HEAD --count)
    echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

build() {
  cd mpdpopm
  ./bootstrap && ./configure --prefix=/usr
  make
}

check() {
  cd mpdpopm
  make check
}

package() {
  cd mpdpopm
  make DESTDIR="${pkgdir}/" install
}

