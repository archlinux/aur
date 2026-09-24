# Maintainer: VanillaGreen <ai1@vanillagreen.com>
pkgname=kendex-cli-git
# kendex 1.0.0 follows 5.0.1, so the version number goes backwards. pacman
# compares versions, and without an epoch it reads 1.0.0 as older than the
# 5.x a machine already holds and refuses the upgrade. Every kendex package
# carries the same epoch so the four stay comparable with each other.
epoch=1
pkgver=r0.0000000
pkgrel=1
pkgdesc='Package manager for AI coding agents, skills, and hooks (CLI only, latest commit)'
arch=('x86_64' 'aarch64')
url='https://kendex.ai'
license=('MIT')
# The other three install the same `kendex` command and cannot be
# co-installed with this one. This package does not provide `kendex`: that
# name is the package that installs the desktop app and the command
# together, and a dependency on it would be mis-satisfied by the command
# alone. No `replaces`: a `replaces` on kendex-git would take the desktop
# app away from everyone who installed that package, during an ordinary
# system upgrade and without asking.
conflicts=('kendex' 'kendex-git' 'kendex-bin')
# git is a runtime as well as a build need, and they are different needs:
# the build clones with it, and the installed program materializes a catalog
# with it. 2.41 is the first that takes `--attr-source`, below which every
# install of a package from a git repository is refused.
#
# dbus is both needs too: the command links libdbus-1 directly through the
# keyring crate sync-secret-service backend, and the libdbus-sys build
# probes dbus-1.pc with pkg-config and panics when it is absent. Arch ships
# the shared library, the headers and dbus-1.pc in one package.
#
# Nothing beyond those two: this package builds and installs the command
# alone, so none of the webkit2gtk, gtk3, icon-theme or freedesktop-tool
# dependencies the three desktop packages carry belong here.
depends=('git>=2.41' 'dbus')
makedepends=('cargo' 'git')
# makepkg LTO makes ring's C objects fail to link with rust-lld.
options=('!lto')
source=('git+https://github.com/vanillagreencom/kendex.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kendex"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/kendex"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/kendex"
  export RUSTUP_TOOLCHAIN=stable
  # The CLI package alone. Building the workspace would pull the app in and
  # with it every desktop library this package deliberately does not depend
  # on.
  cargo build --release --locked -p kendex-cli
}

package() {
  cd "$srcdir/kendex"
  install -Dm755 target/release/kendex "$pkgdir/usr/bin/kendex"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
