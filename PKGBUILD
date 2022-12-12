# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=crosvm-git
pkgver=r5467.760d739c1
pkgrel=1
pkgdesc="The Chrome OS Virtual Machine Monitor"
url="https://chromium.googlesource.com/crosvm/crosvm"
depends=('gcc-libs' 'libcap' 'dtc')
makedepends=('rustup' 'rust-bindgen' 'wayland-protocols')
conflicts=('crosvm')
provides=('crosvm')
arch=('x86_64')
license=('custom:chromiumos')
source=("git+https://chromium.googlesource.com/crosvm/crosvm"
        "git+https://chromium.googlesource.com/chromiumos/third_party/tpm2"
        "git+https://chromium.googlesource.com/chromiumos/platform/minigbm"
        "git+https://chromium.googlesource.com/chromiumos/third_party/virglrenderer"
        "git+https://chromium.googlesource.com/chromiumos/platform/minijail"
        "git+https://chromium.googlesource.com/chromium/tools/depot_tools"
        "git+https://chromium.googlesource.com/chromiumos/third_party/rust-vmm/vhost"
        )
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd crosvm
  git submodule init
  git config submodule."tpm2-sys/libtpm2".url "$srcdir/tpm2"
  git config submodule."third_party/minigbm".url "$srcdir/minigbm"
  git config submodule."third_party/virglrenderer".url "$srcdir/virglrenderer"
  git config submodule."third_party/minijail".url "$srcdir/minijail"
  git config submodule."third_party/depot_tools".url "$srcdir/depot_tools"
  git config submodule."third_party/vmm_vhost".url "$srcdir/vhost"
  git -c protocol.file.allow=always submodule update

  # The in-tree minijail is too old to use, upstream crosvm builds seem to use ebuild shenanigans to patch this out of
  # the .toml and use the chromeos minijail version.  Short of pulling random ebuild repos to find their preferred
  # revision, this is the closest approximation of what upstream dev builds do.
  ( cd third_party/minijail && git checkout --detach origin/main)
}

pkgver() {
  cd crosvm
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd crosvm
  cargo build --release
}

package() {
  cd crosvm
  install -Dm755 target/release/crosvm "$pkgdir/usr/bin/crosvm"
  install -d "$pkgdir/usr/share/policy/crosvm/"
  cp -r seccomp/x86_64/* "$pkgdir/usr/share/policy/crosvm/"
  install -m644 -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D README.md "$pkgdir"/usr/share/licenses/$pkgname/README.md
}
