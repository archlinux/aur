# Maintainer: Teejer <teej.d.man@gmail.com>
# Builds Muxflow from the Teejer/muxflow fork, which carries the fork's own
# work (the AI assistant panel, the desktop workspace restore, the host-side
# workspace restore) on top of upstream gal064/muxflow. Point _gitroot at
# gal064/muxflow for the upstream-only build.
#
# Difference from the release tarballs: upstream ships the host helper built
# in a Debian 12 container so old SSH hosts accept it; this package builds it
# natively. Local use is unaffected; a very old glibc remote host may refuse
# the uploaded helper.
_pkgname=muxflow
pkgname=muxflow-teejer-git
pkgver=0.1.39.r2221.gba075f5d
pkgrel=1
pkgdesc='Graphical IDE for local and remote tmux sessions (Teejer fork, source build)'
url='https://github.com/Teejer/muxflow'
license=('MIT')
arch=('x86_64' 'aarch64')
makedepends=('cargo' 'git')
depends=('alsa-lib' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11')
provides=('muxflow')
conflicts=('muxflow')
options=('!lto' '!debug') # the repo's own Cargo profile controls LTO
_gitroot='https://github.com/Teejer/muxflow'
_gitbranch='master'
source=("${_pkgname}::git+${_gitroot}#branch=${_gitbranch}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # The version the app itself reports, plus the git position: 0.1.39.r624.gcabc198a.
  # (Upstream's history rewrite leaves their newer tags unreachable from the
  # merged master, so git describe would name the stale v0.1.38.)
  local version
  version=$(sed -n 's/^version = "\(.*\)"$/\1/p' apps/desktop-gpui/Cargo.toml | head -n1)
  printf '%s.r%s.g%s\n' "${version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
}

build() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR="${srcdir}/cargo-target"
  # The release build fixes ahash's compile-time RNG constants so builds
  # agree; do the same.
  export CONST_RANDOM_SEED=muxflow-release
  cargo build --locked --release -p muxflow-gpui -p muxflow-host
}

check() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR="${srcdir}/cargo-target"
  cargo test --locked -p muxflow-gpui -p muxflow-host -p desktop-core
}

package() {
  cd "${_pkgname}"
  local target="${srcdir}/cargo-target"

  # The desktop finds its host helper as a sibling named `muxflow-host`, and
  # the sidecar it uploads to a remote host of the same platform as a sibling
  # named `muxflow-host-<os>-<arch>`, so everything lives beside it in /usr/bin.
  install -Dm755 "${target}/release/muxflow-gpui" "${pkgdir}/usr/bin/muxflow"
  install -Dm755 "${target}/release/muxflow-host" "${pkgdir}/usr/bin/muxflow-host"
  ln -s muxflow-host "${pkgdir}/usr/bin/muxflow-host-linux-${CARCH}"

  install -Dm644 apps/desktop-gpui/assets/icons/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/muxflow.png"
  install -d "${pkgdir}/usr/share/applications"
  sed -e 's|@EXEC@|muxflow|' -e 's|@ICON@|muxflow|' \
    release/linux/muxflow.desktop.in \
    > "${pkgdir}/usr/share/applications/muxflow.desktop"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
