pkgname=ffplayout-unstable-git
pkgver=r2178.464c88d
pkgrel=1
pkgdesc="24/7 playout based on rust and ffmpeg"
arch=('x86_64')
url="https://github.com/jb-alvarado/ffplayout"
license=('GPL-3.0')
depends=(
  'ffmpeg-ffplayout'
  'sudo'
)
makedepends=(
  'rustup'
  'musl'
  'nodejs-lts-iron'
  'npm'
  'pandoc'
  'git'
)
provides=('ffplayout')
conflicts=('ffplayout' 'ffplayout-git')
replaces=('ffplayout' 'ffplayout-git')
install='ffplayout.install'

source=(
  "${pkgname}::git+https://github.com/jb-alvarado/ffplayout.git"
  'ffplayout.install'
)
sha256sums=('SKIP'
            'c12bc4dae912182b2216f38d9c05b2ecf929f8ff6fcc77c55874523eca7d19b5')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname}"

  sed -i 's/default = \["embed_frontend"\]/default = []/' ffplayout/Cargo.toml
  
  export CARGO_HOME="$srcdir/rust-home"
  export RUSTUP_HOME="$srcdir/rust-home"
  export RUSTUP_TOOLCHAIN=stable
  rustup target add x86_64-unknown-linux-musl

  git submodule update --init
  git submodule update --remote --merge

  cd frontend
  npm install
}

build() {
  cd "${srcdir}/${pkgname}"
  CFLAGS+=" -ffat-lto-objects"
  export CARGO_HOME="$srcdir/rust-home"
  export RUSTUP_HOME="$srcdir/rust-home"
  export RUSTUP_TOOLCHAIN=stable

  # Frontend build steps
  cd frontend
  npm run generate
  cp -vr .output/public "${srcdir}/${pkgname}/public"

  # man docs
  cd "${srcdir}/${pkgname}"
  ./scripts/man_create.sh

  # Backend build step
  cargo build --locked --release --target=x86_64-unknown-linux-musl
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 target/x86_64-unknown-linux-musl/release/ffplayout "${pkgdir}/usr/bin/ffplayout"
    install -Dm644 assets/ffplayout.service "${pkgdir}/usr/lib/systemd/system/ffplayout.service"
    install -Dm644 assets/ffplayout.1.gz "${pkgdir}/usr/share/man/man1/ffplayout.1.gz"
    install -Dm644 assets/logo.png "${pkgdir}/usr/share/ffplayout/logo.png"
    install -Dm644 assets/ffplayout.conf "${pkgdir}/usr/share/ffplayout/ffplayout.conf.example"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/ffplayout/README"
    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/ffplayout/copyright"
    cp -a public "${pkgdir}/usr/share/ffplayout/"
}
