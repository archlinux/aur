# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

_pkgname="scm_breeze"
pkgname="$_pkgname-git"
pkgver=1.0.0.r413.g0074697
pkgrel=1
pkgdesc='Streamline your SCM workflow.'
arch=('any')
url='https://github.com/scmbreeze/scm_breeze'
license=('MIT')
depends=('git' 'ruby' 'bash')
optdepends=('zsh: shell integration')
install='scm_breeze-git.install'
source=("$pkgname::git+https://github.com/scmbreeze/$_pkgname.git"
        "scmbDir-location.patch"
        "no-updates.patch")
b2sums=('SKIP'
        'd9060fa344c391f9ac94a3d726901354bc3609b231457ca2a934038489c84dc6c9383cd8155c88e082ef620b4dcaae1565f5125c8d804bfb2f0d7ff2c0e25bf3'
        '6f19678089d03af57f42909edb94cc83cfe8946f164b33a1ac8c6fc26e5f8363c2234c76688fe294f8db3b3da0cd3bcedf343899c307a1ae04c7d813c789452c')

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
