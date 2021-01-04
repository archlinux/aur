# Maintainer: garionion <garionion@entr0py.de>

pkgname=psst-git
_pkgname="psst"
pkgver=0
pkgrel=1
pkgdesc="Fast and multi-platform Spotify client with native GUI"
arch=("x86_64")
url="https://github.com/jpochyla/psst"
license=('MIT')
makedepends=( 'rust'
              'git')
provides=("psst")
conflicts=("psst")
source=("git+https://github.com/jpochyla/psst.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	git submodule update --recursive --init
}

build() {
	cd "$_pkgname"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$_pkgname"
  cargo test --release --locked --target-dir=target
}

package() {
    # install
    install -Dm 755 ${_pkgname}/target/release/psst-gui -t "${pkgdir}/usr/bin/"
    
    # desktop entry

    install -dm 755 "${pkgdir}/usr/share/applications"
    cat > ${pkgdir}/usr/share/applications/${_pkgname}.desktop << EOF
[Desktop Entry]
Type=Application
Version=${pkgver}
Name=Psst
Comment=Fast and multi-platform Spotify client with native GUI 
Exec=psst-gui
Icon=psst-gui
Terminal=false
EOF

}
