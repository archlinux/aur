# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
#
# vtium's console built from a release tag (ADR-1500 D3). Its terminfo
# entry comes from the vtium-terminfo package, which a recipe of its own
# builds (ADR-1500 D8). The maintainer signs the tag with the PGP key in
# validpgpkeys, and makepkg checks the tag's signature before it builds.
# Import the key once: gpg --import keys/pgp/*.asc, or
# gpg --recv-keys 33F9B54FD2A4B6A4110749B3BA464FC9847A832A.
# The console is built for an ordinary desktop or laptop, with the features
# images logind gpu and hwaccel off (ADR-1500 D8), and VTIUM_FEATURES in
# makepkg's environment names other features (below).
#
# pkgver is the tag without its v and without the hyphen before a
# pre-release: v0.1.0-alpha.1 is 0.1.0alpha.1, which pacman sorts before
# 0.1.0 (vercmp).

pkgbase=vtium
pkgname=('vtium')
_tag=v0.1.0-alpha.5
pkgver=0.1.0alpha.5
pkgrel=1
pkgdesc='Terminal for the Linux console, drawn through KMS/DRM'
arch=('x86_64')
url='https://github.com/vtium/vtium'
license=('MIT')
makedepends=('cargo' 'git' 'libxkbcommon' 'systemd-libs')
options=('!debug')
source=("vtium::git+https://github.com/vtium/vtium.git#tag=${_tag}?signed")
sha256sums=('SKIP')
validpgpkeys=('33F9B54FD2A4B6A4110749B3BA464FC9847A832A') # Aaron Bockelie <aaronsb@gmail.com>

package_vtium() {
  depends=('bash' 'glibc' 'libgcc' 'libglvnd' 'libxkbcommon' 'mesa' 'systemd-libs'
           'vtium-terminfo')
  optdepends=('kbd: console fonts, which vtium draws when no frit is set'
              'kmscon-terminfo: the terminfo entry kmscon, for sessions run with term=kmscon')
  # The other console packages, so a machine holds one at a time. Each of
  # them provides vtium, so a package that depends on vtium is met by any.
  conflicts=('vtium-git' 'vtium-minspec' 'vtium-minspec-git'
             'vtium-minspec-gpu' 'vtium-minspec-gpu-git')
  # The frits _make names in FRITS, which keep a user's edits across an
  # upgrade (ADR-1500 D8).
  backup=('etc/vtium/fonts/desktop.vtfrit'
          'etc/vtium/fonts/minspec-16.vtfrit'
          'etc/vtium/fonts/minspec-8.vtfrit')
  install=vtium.install
  _package_console
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
