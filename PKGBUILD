# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=linux-dash-git
_pkgname=linux-dash
pkgver=r585.f6d5aac
pkgrel=1
epoch=1
pkgdesc="A drop-in, low-overhead monitoring web dashboard for a linux machine."
arch=('any')
url="https://github.com/afaqurk/linux-dash"
license=('MIT')
makedepends=('git')
provides=('linux-dash')
conflicts=('linux-dash')
source=('git://github.com/afaqurk/linux-dash.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/linux-dash"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd "$srcdir/linux-dash"

  # apache config stolen from adminer:
  cat > apache.example.conf <<EOF
	Alias /${_pkgname} "/usr/share/webapps/${_pkgname}"
	<Directory "/usr/share/webapps/${_pkgname}">
		AllowOverride All
		Options FollowSymlinks
		Require all granted
		php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/"
	</Directory>
EOF

  #license
  install -Dm0644 LICENSE.md "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE

  #doc
  install -Dm0644 README.md "$pkgdir"/usr/share/doc/"$_pkgname"/README.md

  # TODO: check if apache installed first
  install -Dm0644 apache.example.conf "$pkgdir"/etc/httpd/conf/extra/httpd-"$_pkgname".conf

  _install_dir="$pkgdir"/usr/share/webapps/"$_pkgname"
  install -Dm0644 index.html "$_install_dir"/index.html
  install -Dm0644 favicon.ico "$_install_dir"/favicon.ico
  mkdir -p "$_install_dir"/css "$_install_dir"/js "$_install_dir"/server "$_install_dir"/templates "$_install_dir"/img/themes
  cp -r css/* "$_install_dir"/css/
  cp -r js/* "$_install_dir"/js/
  cp -r server/* "$_install_dir"/server/
  cp -r templates/* "$_install_dir"/templates/
  cp -r img/themes/* "$_install_dir"/img/themes/
}
