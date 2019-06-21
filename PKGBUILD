# Maintainer: Ilaï Deutel

_pkgname="scm_breeze"
pkgname="$_pkgname-git"
pkgver=1.0.0.r316.g134d101
pkgrel=1
pkgdesc='Streamline your SCM workflow.'
arch=('any')
url='https://github.com/scmbreeze/scm_breeze'
license=('MIT')
depends=('git')
optdepends=('ruby: improve performance of scm_breeze'
            'bash: shell integration'
            'zsh: shell integration')
install='scm_breeze-git.install'
source=("$pkgname::git+git://github.com/scmbreeze/$_pkgname.git"
        "scmbDir-location.patch"
        "no-updates.patch")
sha1sums=('SKIP'
          'd5379956705ba32215237072b953741006bb1d2e'
          '4212a7ccff97bcef809cb96591059d66b44b0b68')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"

  # Disable updates
  patch --forward --strip=1 --input="${srcdir}/no-updates.patch"

  # Change the location of the scm_breeze directory
  patch --forward --strip=1 --input="${srcdir}/scmbDir-location.patch"
}

package() {
  cd "$srcdir/$pkgname"

  # Install the installer
  install -Dm755 install.sh "$pkgdir/usr/bin/install-scm-breeze"

  # Install the shared files
  install -Dm755 "git.scmbrc.example" "scm_breeze.sh" \
    "scmbrc.example" -t "$pkgdir/usr/share/$_pkgname"

  # Install the libraries
  (cd "lib" && find -type f -exec install -Dm755 "{}" "$pkgdir/usr/lib/$_pkgname/{}" \;)
  ln -s "/usr/lib/$_pkgname" "$pkgdir/usr/share/$_pkgname/lib"

  # Install the license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
