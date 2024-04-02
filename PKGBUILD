# Maintainer: mickybart <mickybart at pygoscelis dot org>
pkbbase=gandictl-git
pkgname=('gandictl-git' 'gandictl-ddns-git')
pkgver=r36.c1821c3
pkgrel=1
arch=('x86_64')
url="https://github.com/mickybart/gandi-v5-rs"
license=('Apache-2.0')
groups=()
depends=()
makedepends=('rustup')
backup=()
source=("${pkgname}::git+https://github.com/mickybart/gandi-v5-rs"
        'LICENSE'
        'gandictl-ddns'
        'gandictl-ddns.service'
        'gandictl-ddns.timer')
sha256sums=('SKIP'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '20466cfb345d1da56fa3dd3807ad0661aeb5014fddab7cebf830596a6c91fd11'
            '0cae7e0174e4fea035f53f0b1f04f54e717781c226617e43a49402e647c8e214'
            '58a921d4834ca3ac829f5f35ba22ed855cd632d04cd2ebd4cb465de2693b3461')
# validpgpkeys=('B026EDFDDDEBC59E3F60966AF9E8AF21879815B6')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    rustup default stable

    export RUSTFLAGS="--remap-path-prefix $HOME=~"
    cargo build --release -p gandictl
}

package_gandictl-git() {
    pkgdesc="gandictl controls the gandi.net management console"
    optdepends=('gandictl-ddns-git: Dynamic DNS Updater')

    # gandictl bin
    install -d "${pkgdir}"/usr/bin
    install -m 755 -t "${pkgdir}"/usr/bin/ "${srcdir}"/$pkgname/target/release/gandictl

    # license
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "${srcdir}"/LICENSE
}

package_gandictl-ddns-git() {
    pkgdesc="Gandi Dynamic DNS Updater"
    backup=('etc/conf.d/gandictl-ddns')
    depends=('gandictl-git')

    # configuration and systemd for Dynamic DNS Update
    install -Dm644 -t "${pkgdir}"/etc/conf.d/ "${srcdir}"/gandictl-ddns
    install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system "${srcdir}"/gandictl-ddns.service
    install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system "${srcdir}"/gandictl-ddns.timer

    # license
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname/LICENSE "${srcdir}"/LICENSE
}