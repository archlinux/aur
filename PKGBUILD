pkgname=ffplayout-unstable-git
pkgver=r2098.9714c5d
pkgrel=0
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
  #"${pkgname}::git+https://github.com/jb-alvarado/ffplayout.git"
  "${pkgname}::git+https://github.com/jb-alvarado/ffplayout.git#branch=single-app"
  'ffplayout.install'
)
sha256sums=('SKIP'
            'bf7e36309308fb1578b123f0f219acd7d821d17620b495d6c0d996cb0991d360')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname}"

  sed -i 's/default = \["embed_frontend"\]/default = []/' ffplayout/Cargo.toml
  sed -i 's|ExecStart=/usr/bin/ffplayout|ExecStart=/usr/bin/ffplayout -l 0.0.0.0:8787|' assets/ffplayout.service

  export CARGO_HOME="$srcdir/rust-home"
  export RUSTUP_HOME="$srcdir/rust-home"
  export RUSTUP_TOOLCHAIN=stable
  rustup target add x86_64-unknown-linux-musl

  git clone "https://github.com/ffplayout/ffplayout-frontend.git" "frontend"

  cd frontend

  git checkout "e8532ba8d095ae83886df39ba53e9595b124f9c0"

  # git submodule update --init
  # git submodule update --remote --merge
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
  sed -i '/ffplayout\/README\.md/d' scripts/man_create.sh
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
