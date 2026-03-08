# Maintainer: Victrid <weihau.chiang@gmail.com>
# Derived from shared-mime-info package, original maintainers:
# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>


pkgname=shared-mime-info-git
_pkgname=shared-mime-info
pkgver=2.4.r165.g7069fec
pkgrel=1
pkgdesc="Freedesktop.org Shared MIME Info"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('libxml2' 'glib2' 'glibc' 'libstdc++' 'libgcc')
makedepends=('gettext' 'xmlto' 'docbook-xsl' 'git' 'meson')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
install=shared-mime-info.install
# https://gitlab.freedesktop.org/xdg/shared-mime-info
url="https://www.freedesktop.org/wiki/Specifications/shared-mime-info-spec/"
source=("git+https://gitlab.freedesktop.org/xdg/shared-mime-info.git"
        # to run the testsuite
        "git+https://gitlab.freedesktop.org/xdg/xdgmime.git"
        update-mime-database.hook)
sha256sums=('SKIP'
            'SKIP'
            'f08efbcbac9d2bd18a805b8dcf3ed06d7763b97eca5935aa64d65593774b6501')
options=(!makeflags)

pkgver() {
  cd ${_pkgname}
  # Prepare will create a dummy commit to fix git submodules, so we describe the origin master's commit.
  git describe --long --tags --abbrev=7 origin/master | sed 's/^Release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # xdgmime is now a submodule
  # https://wiki.archlinux.org/title/VCS_package_guidelines#Git_submodules
  cd ${_pkgname}

  # Create a fake commit with the submodule reference
  # Get the current xdgmime commit hash
  local xdgmime_commit=$(cd "$srcdir/xdgmime" && git rev-parse HEAD)

  # Configure git user for the fake commit (required by git commit)
  git config --local user.email "dummy@localhost"
  git config --local user.name "Dummy User"

  # Add the submodule as a gitlink (mode 160000)
  git update-index --add --cacheinfo 160000 "$xdgmime_commit" subprojects/xdgmime

  # Commit the change so meson can find the submodule
  git commit -m "Update xdgmime submodule index" --allow-empty

  # Now init and update will work
  git submodule init
  git config submodule.subprojects/xdgmime.url "file://$srcdir/xdgmime"
  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
  arch-meson shared-mime-info build \
    -D update-mimedb=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  # use a prefix to run it early enough - other hooks may depend on it - FS#72858
  install -Dm644 "$srcdir"/update-mime-database.hook "$pkgdir"/usr/share/libalpm/hooks/30-update-mime-database.hook
}
