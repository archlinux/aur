# Maintainer: XZS <d dot f dot fischer at web dot de>
# This PKGBUILD is maintained on GitHub <https://github.com/dffischer/gnome-shell-extensions>.
# You may find it convenient to file issues and pull requests there.

pkgname=gnome-shell-extension-hidetopbar-git
pkgver=115.r3.ga7dd3d3
pkgrel=1
pkgdesc="Gnome extension to hide the top bar except in overview mode"
arch=(any)
url='https://gitlab.gnome.org/romgrk1/hidetopbar'
branch='romgrk1-main-patch-81940'
license=(GPLv2)
makedepends=('git')
conflicts=('gnome-shell-extension-hidetopbar')
provides=('gnome-shell-extension-hidetopbar')
install=gschemas.install
source=("git+$url.git#branch=$branch")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname/hidetopbar"
    git describe --long --tags | sed -r 's/extensions.gnome.org.//;s/([^-]*-g)/r\1/;s/-/./g'
}
package() {
  for function in $(declare -F | grep -Po 'package_[[:digit:]]+[[:alpha:]_]*$')
  do
    $function
  done
}
package_01_locate() {
  msg2 'Locating extension...'
  cd "$(find -name 'metadata.json' -execdir test -e extension.js \; \
    -printf '%C@ %h\n' | sort -nr | sed 's/^.* //;q' )"
  extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  destdir="$pkgdir/usr/share/gnome-shell/extensions/$extname"
}

package_02_install() {
  msg2 'Installing extension code...'
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) \
    -exec install -Dm644 -t "$destdir" '{}' +
}
package_10_locale() {
  msg2 'Installing translations...'
  (
    cd locale
    for locale in */
    do
      install -Dm644 -t "$pkgdir/usr/share/locale/$locale/LC_MESSAGES" "$locale/LC_MESSAGES"/*.po
    done
  )
}
if [ -z "$install" ]
then
  install=gschemas.install
fi

package_10_schemas() {
  msg2 'Installing schemas...'
  find -name '*.xml' -exec install -Dm644 -t "$pkgdir/usr/share/glib-2.0/schemas" '{}' +
}
depends[125]=gnome-shell

package_20_version() {
  local compatibles=($(\
    find -path ./pkg -type d -prune -o \
    -name metadata.json -exec cat '{}' \; | \
    tr -d '\n' | grep -Po '(?<="shell-version": \[)[^\[\]]*(?=\])' | \
    tr '\n," ' '\n' | grep -v -e '^$'))
  depends+=("gnome-shell>=${compatibles[0]}")
  local max="${compatibles[-1]}"
  # if [ "$max" != "$(gnome-shell --version | grep -Po '(?<=GNOME Shell )[[:digit:]]+.[[:digit:]]+')" ]; then
  #   depends+=("gnome-shell<=1:$max")
  # fi
  unset depends[125]
}
