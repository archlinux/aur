pkgname=ffplayout
pkgver=0.20.4
pkgrel=1
pkgdesc="24/7 playout based on rust and ffmpeg"
arch=('x86_64')
url="https://github.com/ffplayout/ffplayout"
license=('GPL3')
depends=(
  'ffmpeg>=5.0'
  'sudo'
)
makedepends=(
  'rustup'
  'musl'
  'nodejs-lts-hydrogen'
  'npm'
  'pandoc'
)
provides=('ffplayout')
conflicts=('ffplayout-git')
backup=('etc/ffplayout/ffplayout.yml')
install='ffplayout.install'
source=(
  "ffplayout-${pkgver}::git+https://github.com/ffplayout/ffplayout.git#tag=v${pkgver}"
  'ffplayout.install'
)
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"

  sed -i 's/default = \["embed_frontend"\]/default = []/' ffplayout-api/Cargo.toml

  export CARGO_HOME="$srcdir/rust-home"
  export RUSTUP_HOME="$srcdir/rust-home"
  export RUSTUP_TOOLCHAIN=stable
  rustup target add x86_64-unknown-linux-musl

  git submodule update --init
  git submodule update --remote --merge
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CARGO_HOME="$srcdir/rust-home"
  export RUSTUP_HOME="$srcdir/rust-home"

  # Frontend build steps
  cd ffplayout-frontend
  npm install
  npm run generate
  cp -vr .output/public "${srcdir}/${pkgname}-${pkgver}/public"

  cd "${srcdir}/${pkgname}-${pkgver}"
  ./scripts/man_create.sh

  cargo build --release --target=x86_64-unknown-linux-musl -p ffplayout --manifest-path=ffplayout-engine/Cargo.toml
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 target/x86_64-unknown-linux-musl/release/ffplayout "${pkgdir}/usr/bin/ffplayout"
    install -Dm755 target/x86_64-unknown-linux-musl/release/ffpapi "${pkgdir}/usr/bin/ffpapi"

    install -Dm644 assets/ffplayout.yml "${pkgdir}/etc/ffplayout/ffplayout.yml"

    install -Dm644 assets/ffpapi.service "${pkgdir}/usr/lib/systemd/system/ffpapi.service"
    install -Dm644 assets/ffplayout.service "${pkgdir}/usr/lib/systemd/system/ffplayout.service"
    install -Dm644 assets/ffplayout@.service "${pkgdir}/usr/lib/systemd/system/ffplayout@.service"

    install -Dm644 assets/11-ffplayout "${pkgdir}/etc/sudoers.d/11-ffplayout"

    install -Dm644 assets/ffpapi.1.gz "${pkgdir}/usr/share/man/man1/ffpapi.1.gz"
    install -Dm644 assets/ffplayout.1.gz "${pkgdir}/usr/share/man/man1/ffplayout.1.gz"

    install -Dm644 assets/logo.png "${pkgdir}/usr/share/ffplayout/logo.png"

    install -Dm644 assets/ffplayout.yml "${pkgdir}/usr/share/ffplayout/ffplayout.yml.orig"

    install -Dm644 assets/ffplayout.conf "${pkgdir}/usr/share/ffplayout/ffplayout.conf.example"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/ffplayout/README"

    install -Dm644 LICENSE "${pkgdir}/usr/share/doc/ffplayout/copyright"

    cp -a public "${pkgdir}/usr/share/ffplayout/"
    # cp -a public "${pkgdir}/usr/share/${pkgname}/public"
}
