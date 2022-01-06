# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=caja-subliminal-git
pkgver=r14.4648e2e
pkgrel=1
pkgdesc="Subliminal integration within caja file manager"
arch=('any')
url="https://github.com/Diaoul/nautilus-subliminal/tree/caja"
license=('MIT')
depends=('subliminal' 'python-caja')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Diaoul/nautilus-subliminal.git#branch=caja')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/nautilus-subliminal"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _installdir="$pkgdir/usr/share/python-caja/extensions"

  cd "$srcdir/nautilus-subliminal"
  install -Dm755 "nautilus-subliminal.py" "$_installdir/${pkgname%-git}.py"
  install -d "$_installdir/subliminal"
  cp -r ui "$_installdir/subliminal"

  for filepath in i18n/*.po; do
    filename=$(basename "$filepath")
    install -d "$_installdir/subliminal/locale/${filename##*.}/LC_MESSAGES"
    msgfmt ${filepath} -o \
      "$_installdir/subliminal/locale/${filename##*.}/LC_MESSAGES/subliminal.mo"
  done

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
