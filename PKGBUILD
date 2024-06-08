pkgname=ffplayout
pkgver=0.23.1
pkgrel=0
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
  'nodejs-lts-iron'
  'npm'
  'pandoc'
  'git'
)
provides=('ffplayout')
conflicts=('ffplayout-git' 'ffplayout-unstable-git')
replaces=('ffplayout-git' 'ffplayout-unstable-git')
backup=('etc/ffplayout/{ffplayout.toml,advanced.toml}' 'etc/ffplayout/channel*')
install='ffplayout.install'

source=(
    "ffplayout-${pkgver}::git+https://github.com/ffplayout/ffplayout.git#tag=v${pkgver}"
    'ffplayout.install'
)
sha256sums=('SKIP'
            '91fa57deb966dd5f3f611d0a8213934f200487c64153167a1d9d6f7c9b1b85e8')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"

  sed -i 's/default = \["embed_frontend"\]/default = []/' ffplayout-api/Cargo.toml

  export CARGO_HOME="$srcdir/rust-home"
  export RUSTUP_HOME="$srcdir/rust-home"
  export RUSTUP_TOOLCHAIN=stable
  rustup target add x86_64-unknown-linux-musl

  git submodule update --init
  git submodule update --remote --merge

  cd ffplayout-frontend
  npm install
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CFLAGS+=" -ffat-lto-objects"
  export CARGO_HOME="$srcdir/rust-home"
  export RUSTUP_HOME="$srcdir/rust-home"
  export RUSTUP_TOOLCHAIN=stable

  # Frontend build steps
  cd ffplayout-frontend
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
    install -Dm755 target/x86_64-unknown-linux-musl/release/ffpapi "${pkgdir}/usr/bin/ffpapi"
    install -Dm644 assets/ffplayout.toml "${pkgdir}/etc/ffplayout/ffplayout.toml"
    install -Dm644 assets/advanced.toml "${pkgdir}/etc/ffplayout/advanced.toml"
    install -Dm644 assets/ffpapi.service "${pkgdir}/usr/lib/systemd/system/ffpapi.service"
    install -Dm644 assets/ffplayout.service "${pkgdir}/usr/lib/systemd/system/ffplayout.service"
    install -Dm644 assets/ffplayout@.service "${pkgdir}/usr/lib/systemd/system/ffplayout@.service"
    install -Dm644 assets/11-ffplayout "${pkgdir}/etc/sudoers.d/11-ffplayout"
    install -Dm644 assets/ffpapi.1.gz "${pkgdir}/usr/share/man/man1/ffpapi.1.gz"
    install -Dm644 assets/ffplayout.1.gz "${pkgdir}/usr/share/man/man1/ffplayout.1.gz"
    install -Dm644 assets/logo.png "${pkgdir}/usr/share/ffplayout/logo.png"
    install -Dm644 assets/ffplayout.toml "${pkgdir}/usr/share/ffplayout/ffplayout.toml.orig"
    install -Dm644 assets/ffplayout.conf "${pkgdir}/usr/share/ffplayout/ffplayout.conf.example"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/ffplayout/README"
    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/ffplayout/copyright"
    cp -a public "${pkgdir}/usr/share/ffplayout/"
}
