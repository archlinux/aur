# Maintainer: Kyle De'Vir (QuartzDragon) <kyle.devir.mykolab.com>

pkgname=bcachefs-tools-git
pkgver=v1.25.3.r56.gda8f1d0
pkgrel=1
pkgdesc="BCacheFS filesystem utilities (Git)"
arch=('x86_64')
url="https://github.com/koverstreet/bcachefs-tools"
license=('GPL-2.0-only')

provides=(bcachefs-tools)
conflicts=(bcachefs-tools)
depends=(
  git
  bash
  gcc-libs
  libaio.so libaio
  libblkid.so libuuid.so util-linux-libs
  libkeyutils.so keyutils
  libsodium.so libsodium
  liburcu
  libz.so zlib
  libzstd.so zstd
  lz4
  libudev.so systemd-libs
  udev
)
makedepends=(
  git
  cargo
  clang
  llvm
  pkgconf
  valgrind
)

_reponame="bcachefs-tools"
_repo_url="https://github.com/koverstreet/$_reponame"

options=('!lto' '!strip')
source=("git+$_repo_url")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/$_reponame"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_reponame"

    # this uses malloc_usable_size, which is incompatible with fortification level 3
    export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
    export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

    make \
        LIBEXECDIR=/usr/lib \
        DESTDIR="${pkgdir}" \
        ROOT_SBINDIR="/usr/bin" \
        INITRAMFS_DIR="/usr/lib/initcpio/"
}

package() {
    cd "$srcdir/$_reponame"

    # this uses malloc_usable_size, which is incompatible with fortification level 3
    export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
    export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

    make \
        PREFIX="/usr" \
        LIBEXECDIR=/usr/lib \
        DESTDIR="${pkgdir}" \
        ROOT_SBINDIR="/usr/bin" \
        INITRAMFS_DIR="/usr/lib/initcpio/" \
        install

    # replace incompatible initcpio hooks
    rm -rf "${pkgdir}"/usr/lib/initcpio/*
    install -dm755 "${pkgdir}"/usr/lib/initcpio/{hooks,install}
    install -Dm644 arch/etc/initcpio/hooks/bcachefs "${pkgdir}"/usr/lib/initcpio/hooks/
    install -Dm644 arch/etc/initcpio/install/bcachefs "${pkgdir}"/usr/lib/initcpio/install/

    # package completions
    install -dm755 "${pkgdir}"/usr/share/{bash-completion/completions,fish/vendor_completions.d,zsh/site-functions}
    "${pkgdir}"/usr/bin/bcachefs completions bash > "${pkgdir}"/usr/share/bash-completion/completions/bcachefs
    "${pkgdir}"/usr/bin/bcachefs completions fish > "${pkgdir}"/usr/share/fish/vendor_completions.d/bcachefs.fish
    "${pkgdir}"/usr/bin/bcachefs completions zsh > "${pkgdir}"/usr/share/zsh/site-functions/_bcachefs
}
