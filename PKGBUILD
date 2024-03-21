# Maintainer: AlphaJack <alphajack at tuta dot io>

# https://gitlab.archlinux.org/archlinux/packaging/packages/nginx-mod-modsecurity/-/blob/main/PKGBUILD?ref_type=heads
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=nginx-mainline-mod-modsecurity-git

pkgname="nginx-mainline-mod-coraza-git"
pkgver=r15.a746b53
pkgrel=1
pkgdesc="Coraza Nginx Connector (module for mainline nginx)"
url="https://coraza.io/"
license=("Apache-2.0")
arch=("x86_64" "armv7h" "aarch64")
provides=("nginx-mainline-mod-coraza")
conflicts=("nginx-mainline-mod-coraza")
depends=("nginx-mainline" "libcoraza")
makedepends=("git" "go" "nginx-mainline-src")
source=("git+https://github.com/corazawaf/coraza-nginx")
b2sums=("SKIP")

pkgver(){
 cd "coraza-nginx"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare(){
 mkdir -p "coraza-nginx/build"
 cd "coraza-nginx/build"
 ln -sf /usr/src/nginx/auto
 ln -sf /usr/src/nginx/src
}

build(){
 cd "coraza-nginx/build"
 /usr/src/nginx/configure --with-compat --add-dynamic-module=../ --prefix=/usr
 # broken as of a746b538a52d0b5ac13f2b5605e8ae2e5e7b6b1a (2023-11-09)
 make modules
}

package(){
 cd "coraza-nginx/build/objs"
 for mod in *.so; do
  install -D -m 755 $mod "$pkgdir/usr/lib/nginx/modules/$mod"
 done
}
