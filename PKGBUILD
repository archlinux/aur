# Maintainer: raininja < dandenkijin at gmail dot com>
# Contributor: Andy Russell <arussell123@gmail.com>

pkgname=fm-relm4-git
_pkgname=fm
pkgver=0.gf1da116f
pkgrel=1
makedepends=('git' 'rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A small, general-purpose file manager."
url="https://github.com/euclio/fm"
license=('MIT')
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --all --long --tags --abbrev=8 | sed 's/-/./g;s/heads\/master//;s/.//'
}

prepare() {
  cd ${_pkgname}
  # Tuning cargo
  export CARGO_HOME=${srcdir}/${_pkgname}/.cargo    # Download all to src directory, not in ~/.cargo
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

#build() {
#  cd ${_pkgname}
#  export RUSTUP_TOOLCHAIN=stable
#  export CARGO_TARGET_DIR=target
#  cargo build --frozen --release --all-features
#}

build() {
  cd ${_pkgname}

  # Tuning rust compiler
  export RUSTFLAGS="--remap-path-prefix=${srcdir}=/"    # Prevent warning: 'Package contains reference to $srcdir'
  [[ -n ${_sccache} ]] && export RUSTC_WRAPPER=sccache  # If $_sccache not empty, build using binary cache
  export RUSTUP_TOOLCHAIN=stable
  # Tuning cargo
  export CARGO_HOME=${srcdir}/${_pkgname}/.cargo    # Use downloaded earlier from src directory, not from ~/.cargo
  export CARGO_TARGET_DIR=target                        # Place the output in target relative to the current directory

  cargo build --frozen --release --all-features
}

check() {
  cd ${_pkgname}
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd ${_pkgname}
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
