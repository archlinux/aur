# Maintainer: techcs <techcs@protonmail.com>
pkgname=admixtools-git
pkgver=r61.b10ddcf
pkgrel=1
pkgdesc="Tools to test whether admixture occurred and more"
arch=('x86_64')
url="https://reich.hms.harvard.edu/software"
license=('custom')
depends=('gsl' 'openblas' 'gcc-fortran')
makedepends=('git' 'make')
source=("admixtools-git::git+https://github.com/Prowderypulp/AdmixTools")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname/src"

  make
}

package() {
  cd "$srcdir/$pkgname/src"

  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/lib"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"

  for bin in qpDstat qp3Pop qpAdm qpGraph; do
    if [[ -x "$bin" ]]; then
      install -Dm755 "$bin" "$pkgdir/usr/bin/$bin"
    else
      echo "Warning: Binary '$bin' not found. Skipping..."
    fi
  done

  if [[ -f "nicksrc/libnick.a" ]]; then
    install -Dm644 nicksrc/libnick.a "$pkgdir/usr/lib/libnick.a"
  fi

  if [[ -f "../README.md" ]]; then
    install -Dm644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

