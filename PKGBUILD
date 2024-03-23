# $Id$
# Maintainer: Masato TOYOSHIMA <phoepsilonix@gmail.com>
# Contributor: Morgan <morganamilo@archlinux.org>
pkgname=paru-static
_pkgname=paru
pkgver=2.0.3
pkgrel=1
pkgdesc='Feature packed AUR helper'
url='https://github.com/morganamilo/paru'
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Morganamilo/paru/archive/v$pkgver.tar.gz"
        git+https://aur.archlinux.org/pacman-static.git)
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL-3.0-or-later')
makedepends=('rustup' 'cargo' 'musl' 'meson' 'kernel-headers-musl' 'lld' 'binutils')
depends=('git' 'pacman' 'paru')
#conflicts=('paru')
#replaces=('paru')
optdepends=('bat: colored pkgbuild printing' 'devtools: build in chroot and downloading pkgbuilds')
sha256sums=('ccf6defc4884d580a4b813cc40323a0389ffc9aa4bdc55f3764a46b235dfe1e0'
            'SKIP')

export LTOFLAGS+=" -ffat-lto-objects"
# musl build for openssl-sys
export PKG_CONFIG_ALLOW_CROSS=1
export RUSTUP_TOOLCHAIN=stable
case "$CARCH" in
  "armv6h")
    ARCH="arm"
    ;;
  "armv7h")
    ARCH="armv7"
    ;;
  "riscv64")
    ARCH="riscv64gc"
    ;;
  "pentium4")
    ARCH="x86_64"
    ;;
  *)
    ARCH=$CARCH
    ;;
esac
[[ $(rustup target list | grep "$ARCH"- | grep musl) ]] && TARGET=$(rustup target list | grep "$ARCH"- |grep musl|head -n1|awk '{ print $1 }') || TARGET=$(rustup target list | grep "$ARCH"- |grep -v musl|head -n1| awk '{print $1}')

checkver() {
  test "$(echo "$@" | tr " " "\n" | sort -Vr | head -n 1)" == "$1";
}

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  echo $TARGET
  rustup target add $TARGET
  cargo fetch --locked --target $TARGET
}

build () {
  cd $srcdir/pacman-static

  # If pacman-static(6.1.0) is not installed, build and install it.(Because it requires libalpm.a.)
  # Build and install pacman-static if the version is not greater than or not equal to 6.1.0-1 or if the package cannot read symbols in the static link library(libalpm.a).
  if ! checkver $(LC_ALL=C pacman -Qi pacman-static|grep Version|grep -Eo "([0-9]+.[0-9]+.[0-9]+)-[0-9]+") "6.1.0-1" || [[ ! $(LC_ALL=C objdump --syms /usr/lib/pacman/lib/libalpm.a | grep -E "\.text.* alpm_version") ]] ; then
    # Addition of -ffat-lto-objects to LTOFLAGS.(prevent static lib mangling)
    sed -r "/(export LDFLAGS=.*)/s/(.+)/export LTOFLAGS+=' -ffat-lto-objects'\n\1/" PKGBUILD -i
    makepkg -si --skippgpcheck --noconfirm
  fi

  # paru
  cd "$srcdir/$_pkgname-$pkgver"
  if pacman -T pacman-git > /dev/null; then
    _features+="git,"
  fi
  if [[ $TARGET =~ musl ]]; then
    _features+="static,"
  fi

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  if [[ $CARCH == aarch64 ]]; then
    _features+="generate,"
  fi

  if [[ $CARCH == x86_64 ]]; then
    export RUSTFLAGS="-C link-self-contained=on -C strip=symbols -C no-redzone=y -C overflow-checks=y -C lto=fat -C embed-bitcode=y -C codegen-units=1 -C opt-level=z -C control-flow-guard=y -C link-arg=-fuse-ld=lld -C link-arg=-Wp,-D_FORTIFY_SOURCE=2 -C link-arg=-U_FORTIFY_SOURCE -C link-arg=-D_FORTIFY_SOURCE=2 -C link-arg=-fPIE -C link-arg=-fpie -C link-arg=-Wl,-z,relro,-z,now",

  fi
  cargo build --frozen --features "${_features:-}" --release --target-dir target --target $TARGET
  #./scripts/mkmo locale/
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 target/$TARGET/release/paru "${pkgdir}/usr/bin/paru-static"
  #install -Dm644 paru.conf "${pkgdir}/etc/paru.conf"

  #install -Dm644 man/paru.8 "$pkgdir/usr/share/man/man8/paru.8"
  #install -Dm644 man/paru.conf.5 "$pkgdir/usr/share/man/man5/paru.conf.5"

  #install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/paru.bash"
  #install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/paru.fish"
  #install -Dm644 completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_paru"

  #install -d "$pkgdir/usr/share/"
  #cp -r locale "$pkgdir/usr/share/"
}
