pkgname=ffplayout-unstable-git
pkgver=r1893.7920c35
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
provides=('ffplayout-unstable-git')
conflicts=('ffplayout' 'ffplayout-git')
backup=('etc/ffplayout/ffplayout.yml')
install='ffplayout.install'
source=(
  "${pkgname}::git+https://github.com/jb-alvarado/ffplayout.git"
  'ffplayout.install'
  'disable_embed_frontend.patch'
)
sha256sums=('SKIP'
            '91fa57deb966dd5f3f611d0a8213934f200487c64153167a1d9d6f7c9b1b85e8'
            'cdb28811b27935a97421497877691fefac208f582be6d49445824e4d0ac6d976')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname}"

  patch --forward --strip=1 --input="${srcdir}/disable_embed_frontend.patch"

  sed -i 's/default = \["embed_frontend"\]/default = []/' ffplayout-api/Cargo.toml

  export CARGO_HOME="$srcdir/rust-home"
  export RUSTUP_HOME="$srcdir/rust-home"
  export RUSTUP_TOOLCHAIN=stable
  rustup default stable
  rustup target add x86_64-unknown-linux-musl

  git submodule update --init
  git submodule update --remote --merge

  cd ffplayout-frontend
  npm install
}

build() {
  cd "${srcdir}/${pkgname}"
  export CARGO_HOME="$srcdir/rust-home"
  export RUSTUP_HOME="$srcdir/rust-home"
  export RUSTUP_TOOLCHAIN=stable

  # Frontend build steps
  cd ffplayout-frontend
  npm run generate
  cp -vr .output/public "${srcdir}/${pkgname}/public"

  cd "${srcdir}/${pkgname}"
  ./scripts/man_create.sh

  cargo build --release --target=x86_64-unknown-linux-musl
}

package() {
    cd "${srcdir}/${pkgname}"

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
}
