# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
# Maintainer: Allen Zhong <pdev@zhoal.pw>
pkgname=tikv
pkgver=7.6.0
pkgrel=1
pkgdesc='Distributed transactional key-value database, originally created to complement TiDB'
arch=('x86_64')
url='https://github.com/tikv/tikv'
license=('Apache')
provides=('tikv-server')
backup=(etc/tikv/tikv.toml)
depends=('tikv-pd' 'gcc-libs')
makedepends=(
    'go'
    'make'
    'rustup'
    'awk'
    'cmake'
    'gcc12'
    'gflags'
    'jemalloc'
)
source=(tikv-${pkgver}.tar.gz::https://github.com/tikv/tikv/archive/v${pkgver}.tar.gz
        tikv.service
        tikv-sysusers.conf
        tikv-tmpfiles.conf
        tikv.toml)
sha256sums=('8d7802fd613ee932d2c4517d27dfcbb6765c0509ed6f837cccbbcc947c59ba6a'
            '870b8eaf83bc0d22b05b0f3a7890660e483cf77bb1d84bc50ad04fb23068cd8c'
            '744b252e29099b0099dc41e30bc3badd33b3d661c7126af8044faa4fc2df8927'
            '935291bac6a216c6f880df9bfaec8900266413bb202ac483e79f291e1f28e9f1'
            'be2f8c6830a48da6c356db943aa55ee2f3c9c30b2e9027e7b758cab875fc8520')

prepare() {
    cd tikv-${pkgver}

    #rustup component add rustfmt-preview

    # patch Makefile
    sed -i 's/cargo build/cargo build --locked/g' Makefile

    # Remove all git operations.
    sed -i '/TIKV_BUILD_GIT_/d' Makefile


}

build() {
    cd tikv-${pkgver}

    export TIKV_BUILD_GIT_HASH=v$pkgver
    export TIKV_BUILD_GIT_TAG=v$pkgver
    export TIKV_BUILD_GIT_BRANCH=release

    # see: https://github.com/tikv/tikv/issues/16593
    export CC="gcc-12"
    export CXX="g++-12"

    # the default config in devtools has some params like "-Wp,-D_GLIBCXX_ASSERTIONS"
    # in CXXFLAGS which make the build error, so overwrite them with a set of tested
    # working ones.
    export CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions \
        -Wp,-D_FORTIFY_SOURCE=3 -Wformat -Werror=format-security \
        -fstack-clash-protection -fcf-protection \
        -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer"
    export CXXFLAGS="$CFLAGS"
    export LDFLAGS="-Wl,-O1 -Wl,--sort-common -Wl,--as-needed -Wl,-z,relro -Wl,-z,now \
         -Wl,-z,pack-relative-relocs"

    make build_dist_release
}

package() {
  # Install binary
  install -Dm755 "$srcdir/tikv-${pkgver}/target/release/tikv-ctl" "$pkgdir/usr/bin/tikv-ctl"
  install -Dm755 "$srcdir/tikv-${pkgver}/target/release/tikv-server" "$pkgdir/usr/bin/tikv-server"
  # Install systemd service
  install -Dm644 "$srcdir/tikv.service" "$pkgdir/usr/lib/systemd/system/tikv.service"
  # Install sysusers
  install -Dm644 "$srcdir/tikv-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/tikv.conf"
  # Install tmpfiles
  install -Dm644 "$srcdir/tikv-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/tikv.conf"
  # Install default config
  install -Dm644 tikv.toml "$pkgdir/etc/tikv/tikv.toml"
}

# vim: ft=sh syn=sh et
