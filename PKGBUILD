pkgname=ffplayout
pkgver=0.24.2
pkgrel=1
pkgdesc="24/7 playout based on rust and ffmpeg"
arch=('x86_64')
url="https://github.com/ffplayout/ffplayout"
license=('GPL-3.0')
depends=(
  'ffmpeg-ffplayout'
  'sudo'
)
makedepends=(
  'rustup'
  'musl'
  'nodejs-lts-hydrogen'
  'npm'
  'pandoc'
  'git'
)
provides=('ffplayout')
conflicts=('ffplayout-git' 'ffplayout-unstable-git')
replaces=('ffplayout-git' 'ffplayout-unstable-git')
backup=(etc/ffplayout/{ffplayout.toml,advanced.toml})
install='ffplayout.install'

source=(
    "ffplayout-${pkgver}::git+https://github.com/ffplayout/ffplayout.git#tag=v${pkgver}"
    'ffplayout.install'
)
sha256sums=('88e395862c355a8dc619cbce5f582a690b81debe2780e8d1e7ecc5226def2a0d'
            'eaaf8977a2b657abdc3273f024ffdd8ccfc2e462f5fdaa1535144c8ff84a813d')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"

  sed -i 's/default = \["embed_frontend"\]/default = []/' ffplayout-api/Cargo.toml

  export CARGO_HOME="$srcdir/rust-home"
  export RUSTUP_HOME="$srcdir/rust-home"
  export RUSTUP_TOOLCHAIN=stable
  rustup target add x86_64-unknown-linux-musl

  cd frontend
  npm install
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CFLAGS+=" -ffat-lto-objects"
  export CARGO_HOME="$srcdir/rust-home"
  export RUSTUP_HOME="$srcdir/rust-home"
  export RUSTUP_TOOLCHAIN=stable

  # Frontend build steps
  cd frontend
  npm run generate
  cp -vr .output/public "${srcdir}/${pkgname}-${pkgver}/public"

  # man docs
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./scripts/man_create.sh

  # Backend build step
  cargo build --locked --release --target=x86_64-unknown-linux-musl
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 target/x86_64-unknown-linux-musl/release/ffplayout "${pkgdir}/usr/bin/ffplayout"
    install -Dm644 assets/ffplayout.service "${pkgdir}/usr/lib/systemd/system/ffplayout.service"
    install -Dm644 assets/ffplayout.1.gz "${pkgdir}/usr/share/man/man1/ffplayout.1.gz"
    install -Dm644 assets/logo.png "${pkgdir}/usr/share/ffplayout/logo.png"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/ffplayout/README"
    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/ffplayout/copyright"
    cp -a public "${pkgdir}/usr/share/ffplayout/"
}
