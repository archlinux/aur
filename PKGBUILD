# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

# PKGBUILD forked from https://aur.archlinux.org/packages/ninja-git by:
# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
pkgname=ninja-noemacs-git
epoch=2
pkgver=1.13.2.r31.g4b72b15a
pkgrel=1
pkgdesc='Small build system with a focus on speed - now without emacs!! ~ designed specially for dogmatic devops, overzealous vimmers, FSF expatriates, fanatically frugal sysadmins, and the like.'
arch=(x86_64)
url='https://ninja-build.org/'
license=(Apache)
depends=(gcc-libs)
makedepends=(git cmake python re2c)
provides=(ninja)
conflicts=(ninja)
source=('git+https://github.com/ninja-build/ninja.git')
md5sums=('SKIP')

pkgver() {
  cd ninja
  #
  # This is a somewhat unconventional use of git to derive a reasonable version.
  # We need this because ninja does not merge releases back into master.
  #
  local tag revs abbrev
  tag="$(git describe --tags --abbrev=0 origin/release)"
  revs="$(git rev-list --count "$tag..")"
  abbrev="$(git rev-parse --short HEAD)"
  # reconstruct pkgver()ized git-describe output by hand
  echo "${tag#v}.r${revs}.g${abbrev}"
}

build() {
  cmake \
    -S ninja -GNinja\
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  cd build
  ./ninja_test
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "$srcdir/build"
  install -Dm755 -t "$pkgdir/usr/bin" ninja

  cd "$srcdir/ninja"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
  install -Dm644 -t "$pkgdir/usr/share/doc/ninja" doc/manual.asciidoc

  install -Dm644 -t "$pkgdir/usr/share/vim/vimfiles/syntax" misc/ninja.vim
  install -Dm644 -t "$pkgdir/$site_packages" misc/ninja_syntax.py

  install -Dm644 misc/bash-completion "$pkgdir/usr/share/bash-completion/completions/ninja"
  install -Dm644 misc/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_ninja"
}
