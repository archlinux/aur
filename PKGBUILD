# Maintainer: Artur Taranchiev <ewok@ewok.ru>
_pkgname=todoist-add
pkgname=${_pkgname}-git
pkgver=r15.257b2e1
pkgrel=1
pkgdesc="Quick Add Todoist tasks, from the command line."
arch=('x86_64' 'i686')
url="https://github.com/jeffgreenca/todoist-add"
license=('MIT')
makedepends=('python3' 'git' 'python-virtualenv')
options=('!strip' '!emptydirs')
source=("${pkgname}::git://github.com/jeffgreenca/todoist-add.git")
md5sums=('SKIP')
pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
prepare() {
 virtualenv -p python3 "$srcdir/venv"
 source "$srcdir/venv/bin/activate"
 pip install todoist-python==8.0.0 PyInstaller==3.4
}
build() {
 $srcdir/venv/bin/pyinstaller --distpath "$srcdir/dist" --onefile "$srcdir/$pkgname/td.py" --name $_pkgname
}
package() {
  install -Dm755 "$srcdir/dist/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  ln -s  "$_pkgname" "$pkgdir/usr/bin/td"
  mkdir -p "$pkgdir/usr/share/licenses/$_pkgname"
  install -m 0644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/"
}
