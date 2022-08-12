# Maintainer: nroi <nroi@mailbox.org>
pkgname=flexo-git
pkgrel=1
pkgver=1.6.7.r0.ga25011d
pkgdesc="A central pacman cache"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/nroi/flexo'
license=('MIT')
provides=("flexo")
makedepends=('cargo' 'git')
depends=('curl' 'pacman-contrib')
backup=('etc/flexo/flexo.toml')
install="${pkgname%-git}.install"
source=('git+https://github.com/nroi/flexo.git'
        'sysuser.conf'
        'flexo.install'
        'flexo.service'
)
sha256sums=('SKIP'
            'b6a618c66d3ffb9ad119b0497d2181cdd382ec870cc768606debed40716c1f4e'
            '662e8c6c4d024ec035c2c02d9298a8cb6062cfb30d02bfaecf17a9d3d9b35167'
            '0ba13ff1d92b51433635e1fbf5f1017e3e06b3e408be663acb1fbf65f344a3ad'
)

build() {
  cd "${pkgname%-git}/${pkgname%-git}"
  # To avoid the warning "Package contains reference to $srcdir"
  export CARGO_BUILD_RUSTFLAGS="--remap-path-prefix $HOME=HOME"
  cargo build --release
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 "${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/flexo.service" "${pkgdir}/usr/lib/systemd/system/flexo.service"
  install -Dm644 "${srcdir}/sysuser.conf" "${pkgdir}/usr/lib/sysusers.d/flexo.conf"
  install -Dm644 "${pkgname%-git}/${pkgname%-git}/conf/flexo.toml" "$pkgdir/etc/flexo/flexo.toml"
  install -Dm755 "${pkgname%-git}/${pkgname%-git}/target/release/flexo" "$pkgdir/usr/bin/flexo"
  install -Dm755 "${pkgname%-git}/flexo_purge_cache" "$pkgdir/usr/bin/flexo_purge_cache"
}
