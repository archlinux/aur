# Maintainer: James An <james@jamesan.ca>
# Contributor: Tess 'socketwench' Flynn <tess@deninet.com>

pkgname=drush-git
_pkgname=${pkgname%-git}
pkgver=8.1.16
pkgrel=1
pkgdesc='The Drupal command-line shell, git version.'
arch=('any')
url="http://$_pkgname.org"
license=('GPL')
depends=('bash' 'php-composer' 'php-gd')
makedepends=('git')
optdepends=('bash-completion')
#~ checkdepends=('bzr' 'sqlite')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(docs emptydirs)
install=$pkgname.install
source=("$_pkgname"::"git+https://github.com/$_pkgname-ops/$_pkgname.git#tag=$pkgver"
        "php.ini")
md5sums=('SKIP'
         '9627e7e568fa7933fe32b44ad21b219f')

#~ pkgver() {
    #~ cd "$_pkgname"
    #~ (
        #~ set -o pipefail
        #~ git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        #~ printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    #~ ) 2>/dev/null
#~ }

prepare() {
  cd "$_pkgname"

  sed '/"git-commit":/d;/"git-version":/d' box.json.dist >| box.json

  composer --no-interaction install --prefer-source
}

#~ build() {
  #~ cd "$_pkgname"

  #~ php -d phar.readonly=Off /usr/bin/php-box build
#~ }

check() {
  cd "$_pkgname"

  #~ UNISH_DRUPAL_MAJOR_VERSION=7 UNISH_DB_URL=sqlite://test ./unish.sh --verbose --exclude-group slow
}

package() {
  cd "$_pkgname"

  install --directory "$pkgdir/usr/bin"
  install --directory "$pkgdir/usr/share/doc/$_pkgname"
  install --directory "$pkgdir/usr/share/webapps/$_pkgname"

  # Derive space-separated list of folders and files to copy:
  files="$(egrep '"(files|directories)"' box.json | sed -r -e 's/^.*\[(.*)\].*$/\1/'  -e 's/(docs|drush.complete.sh|examples|README.md)//g' | tr -d '",')"
  docs="README.md docs examples"
  cp --archive --target-directory "$pkgdir/usr/share/webapps/$_pkgname" $files
  cp --archive --target-directory "$pkgdir/usr/share/doc/$_pkgname" $docs
  for file in $(find vendor -name '*.php' -type f | egrep -v '\b(phing|(t|T)est(|s))\b'); do
    install -Dm644 {,"$pkgdir/usr/share/webapps/$_pkgname/"}$file
  done

  install -Dm644 "$_pkgname.complete.sh" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 ../php.ini "$pkgdir/etc/php/conf.d/$_pkgname.ini"
  ln -s "/usr/share/webapps/$_pkgname/$_pkgname.php" "$pkgdir/usr/bin/$_pkgname"

  # Symlink upstream's hard-coded drush base path
  #~ ln -s "/usr/share/webapps/$_pkgname" "$pkgdir/usr/share/$_pkgname"

  install -Dm644 -o http -g http "examples/example.aliases.${_pkgname}rc.php" "${pkgdir}/etc/$_pkgname/aliases.${_pkgname}rc.php"
  install -Dm644 -o http -g http "examples/example.${_pkgname}rc.php" "${pkgdir}/etc/$_pkgname/${_pkgname}rc.php"
}
