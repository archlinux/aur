

pkgname=uutils-acl-git
pkgver=0.0.1.r492.b421b4e
pkgver() {
  cd uutils-acl
  printf 0.0.1."r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
pkgrel=1
pkgdesc="Rust implementation of acl"
arch=('x86_64')
url="https://github.com/uutils/acl"
license=('MIT')
depends=(gcc-libs)
makedepends=(rust git)
optdepends=("rust-src: optimize with RUSTC_BOOTSTRAP=1")
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("${pkgname%-git}::git+${url}.git")
b2sums=('SKIP')

build(){
  cd ${pkgname%-git}
  [ $RUSTC_BOOTSTRAP = 1 ] && _cargoflags='-Zbuild-std=std,panic_abort --config=profile.release.panic="immediate-abort" -Zpanic-immediate-abort'
  cargo build --profile=release-fast $_cargoflags
}

package() {
  unset optdepends
  install -Dm755 ${pkgname%-git}/target/release-fast/acl "$pkgdir"/usr/bin/uu-acl
  for _b in {ch,getf,setf}acl
    do ln -svf uu-acl "$pkgdir"/usr/bin/uu-$_b
  done
  install -Dm644 uutils-acl/LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}
}
