# Maintainer: Arne Beer <public@arne.beer>

pkgname=pueue-git
pkgver=3.4.1.r56.gafcd28d
pkgrel=1
arch=('any')
pkgdesc='A task manager and scheduler for shell commands'
license=('MIT')
options=('!lto')
makedepends=('git' 'cargo')
conflicts=('pueue')
provides=('pueue')
url='https://github.com/Nukesor/pueue'
source=("$pkgname"::"git+https://github.com/Nukesor/pueue.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  version=$(git describe --long --tags --abbrev=7 | sed -r 's/([^-]*-g)/r\1/;s/-/./g')
  # Strip the `v` from the created version tag
  echo ${version:1}
}

build() {
    cd $pkgname

    # Build the daemon and client
    cargo build --release --locked

    mkdir -p ./utils/completions
    ./target/release/pueue completions bash ./utils/completions
    ./target/release/pueue completions fish ./utils/completions
    ./target/release/pueue completions zsh ./utils/completions
}

package() {
    cd $pkgname

    # Install binaries
    install -Dm755 "target/release/pueue" "${pkgdir}/usr/bin/pueue"
    install -Dm755 "target/release/pueued" "${pkgdir}/usr/bin/pueued"

    # Place systemd user service
    install -Dm644 "utils/pueued.service" "${pkgdir}/usr/lib/systemd/user/pueued.service"

    # Install zsh completions file
    install -Dm644 "utils/completions/_pueue" "${pkgdir}/usr/share/zsh/site-functions/_pueue"
    install -Dm644 "utils/completions/pueue.bash" "${pkgdir}/usr/share/bash-completion/completions/pueue.bash"
    install -Dm644 "utils/completions/pueue.fish" "${pkgdir}/usr/share/fish/completions/pueue.fish"

    # Install License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/pueue/LICENSE"
}
