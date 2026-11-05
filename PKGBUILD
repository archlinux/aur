# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
#
# vtium built from the tip of a git branch: GitHub's main by default, as two
# packages, the console and its terminfo entry (ADR-1500 D3).
# VTIUM_GIT_URL and VTIUM_GIT_BRANCH point the build at another repository
# and branch, such as a local checkout. The console is built for an
# ordinary desktop or laptop, with the features images logind gpu and
# hwaccel off (ADR-1500 D8), and VTIUM_FEATURES names other features (below):
#
#   VTIUM_GIT_URL=file:///path/to/vtium VTIUM_GIT_BRANCH=my-branch makepkg -f
#
# .SRCINFO is made with none of them set, so it always names GitHub's main.
# The source is not checked against a signature: main's tip is a merge
# commit that GitHub signs with its own key.

pkgbase=vtium-git
pkgname=('vtium-git' 'vtium-terminfo-git')
pkgver=r1866.16e66a2
pkgrel=1
pkgdesc='Terminal for the Linux console, drawn through KMS/DRM (git main)'
arch=('x86_64')
url='https://github.com/vtium/vtium'
license=('MIT')
makedepends=('cargo' 'git' 'ncurses' 'libxkbcommon' 'systemd-libs')
options=('!debug')
source=("vtium::git+${VTIUM_GIT_URL:-https://github.com/vtium/vtium.git}#branch=${VTIUM_GIT_BRANCH:-main}"
        'terminus.vtfrit')
sha256sums=('SKIP'
            '600bace75f6fa5e109d29368e4b3872218e9d9e2eb53f0a795e74b68e9c39989')

pkgver() {
  cd vtium
  # The last version tag, with the hyphen before a pre-release dropped
  # (v0.1.0-alpha.1 is 0.1.0alpha.1, as the vtium package names it), then
  # .r<commits since>.g<hash>. Before vtium has a tag, r<commits>.<hash>.
  if git describe --long --tags --match 'v[0-9]*' --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --match 'v[0-9]*' --abbrev=7 |
      sed 's/^v//;s/^\([0-9.]*\)-\([a-z]\)/\1\2/;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

package_vtium-git() {
  depends=('bash' 'glibc' 'libgcc' 'libglvnd' 'libxkbcommon' 'mesa' 'systemd-libs'
           'vtium-terminfo-git')
  optdepends=('vtium-fonts: the fonts the shipped frits name'
              'kbd: console fonts, which vtium draws when no frit is set'
              'kmscon-terminfo: the terminfo entry kmscon, for sessions run with term=kmscon')
  # provides vtium at this build's version, so a package that depends on
  # vtium, or on a version of it, is met by this one; conflicts with vtium,
  # which every other console package provides, so a machine holds one
  # console package at a time.
  provides=("vtium=$pkgver")
  conflicts=('vtium')
  # The frits _make names in FRITS, and the Terminus frit, which keep a
  # user's edits across an upgrade (ADR-1500 D8).
  backup=('etc/vtium/fonts/desktop.vtfrit'
          'etc/vtium/fonts/minspec-16.vtfrit'
          'etc/vtium/fonts/minspec-8.vtfrit'
          'etc/vtium/fonts/terminus.vtfrit')
  install=vtium-git.install
  _package_console
  # The Terminus frit names the console font by the file name Arch's
  # terminus-font gives it, so this repository carries it, not vtium's tree.
  install -Dm644 "$srcdir/terminus.vtfrit" "$pkgdir/etc/vtium/fonts/terminus.vtfrit"
}

package_vtium-terminfo-git() {
  arch=('any')
  pkgdesc='The terminfo entry xterm-vtium, for sessions in vtium (git main)'
  provides=("vtium-terminfo=$pkgver")
  conflicts=('vtium-terminfo')
  _package_terminfo
}

# Everything below is the same in vtium-git/PKGBUILD and vtium/PKGBUILD;
# aur-publish refuses a package whose copy differs from the other's.

prepare() {
  cd vtium
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

# vtium's Makefile builds and stages every file the packages ship, so which
# file goes where lives in vtium's tree (ADR-1500 D1, D3). Each call names
# the same build, so make install in package() finds the build that build()
# made, and builds nothing again:
#
#   - PREFIX=/usr, so the console starts its glyph helper at
#     /usr/bin/vtium-config and its image helper at /usr/bin/vtium-image.
#   - FEATURES, the console's features: images logind gpu, the build for an
#     ordinary desktop or laptop (ADR-1500 D2, D8), while VTIUM_FEATURES is
#     unset in makepkg's environment. VTIUM_FEATURES names other features,
#     such as VTIUM_FEATURES='images logind', and set but empty, as in
#     VTIUM_FEATURES= makepkg, it names none, so the console is the minspec
#     build. Whatever it names, the package's dependencies and the two
#     settings below stay those of the default build.
#   - HWACCEL=off and DISPLAY_BUFFERS=3, the defaults the console and
#     vtium-config read for hwaccel and display-buffers (ADR-1500 D8). The
#     console draws on the CPU until hwaccel = on in /etc/vtium/vtium.conf
#     turns the GPU path on, and keeps three buffers for each display.
#   - FRITS, the frits make install stages into /etc/vtium/fonts, which each
#     console package's backup list names.
#   - --frozen, because prepare() fetched the crates.
_make() {
  CARGO_TARGET_DIR=target make -C "$srcdir/vtium" PREFIX=/usr \
    FEATURES="${VTIUM_FEATURES-images logind gpu}" HWACCEL=off \
    DISPLAY_BUFFERS=3 FRITS='desktop minspec-16 minspec-8' \
    CARGO_BUILD_FLAGS=--frozen "$@"
}

# The console, built with vtium's minspec profile, its glyph helper and,
# with images, its image helper.
build() {
  _make install-build
}

# The console, its helper, its units vtium@.service and vtium-getty@.service,
# the example configuration /etc/vtium/vtium.conf.example, the frits in
# /etc/vtium/fonts, the example udev rules and hwdb fragment, the head
# file's template, and the license. With images, also the image helper
# /usr/bin/vtium-image, the sysusers file that creates its account, and the
# picture gallery tool /usr/bin/vtium-gallery, a bash script.
_package_console() {
  _make install DESTDIR="$pkgdir" PKGNAME="$pkgname"
}

# vtium's terminfo entry, compiled under its name xterm-vtium, and the
# license (ADR-1500 D3). No package ships an entry named kmscon: the
# kmscon-terminfo package keeps that name.
_package_terminfo() {
  _make install-terminfo DESTDIR="$pkgdir" PKGNAME="$pkgname"
}
