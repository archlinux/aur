# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

#   ##=================================================================##
#    )                                                                  )
#   (     If you would like to participate in the Nordix project.      (
#    )                    you are most welcome                          )
#   (                               *                                  (
#    )                        Nordix project                            )
#   (           https://github.com/jimmykallhagen/Nordix               (
#    )          https://github.com/jimmykallhagen/Yggdrasil             )
#   (           https://gitlab.com/TheEnchantedPotato/nordix           (
#    )                                                                  )
#   ##=================================================================##

pkgname=nx-markview
pkgver=0.1.0.r4.g95ac4d2
pkgrel=1
pkgdesc="A simple local Markdown reader with basic HTML support. To view Nordix or other project documentation"
arch=('x86_64' 'aarch64')
url="https://github.com/jimmykallhagen/nx-markview.git"
license=('GPL v3 or later')
provides=('nx-markview')


depends=(
  'gtk3'
'webkit2gtk-4.1'
  'glib2'
  'gcc-libs'
  'openssl'
  'libsoup3'
)
makedepends=(
  'cargo'
  'rust'
  'cargo-tauri'
  'nodejs'
  'npm'
  'base-devel'
  'clang'
  'gtk3'
'webkit2gtk-4.1'
)

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_pkgsrc="$pkgname"
source=("$_pkgsrc::git+$url")
sha256sums=('SKIP')

export CC=clang
export CXX=clang++

build() {
  npm install
# TODO: Clang linking not working completely - GCC still visible in .comment
# Try RUSTFLAGS="-C linker=clang -C link-arg=-fuse-ld=lld"
# But readelf still shows GCC references from system startup files
# Help with getting clean Clang linking appreciated!
# rustflags is spec in  src-tauri/.cargo/config.toml to, but i still pick gcc
       export CC=clang
       export CXX=clang++
       export RUSTFLAGS="-C linker=clang \
                    -C link-arg=-fuse-ld=lld \
                    -C link-arg=--rtlib=compiler-rt \
                    -C link-arg=--unwindlib=libunwind \
                    -C link-arg=-nostdlib++ \
                    -C link-arg=-lc++"
       export LD=clang
       export AR=llvm-ar
  cargo tauri build --no-bundle
}

 package() {


    cd "$srcdir/$_pkgsrc"

    install -Dm755 "src-tauri/target/release/nx-markview" \
        "$pkgdir/usr/bin/nx-markview"

    install -Dm644 "src-tauri/icons/32x32.png" \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/nx-markview.png"
    install -Dm644 "src-tauri/icons/128x128.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/nx-markview.png"
    install -Dm644 "src-tauri/icons/256x256.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/nx-markview.png"
    mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128@2/apps/"
    install -m644 "src-tauri/icons/128x128@2.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128@2/apps/nx-markview.png"
        install -Dm644 "nx-markview.desktop" \
            "$pkgdir/usr/share/applications/nx-markview.desktop"

}
